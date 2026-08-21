# Current-state adversarial re-audit — "is anything at risk today?" (Base, latest block)

Impls confirmed unchanged at latest: forwarder 0x9ddb41db, price feed 0x52cbc032.
Every price-setting path simulated from the attacker EOA 0x00fac9 (unprivileged):

| path | from | result |
|---|---|---|
| forwarder execute 0x47153f82 | attacker | revert "not allowed" (disabled) |
| forwarder batch relay 0x2b3102be | attacker | revert (keeper-gated) |
| forwarder price batch 0xccf2626f | attacker | revert "keeper: not allowed" |
| forwarder price batch 0xef0a2e36 | attacker | revert "keeper: not allowed" |
| price feed old setPrices 0xac9fd279 | attacker | revert (selector removed) |
| price feed NEW 0xd0b9ff99 (well-formed) | attacker | revert "DelegateCollection: not trustedForwarder" |
| price feed NEW 0xd0b9ff99 (well-formed) | FORWARDER | revert "DelegateCollection: not keeper"  <-- layer-2 isKeeper(_msgSender()) |
| price feed NEW 0xd0b9ff99 (well-formed) | router / random | revert "not trustedForwarder" |

## The structural fix (correcting an earlier over-pessimistic claim)
The NEW price functions (0x4f0840be / 0xd0b9ff99) that REPLACED setPrices enforce BOTH:
  require(msg.sender == trustedForwarder)         // layer 1
  require(isKeeper(_msgSender()))                 // layer 2 — the check the OLD setPrices lacked
The exploit worked precisely because the OLD setPrices had only layer 1 and execute() relayed anyone.
The forwarder-sourced call dying on "not keeper" proves layer 2 exists. => genuinely fixed for an
unprivileged actor on Base (and BSC, byte-identical forwarder fix; BSC price feed 0xaf457b72).

IMPORTANT: a malformed (no-arg) call to 0x4f0840be/0xd0b9ff99 reverts on a calldata-length check
BEFORE the guard. Only the WELL-FORMED test above proves the guard, not a decode failure.

## What this does NOT clear
- opBNB / Taiko / Manta deployments: unassessed (endpoint limits).
- Keeper-key compromise: a legit keeper can still write an arbitrary price (NO on-chain sanity/deviation bound on prices).
- Upgrade risk: both proxies are admin-upgradeable; a future impl could reintroduce the class.

## Loss reconciliation ($3.32M vs the ~$7M headline)
Base slice = 3,323,170.89 USDC (measured, 99.98% of pool). BSC tx 0x1aaf5d1d alone = 892,937.52 USDT.
Total ~$7-7.5M was multi-chain (Base+BSC+opBNB+Taiko+Manta), same attacker, same technique.
