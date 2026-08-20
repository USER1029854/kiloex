# Decisive live simulations (eth_call against real chain state)

All calls use the attacker's EXACT decoded nonce-0 `execute()` calldata
(`audit/base/exec_nonce0_calldata.hex`, `audit/bsc/exec_nonce0_calldata.hex`),
sent to the forwarder proxy.

## Base forwarder 0x3274b668 — vulnerability reproduced
- @ block 28933729 (pre-first-exploit; impl 0xbed75e25; nonce[0x551f31]=0), from attacker EOA 0x00fac9:
  result = 0x...0000000000000000000000000000000000000000000000000000000000000001...  => SUCCESS
  (an unprivileged, non-keeper, self-signed request reaches setPrices via the forwarder)

## Base forwarder 0x3274b668 — fix confirmed
- @ latest (impl 0x9ddb41db): revert "not allowed" — from EVERY sender tried:
  attacker 0x00fac9, approvedRouter 0x796f1793, gov 0x1d568fc0, owner 0x54e8742a, keeper-EOA 0x551f31.
  (=> not a caller gate; execute() is unconditionally disabled. Disassembly: unconditional REVERT at 0x1639.)

## Base price feed 0xfdc7bc3a — setter removed
- call setPrices (0xac9fd279) @ latest: execution reverted (selector absent from impl 0x52cbc032).

## BSC forwarder 0xad37c86c
- @ block 48358303 (pre-exploit; impl 0xd8240094): SUCCESS  (bug reproduced on BSC)
- @ latest (impl 0x0e23c0b3, BYTE-IDENTICAL to Base fix 0x9ddb41db): revert "not allowed"

## On-chain reads that pin the mechanism (Base forwarder / price feed)
- isKeeper(0x551f31) @exploit-block AND @latest = false
- getNonce(0x551f31) @exploit-block=2, @latest=6  (3 txs x 2 execute)
- priceFeed slot 0x97 (trustedForwarder) = 0x3274b668 (the forwarder) — setPrices' caller gate
- forwarder quoteToken() = USDC 0x833589fc ; gov=0x1d568fc0 ; owner=0x54e8742a
