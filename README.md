# KiloEx security audit — forwarder-relayed price-feed access-control break (+ relaunch-fix verification)

**Start here → [`REPORT.md`](./REPORT.md)** (full findings, evidence, verdict).

## One-paragraph summary
The two addresses handed to this audit (`0xd649…4e18` Base, `0xcc6a…bef4` BSC) are **the attacker's own
exploit contracts, not KiloEx** (owner = attacker; flash-loan callbacks). The real KiloEx system —
an upgradeable **MinimalForwarder/PositionKeeper + KiloPriceFeed + PositionRouter + Vault** on each chain —
was reconstructed from the exploit calldata and on-chain storage. Root cause (**Critical**, both chains):
`KiloPriceFeed.setPrices` authorized its caller with `require(msg.sender == trustedForwarder)`, while the
forwarder's `execute()` (a stock OZ MinimalForwarder) verified only `signer==req.from` + nonce and **never
checked `isKeeper(req.from)`** — a guard its own sibling relay function has. So anyone could self-sign
`{from: their EOA, to: priceFeed, data: setPrices(arbitrary)}`, land `msg.sender==forwarder`, set any price,
and drain the vault via a perp position. Measured Base loss **3,323,170.89 USDC**. The **relaunch fix is
verified on Base and BSC**: `execute()` now reverts `"not allowed"` unconditionally and `setPrices` was
removed from the price feed (current fixed forwarder impl is byte-identical across the two chains). The price
feed's "trust the forwarder by address" **design is unchanged**, so the guarantee is per-implementation and
per-config — see the residual caveat in the report.

## Layout
- `REPORT.md` — the audit (findings, fix verification, entry-point ledger, dependency map, rebuttal register, limits).
- `audit/resolved_system.md` — full address/slot/impl map (Base + BSC), exploit facts.
- `audit/analysis/evmole_execute_vs_siblings.txt` — the structural proof (execute reads no keeper slot; sibling does; setter removed).
- `audit/analysis/simulations.md` — the live `eth_call` proofs (bug reproduced pre-fix; reverts post-fix; both chains).
- `audit/poc/poc_freshkey.py` + `audit/poc/RESULTS.md` — **PoC**: a freshly-generated zero-privilege key sets an arbitrary price (eth_call + anvil-fork committed tx); at-risk = 99.98% of the 3.32M USDC pool.
- `audit/decomp/` — heimdall decompilations (vuln/current forwarder, exploit/current price feed).
- `audit/base/`, `audit/bsc/` — raw runtime bytecode + decoded exploit calldata.

## Reproduce
Decompiler: heimdall 0.9.2. Structure/storage: `evmole` 0.9.3. RPC: Base `mainnet.base.org`,
BSC `bsc-dataseed.binance.org` (+ archive `bsc-mainnet.public.blastapi.io` to locate the BSC exploit tx).
Sources for verified deps: Etherscan V2 `getsourcecode`; Base contract metadata via Blockscout.
