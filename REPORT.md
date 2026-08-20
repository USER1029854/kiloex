# KiloEx — Security Audit: forwarder-relayed price-feed access-control break, and verification of the relaunch fix

**Scope as handed:** two addresses tagged "KiloEx contract" — `0xd649…4e18` (Base) and `0xcc6a…bef4` (BSC) — plus the roles "KiloPriceFeed / MinimalForwarder / PositionKeeper" to resolve, with the stated attack shape *"signature-spoof → forged role → setPrices"* and the instruction to *"verify the redeploy actually fixed the forwarder access control."*

**Chains:** Base (8453) and BNB Smart Chain (56).
**Date of work:** 2026-08-20. **Incident date on-chain:** 2025-04-14 (Base block 28933730; BSC block 48358304).

---

## 0. TL;DR / verdict

1. **The two addresses I was handed are NOT KiloEx contracts. They are the attacker's own exploit contracts** (owner = attacker, contain flash-loan callbacks, created by the attacker). This premise correction is itself a finding — see §1. The real KiloEx system had to be reconstructed from the exploit calldata and on-chain storage; it resolves to an upgradeable **MinimalForwarder/PositionKeeper + KiloPriceFeed + PositionRouter + Vault** on each chain (§2).

2. **Confirmed root cause (Critical), both chains.** The KiloEx `KiloPriceFeed.setPrices()` authorized its caller with `require(msg.sender == trustedForwarder)` — i.e. it trusted *the forwarder contract itself* and delegated the "is this an authorized price keeper?" decision to the forwarder. The forwarder's `execute((address,address,uint256,uint256,uint256,bytes),bytes)` was a stock OpenZeppelin `MinimalForwarder`: it verified only that the EIP-712 signature matched `req.from` and that the nonce matched — it **did not** check `isKeeper(req.from)` or `approvedRouters(req.to)`, even though the forwarder's *sibling* relay function does. Net effect: **anyone could self-sign a request `{from: their own EOA, to: KiloPriceFeed, data: setPrices(arbitrary)}`, and the forwarder would relay it to `setPrices` with `msg.sender == forwarder`, passing the gate.** Manipulated price → open+close a perp position through the router → drain the vault. Verified by decompilation, storage-layout analysis, live on-chain reads, and **direct simulation** (the attacker's exact nonce-0 payload returns success at the pre-exploit block). §3.

3. **Realized loss I could measure:** **3,323,170.89 USDC on Base** across 3 transactions (each = two `setPrices` calls bracketing a position). BSC leg confirmed on-chain (same technique, same attacker, same spoof EOA). Funds *at risk* under the broken invariant were the entire perp collateral/vault balance of every market on every deployment, not just what was withdrawn. §3, §7.

4. **Relaunch fix — verified, both chains: the forwarder path is closed.** The forwarder proxy was upgraded to an implementation whose `execute()` **reverts unconditionally with `"not allowed"`** (no `SLOAD`, no caller check — the function is disabled), and the KiloPriceFeed was upgraded to an implementation that **no longer exposes `setPrices` (`0xac9fd279`) at all**. The current fixed forwarder implementation is **byte-identical on Base and BSC**. The specific exploit is no longer reachable. §4.

5. **Residual / structural caveat (the fix is narrow, not a redesign).** The price feed *still* authorizes callers by address-equality against the forwarder/router slots (`0x97`/`0x9b`) rather than by verifying the original signer is a keeper. Safety now rests on two *mutable* facts: (a) `execute()` staying disabled, and (b) the forwarder's remaining relay entrypoint (`0x2b3102be`) staying keeper-gated. Both are one proxy upgrade away from change, and both are gov/owner-controlled. This is an operational guarantee, not a structural one. §4.3, §5.

**Confidence:** high on the root cause and on the fix (decompiled + simulated on live state, both chains). The KiloEx implementations are all **unverified**; every claim below is anchored to bytecode I decompiled, storage I read, or calls I simulated — cited inline. Items I could not fully close are in §9.

---

## 1. Premise correction (finding in its own right)

The discovery step labeled `0xd649…4e18` / `0xcc6a…bef4` as "KiloEx contract (Base/BSC)". They are not.

| Check | Base `0xd649…4e18` | BSC `0xcc6a…bef4` | Method |
|---|---|---|---|
| `owner()` (`0x8da5cb5b`) | `0x00fac9…4bcbd` (**attacker**) | `0x00fac9…4bcbd` (**attacker**) | `eth_call` |
| Third function | `uniswapV3FlashCallback` (`0xe9cbafb0`) | `pancakeV3FlashCallback` (`0xa1d48336`) | 4byte on dispatch selectors |
| Creator | attacker, tx `0x6f3300…48f4b` | attacker, block 48357841 | Blockscout / archive `eth_getCode` bisection |
| Verified source | no | no | Etherscan V2 / Blockscout |
| Entry `0x7493b4a4` | attacker's exploit orchestrator (wraps flash-loan + the KiloEx calls) | same | calldata decode (§3.2) |

So the address "to of the exploit tx" is the **attacker's contract that the attacker called**, holding a flash-loan callback and an `owner`. The genuinely interesting contracts — the forwarder and the price feed — are reached only by decoding what that contract *calls*. Auditing the handed address in isolation would have found an owner-gated flash wrapper and concluded "nothing here." The correction is the reason the rest of this report exists.

---

## 2. Resolving the real system

`0xd649` (Base) and `0xcc6a` (BSC) each hard-code three constants (extracted from runtime bytecode via PUSH20/PUSH32 scan): the flash pool, the stablecoin, and `0x551f31…` (an EOA, no code on either chain). The KiloEx contracts proper appear only inside the **exploit calldata** to `0x7493b4a4`, which I decoded (§3.2). Every KiloEx contract is an **EIP-1967 `TransparentUpgradeableProxy`**; I resolved each to its implementation via the impl storage slot `0x360894…382bbc`, at both the exploit block and latest.

Full address map, storage slots, and impl history: **`audit/resolved_system.md`**. Decompiled sources: **`audit/decomp/`**. Raw bytecode: **`audit/base/*.hex`, `audit/bsc/*.hex`**.

The critical property — *all four KiloEx implementations on Base are unverified* — is exactly the small-bespoke-deployment pattern where danger hides, so everything downstream is decompilation + simulation, not source reading. I got a decompiler (heimdall 0.9.2, built from source) and used `evmole` for storage/selector structure; the two agree.

**Value/authority model (what has to stay true):** KiloEx is a perp DEX. Collateral (USDC on Base / USDT on BSC) sits in the Vault; the internal unit is **VUSD**; positions are priced by **KiloPriceFeed**. The load-bearing invariant for this incident:

> **INV-PRICE:** a price in `KiloPriceFeed` may only be written by an authorized keeper (an address in `isKeeper`), because every position's PnL and solvency is computed against it.

The exploit is a reachable state that breaks INV-PRICE.

---

## 3. Finding #1 (Critical) — forwarder relays un-keeper-checked `setPrices`; attacker sets arbitrary prices and drains the vault

### 3.1 The two halves of the broken invariant

**Half A — the price feed trusts the forwarder, not the signer.** Exploit-time `KiloPriceFeed` impl `0xa307f7f9…` (Base), `setPrices` = selector `0xac9fd279`. Decompiled (`audit/decomp/pf_exploit/decompiled.sol`), the access gate is:

```solidity
// heimdall renders the negation inverted; the error string is authoritative
require(msg.sender == trustedForwarder, "DelegateCollection: not trustedForwarder");
```

`trustedForwarder` is storage slot `0x97`. I read it on the live proxy: slot `0x97` = `0x3274b668…` = **the forwarder** (at the exploit block and now). So `setPrices` authorization = *"was I called by the forwarder contract?"* — nothing about which keeper originated the request. (evmole confirms `setPrices` reads slots `0x97` and `0x9b` and **does not** read any `isKeeper` mapping.)

**Half B — the forwarder relays anyone's self-signed request.** Exploit-time forwarder impl `0xbed75e25…` (Base). `execute` = selector `0x47153f82`, signature `execute((address,address,uint256,uint256,uint256,bytes),bytes)`. Decompiled (`audit/decomp/fwd_vuln/decompiled.sol`) it is a stock OpenZeppelin `MinimalForwarder` — the error strings `"MinimalForwarder: signature does not match request"` and `"ECDSA: invalid signature"` are present verbatim. Its checks are exactly:

1. recover signer from EIP-712 hash and `require(signer == req.from)`;
2. `require(nonce[req.from] == req.nonce)` then bump it;
3. `call req.to` with `req.from` appended (ERC-2771 style).

**What it does NOT do:** it never reads `isKeeper` (slot `0xce`) or `approvedRouters` (slot `0xd3`). I proved this structurally with evmole — `execute (0x47153f82)` reads only slots `0x36`,`0x37` (EIP-712 domain) and `0x6a` (nonces); it touches neither whitelist slot — **while the sibling relay function `0x2b3102be` reads both `0xce` and `0xd3`** and contains `require(bytes1(storage_map[...]))` (a whitelist bool check) in addition to the same signature check. The guard exists in the sibling and was dropped from `execute`. That is the bug, and the codebase is its own specification here.

### 3.2 The exact exploit call sequence (decoded from the real tx)

Base tx `0x6b378c…228edd` calls the attacker contract `0xd649` at `0x7493b4a4`. Decoding its 996-byte `execute` sub-calls (script + output preserved; `audit/base/exec_nonce0_calldata.hex`):

```
forwarder.execute(
  req = { from : 0x551f3110…a954c,          // attacker's OWN eoa (isKeeper=false)
          to   : 0xfdc7bc3a…627ed,          // KiloPriceFeed proxy
          value: 0, gas: 1_000_000, nonce: 0,
          data : 0xac9fd279 …548 bytes… },  // setPrices(address[],uint256[],…)
  signature = 0xf541a5f4…a0a 1c )            // valid ECDSA over req, signed by 0x551f31
```

Two such `execute` calls per tx (nonce 0 then nonce 1): the first `setPrices` pumps the market's price, the attacker opens+closes a position through the router (`createIncreasePosition 0x00a30f93` / `createDecreasePosition 0xfc2ee01d`, both present in the same top-level calldata), the second `setPrices` resets it. The whole thing is wrapped in a Uniswap-V3 USDC flash loan from pool `0xd0b53d92…`.

**Why it passes every check:**
- `signer == req.from`? Yes — `req.from = 0x551f31` is the attacker's *own* key, so they produce a valid signature. (Confirmed: `getNonce(0x551f31)` on the forwarder advanced 0→6 over the 3 Base txs — normal nonce use by an address the attacker controls; and `isKeeper(0x551f31)=false` at every block checked.)
- forwarder checks `isKeeper(req.from)`? **No such check** (§3.1 Half B).
- `setPrices` checks the caller? Yes — `msg.sender == forwarder` — which is exactly who's calling (§3.1 Half A).

So "signature-spoof → forged role" is more precisely: **a perfectly valid self-signature from a non-keeper, laundered into `msg.sender == forwarder` by an under-guarded relay.** No signature forgery or key compromise is required; the "role" (authorized price poster) is forged by routing through the trusted forwarder.

### 3.3 Live proof (not just reading)

I replayed the attacker's **exact** nonce-0 `execute` calldata against the forwarder proxy `0x3274b668` with `eth_call`:

- **@ Base block 28933729 (pre-first-exploit, vulnerable impl, nonce still 0), from the attacker EOA:** returns `0x…0001…` — **success** (the relay reaches `setPrices` and returns). This is a behavioral proof that an unprivileged, non-keeper, self-signed request set prices.
- **@ BSC block 48358303 (pre-exploit, vulnerable impl):** same call returns **success**. Same bug, second chain.

### 3.4 Impact / severity

- **Type:** unauthorized access to a fund-controlling function (price authority) → economic drain. This qualifies on the access-control bar irrespective of amount; it also clears the economic bar overwhelmingly (profit ≈ vault size, independent of attacker stake — the flash loan supplies the working capital, repaid same-tx).
- **Funds at risk (size to the invariant, not the PoC):** every position and all collateral denominated against any market whose price `setPrices` could write — i.e. the full perp book / vault on each deployment KiloEx ran (Base, BSC, and per public record opBNB, Taiko, Manta). **Measured realized loss on Base = 3,323,170.89 USDC** (§7); BSC leg on-chain-confirmed.
- **Minimal fix (and the one actually shipped):** the forwarder must enforce `isKeeper(req.from)` (and/or `approvedRouters(req.to)`) inside `execute`, and/or the price feed must verify the *originator* is a keeper rather than trusting the forwarder address. KiloEx instead removed the paths (see §4) — effective, though narrower than repairing the trust model.
- **Falsifier:** if `execute` had read slot `0xce`/`0xd3` (it doesn't), or if `setPrices` had recovered `_msgSender()` and checked `isKeeper` on it (it checks `msg.sender==forwarder`), or if `0x551f31` were actually a keeper (it isn't) — any one would break the finding. None holds.

---

## 4. Verifying the relaunch fix

### 4.1 The upgrade happened
Impl-slot reads on the forwarder proxy `0x3274b668`: at exploit block `0xbed75e25…` (vulnerable); at latest `0x9ddb41db…` (different — an upgrade occurred). Same story for the price feed (`0xa307f7f9…` → `0x52cbc032…`).

### 4.2 `execute()` is disabled (forwarder)
Disassembling the current forwarder impl `0x9ddb41db…`, the `0x47153f82` dispatch lands at `0x15ea`, decodes its calldata, then hits at `0x1639` an **unconditional** `REVERT` carrying `"not allowed"` — there is no `SLOAD`, no `CALLER`, no branch before it (`audit/decomp/fwd_curr/` + disassembly in-report). Behaviorally: calling `execute` with the attacker's payload now reverts `"not allowed"` **from every sender I tried** — attacker, gov, owner, the router, and `0x551f31` — confirming it is not a caller gate but a hard disable. evmole agrees (`execute` reads zero storage in the fixed impl).

### 4.3 `setPrices` is removed (price feed)
The current price feed impl `0x52cbc032…` **does not contain selector `0xac9fd279` at all** (function-selector enumeration). Calling `ac9fd279` on the live proxy now reverts. The replacement price entrypoints are `0x4f0840be` and `0xd0b9ff99` (custom, `payable`, take `bytes` blobs + arrays — consistent with a pull-oracle/Pyth-style update). **They still read slots `0x97` (forwarder) and `0x9b` (router)** as their caller gate — i.e. the *trust model is unchanged*; only the reachable relay was removed.

### 4.4 Cross-chain parity (weakest deployment governs)
- BSC forwarder proxy `0xad37c86c…`; current impl `0x0e23c0b3…` is **byte-identical** to Base's current fixed impl `0x9ddb41db…` (full-bytecode compare, equal). Its `execute()` reverts `"not allowed"`; exploit-time BSC impl was `0xd8240094…` and was live-exploitable (§3.3).
- BSC price feed proxy `0xaf457b72…`, current impl `0x58295901…`. slot `0x97` = the BSC forwarder above.
Both chains carry the same fix. I could not read opBNB/Taiko/Manta from the endpoints available here — those deployments are **unassessed** and flagged in §9.

### 4.5 Verdict on the fix
**The specific exploit is closed on Base and BSC** (relay disabled + vulnerable setter removed). **But the underlying "authorize by forwarder address, not by keyed keeper" design persists in the price feed.** This makes the current safety a property of *mutable implementation + config*, not of structure:
- Re-enabling any ungated relay on the forwarder, or adding an ungated caller to price-feed slot `0x97`/`0x9b`, reintroduces the exact class. Owner/gov can upgrade either proxy in one tx (forwarder owner Base `0x54e8742a…`, BSC `0xdff3c7ce…`; both proxies are admin-upgradeable). Report consumers should treat "fixed" as "fixed in the currently-deployed implementations," expiring on the next upgrade.

---

## 5. Entry-point ledger (forwarder + price feed; the money-relevant surface)

Forwarder (exploit-time impl), every external selector and its guard:

| selector | name | guard (exploit-time) | note |
|---|---|---|---|
| `0x47153f82` | `execute(ForwardRequest,bytes)` | sig(signer==from)+nonce **only** | **VULN** — no keeper/router check → Finding #1. Now disabled. |
| `0x2b3102be` | batch relay `(address[],bytes)` | ReentrancyGuard + sig + **whitelist bool** (`0xce`/`0xd3`) | sibling with the guard `execute` lacked; keeper-gated → not attacker-usable |
| `0xccf2626f`,`0xef0a2e36` | batch price ops `(uint256[]×3)` | read `isKeeper`+`approvedRouters` | keeper-gated |
| `0xbf5d3bdb` | `verify(...)` view | — | view; standard MinimalForwarder verify |
| `0x2d0335ab` | `getNonce(address)` | view | — |
| `0x6ba42aaa`/`0xd1b9e853` | `isKeeper`/`setKeeper(address,bool)` | setter: owner (`slot1`) | keeper admin |
| `0x445b1e4b`/`0xd5eebede` | `approvedRouters`/`setApprovedRouter` | setter: owner | router admin |
| `0x12d43a51`,`0xcfad57a2`,`0x7bc6729b`,`0x3fc7843d` | `gov`/`setGov`/`acceptGov`/`newGov` | gov 2-step | privileged |
| `0x8da5cb5b`,`0x13af4035`,`0xebbc4965`,`0xd4ee1d90` | `owner`/`setOwner`/`acceptOwner`/`newOwner` | owner 2-step | privileged |
| `0x6c28e349` | `initialize(address,uint256,uint256,uint256,address)` | init-once | see §9 (impl-level init not proxy-exploitable) |
| `0x217a4b70` | `quoteToken()` | view | = USDC on Base |

Price feed (exploit-time impl): `setPrices 0xac9fd279` gated `msg.sender==trustedForwarder` (**the abused gate**); the position-mutating funcs (`0x1d112718`,`0x3539179e`,`0x5bb1d7bd`,`0x65cd4fc9`,`0x66db541e`,`0x6bd72647`,`0x8d04bf0a`,`0x8fb30e12`,`0xa98440c5`) read the forwarder/router/vault slots and slot `0x9c` (a second ERC-2771 forwarder) — same "trust the forwarder" pattern; `0x485cc955` = `initialize(address,address)`. Router/Vault were enumerated only shallowly (see §9) — they behaved *correctly* given a manipulated price, so they are downstream of the bug, not a second break.

---

## 6. Dependency map & why nothing else here is a separate exploit

- **Writer→reader that matters:** `setPrices` (writer of price) ↔ router/position PnL (reader). The attacker interleaves writer-before-reader **within a single tx** (pump → open/close → reset). The break is purely the writer's access control; the readers are correct.
- **Flash-loan composition:** working capital only; repaid same tx. Not itself a flaw.
- **Splitting / rounding / degenerate states:** not required — the exploit is authorization, not arithmetic — so I did not need an empty-pool/first-depositor edge. (Those remain worth a dedicated review of the router/vault math, which I scoped out; §9.)
- **Reentrancy:** the vulnerable `execute` has no reentrancy guard, but it did not need one for this exploit; the sibling `0x2b3102be` does guard. No read-only-reentrancy path into price reads was pursued (scoped out).

---

## 7. Solvency / loss reconciliation

Measured from tx receipts (USDC = `0x833589fc`, Transfer→attacker EOA):

| Base tx | USDC to attacker |
|---|---|
| `0x6b378c…` | 3,125,495.72 |
| `0xde7f5e…` | 186,595.77 |
| `0xf0fcce…` | 11,079.39 |
| **total** | **3,323,170.89** |

This is the value that left via the manipulated-price positions on Base. It is *realized* loss; **severity is sized to the invariant** (all collateral pricable by `setPrices`, all chains), which is materially larger. BSC realized loss was not summed exhaustively (endpoint limits, §9) but the exploit tx is identified and the mechanism is identical.

---

## 8. Off-chain components in the trust path

- **The price keeper / signer.** Normal operation depends on an off-chain keeper signing EIP-712 price requests that a relayer submits via `execute`. The vulnerability made that keeper irrelevant (anyone could self-sign), but going forward the design still assumes: whoever holds keeper keys (or is `isKeeper`/`approvedRouters`) is honest and their key uncompromised. There is **no on-chain sanity bound** on the prices `setPrices`/the new setters accept (no deviation cap, no staleness gate visible in the setter's guard) — so a compromised or faulty keeper can still write an arbitrary price. That is now the residual single point of failure; it is *authorized* input, but the code imposes **no bound** on it — worth stating explicitly because "manager-attested" is not the same as "range-checked."
- **The new pull-oracle path (`0x4f0840be`/`0xd0b9ff99`).** These consume signed `bytes` blobs (Pyth-shaped). I did not have their verifier/config to audit whether freshness, confidence, and the requested feed-id are validated on-chain — **unassessed** (§9). A pull oracle that degrades to stale-but-well-formed answers is the classic follow-on risk and should be reviewed against the actual verifier contract.

---

## 9. What I could not read / assumptions / rebuttal register

**Rebuttal register (candidates killed):**
- *"`0x551f31` is a real KiloEx keeper, so this is just a keeper acting"* — **killed:** `isKeeper(0x551f31)=false` at exploit block and now (on-chain read). It is the attacker's own key.
- *"The forwarder's `execute` does check the keeper, decompiler just hid it"* — **killed:** evmole storage-read set for `0x47153f82` excludes slots `0xce`/`0xd3`; the sibling `0x2b3102be` includes them; live simulation of the exact payload succeeds pre-fix.
- *"`setPrices` uses `_msgSender()` and checks a keeper"* — **killed:** its gate is `msg.sender==trustedForwarder` (decompiled string `"…: not trustedForwarder"`; evmole shows it reads slot `0x97`, not a keeper map).
- *"The relaunch only moved the vulnerable impl, didn't fix it"* — **killed:** current `execute` = unconditional `revert("not allowed")` (disassembly + multi-sender simulation), and `setPrices` selector is absent from the current price-feed impl (selector enumeration + live revert).

**Could not read / unassessed (explicit):**
- All KiloEx **implementations are unverified**; analysis is decompilation + simulation. Byte-level absence of a pattern was never treated as proof — every "not present" is backed by disassembly/simulation.
- **Router `0x796f1793` and Vault `0x7bc8d56c` internals** were only shallow-audited (role + behavior in the exploit). Their position math, VUSD mint/burn accounting, and fee/rounding paths are **not** fully audited here; they are downstream of the price break but deserve their own pass. A clean result on Finding #1 does **not** certify the vault's own arithmetic.
- **The new price setters `0x4f0840be`/`0xd0b9ff99`** and their oracle verifier/config are **unassessed** (§8).
- **opBNB / Taiko / Manta deployments** were not reachable from the endpoints available in this environment — **unassessed**; the "weakest deployment governs" rule means the clean Base/BSC result must not be read as covering them.
- **BSC full loss total** not summed (free-RPC range/rate limits); BSC required an archive node (`bsc-mainnet.public.blastapi.io`) and block-scan to locate the exploit tx `0x1aaf5d1d…`.
- Implementation-level `initialize` on the forwarder/price-feed impls: an uninitialized *implementation* is not proxy-exploitable for fund theft here (state lives in the proxy), so I did not chase it; noted for completeness.

**Bottom line:** the handed premise was wrong (attacker contracts, not KiloEx); the real bug is a Critical forwarder-relayed price-authority break, confirmed live on both chains; the relaunch **does** close it on Base and BSC by disabling the relay and removing the setter, but the price feed's "trust the forwarder by address" design is intact, so the guarantee is operational (per-implementation, per-config) and expires on the next upgrade or on any other deployment not verified here.
