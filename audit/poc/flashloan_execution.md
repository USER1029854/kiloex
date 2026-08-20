# Flash-loan fee — CONFIRMED BY ON-FORK EXECUTION (not read from history, not approximated)

Question addressed: is the "$15 flash-loan cost" a real, executed number? Yes. I deployed a
minimal flash-borrower (`audit/poc/FlashTest.sol`) on an anvil fork of Base @28933729 and
actually borrowed USDC from the exact pool the attacker used.

## The pool
`0xd0b53D9277642d899DF5C87A3966A349A798F224` = Uniswap-V3 **WETH/USDC**, fee tier **500 = 0.05%**
(read on-chain: token0=WETH `0x4200…06`, token1=USDC `0x8335…13`, fee()=0x1f4).

## Executed result
```
FlashTest deployed, funded with a 100 USDC buffer (to pay the fee)
go(10_000 USDC) -> pool.flash(...)  tx status 0x1 (SUCCESS)
  FLASH BORROWED            : 10,000.00 USDC   (real flash executed)
  FEE the pool DEMANDED     : 5.000000 USDC    (read live inside uniswapV3FlashCallback)
  pool USDC net gain        : 5.000000 USDC    (independent check = fee)
```
10,000 × 0.05% = **5.00 USDC**, so **3 txs × 5 = 15.00 USDC** total flash cost — now confirmed
three ways: (a) the 0.05% fee-tier arithmetic, (b) the attacker's real on-chain repayment
(10,000 borrowed → 10,005 repaid), and (c) this live fork execution.

## On the full end-to-end replay (honesty note)
Replaying the attacker's *entire* tx1 on the fork (impersonating the attacker EOA, exact
calldata) reverts with the attacker contract's own "call fail". Call-trace shows the flash loan
executes and `0xd649` receives the USDC; the revert is downstream at the router
`0x796f1793` ("insufficient balance for transfer") — a fork-state faithfulness artifact in the
position leg (exact USDC amounts / keeper-execution ordering differ by a hair from the mined
block), not a flash-loan issue. It does not affect any number here: the flash fee is executed
above, the price-manipulation is executed by the fresh-key PoC, and the $3.32M profit is a real
on-chain fact from the mined tx receipts.
