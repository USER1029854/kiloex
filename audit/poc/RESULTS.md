# PoC results — "is it exaggerated / what's at risk / does anything gate it?"

Reproduce: `python3 audit/poc/poc_freshkey.py` (needs `pip install eth-account`; optional
anvil fork on :8545 for proof #2 — `anvil --fork-url <base-rpc> --fork-block-number 28933729`).

## Proof #1 — NOTHING gates it, and it is NOT behind admin (fresh, unprivileged key)
A private key generated from scratch in this repo (`keccak("kiloex-poc-fresh-signer-2026")`)
→ address **A = 0xea29ca3a234d9f5d6556474f00b7e0894bf032d3**, which on-chain is:
- `isKeeper(A) = 0` (NOT a keeper)
- `A != owner` (owner = 0x1d568fc0…), `A != gov` (gov = 0x1d568fc0…)
- never seen on-chain; holds no role, no allowance, no privilege.

A self-signs `execute({from:A, to:KiloPriceFeed, data:setPrices(token 0x9ef1b8c0 = price 100)})`
and an arbitrary relayer submits it:
- `eth_call` @ Base block 28933729 (vulnerable impl 0xbed75e25): **SUCCESS**
- `eth_call` @ latest (fixed impl 0x9ddb41db): **revert "not allowed"**

## Proof #2 — the price change is REAL and persists (anvil fork @28933729)
Sent as a real transaction from an arbitrary relayer (execute has no caller gate):
- tx **status = 0x1 (SUCCESS)**, gasUsed ≈ 167k
- `getNonce(A)`: **0 → 1** (the request was accepted & committed)
- **1 event emitted** by price store `0x22c40b88…`:
  `PriceUpdate(token=0x9ef1b8c0e4f7dc8bf5719ea496883dc6401d5b2e, price=100, ts=1744656864)`
  → an unprivileged key set an arbitrary on-chain price. Arbitrary price ⇒ arbitrary PnL.

## How much is at risk (measured, not estimated)
The manipulated price is monetized through a perp position; the profit is paid from the
USDC liquidity pool **0xdf5ACC61…** (identified by net-flow analysis of the real exploit tx:
that pool is the only address with a large net USDC outflow).

| quantity | value |
|---|---|
| USDC in pool 0xdf5ACC61 @ pre-exploit (28933729) | **3,323,951.60 USDC** |
| USDC actually drained to attacker (3 Base txs) | **3,323,170.89 USDC** |
| fraction of pool taken | **99.98 %** |

So "at risk" ≈ the **entire pool**, and the attacker took essentially all of it. The finding is
if anything *under*-stated by any single-tx number: arbitrary price control caps out at the whole
pool, on every market and every chain the price feed serves. (Realized total across all chains was
higher; only the Base pool is measured here.)

## Not-exaggerated summary
- unauthorized-access bar: met — a random key with zero privileges sets prices (proof #1, #2).
- economic bar: met overwhelmingly — ~100% of a $3.3M pool, capital supplied by a flash loan.
- current state: the specific path is closed (execute disabled + setPrices removed); proof #1 @latest reverts.

## Cost to execute (why the economic bar is met independent of stake)
Measured from the 3 real Base exploit txs (receipts: gasUsed x effectiveGasPrice; USDC Transfer logs):

| item | amount | is it a real cost? |
|---|---|---|
| upfront own capital | **0.00 USDC** (attacker EOA sent 0 in, all 3 txs) | — |
| flash-loan principal | 10,000 USDC borrowed & **repaid same tx** (x3) | no (atomic repay) |
| flash-loan fee | **15.00 USDC** total (5/tx) | yes (trivial) |
| gas | **0.000007 ETH total (~$0.01)** — Base gas 0.001-0.002 gwei | yes (trivial) |
| capital at risk if any step reverts | **0** (single atomic tx) | — |
| **net profit** | **3,323,170.89 USDC** | — |
| **return on actual cost** | **~220,000x** (3.32M / ~15) | — |

The exploit is self-financing: the ~338 USDC position margin was taken from the flash loan and the
5-USDC fee is paid out of the proceeds within the same tx. Minimum upfront holding = gas money (~$0.01).
Even without a flash loan the attack needs only ~$338 of margin — capital is not a barrier either way.
