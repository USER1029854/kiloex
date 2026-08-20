# Resolved system (evidence-anchored)

## Actors
- Attacker EOA: 0x00fac92881556a90fdb19eae9f23640b95b4bcbd (Tornado-funded; deployer+owner of both exploit contracts)
- Attacker "signer" EOA used as req.from: 0x551f3110f12c763d1611d5a63b5f015d1c1a954c
  - isKeeper(...) = FALSE on forwarder @exploit-block AND @latest (Base)
  - getNonce(...) went 0 -> 6 on Base forwarder (3 txs x 2 execute calls)
  - Same address on Base & BSC (attacker reused key); NO code (EOA) on either chain

## Attacker exploit contracts (the "targets" I was handed — NOT KiloEx)
- Base: 0xd649a0876453fc7626569b28e364262192874e18  (owner()=attacker; uniswapV3FlashCallback; entry 0x7493b4a4; created by attacker tx 0x6f33006628760c91faede0fef756036ed0a72b826388ee4f573c33c81d048f4b)
- BSC : 0xcc6a5784194bd516db29aa505179857025d8bef4  (owner()=attacker; pancakeV3FlashCallback; entry 0x7493b4a4; created block 48357841)

## KiloEx system — BASE (all EIP-1967 TransparentUpgradeableProxy; all impls UNVERIFIED)
- Forwarder/PositionKeeper proxy : 0x3274b668aed85479e2a8511e74d7db7240ebe7c8
    exploit-time impl (VULN)      : 0xbed75e25a63d2be11605038921aa5eef78bb4e61
    current impl (FIX)            : 0x9ddb41dbbec00b04c6f3a4797cd67d225dfddbf7   (execute() => revert "not allowed")
    gov=0x1d568fc08a1d3978985bc3e896a22abd1222abcf owner=0x54e8742a73d63d9681084eec4e9c3aa430d34aed quoteToken=USDC
- PriceFeed proxy                : 0xfdc7bc3a9fde88e7bcfb69c8b9ca7fda483627ed
    exploit-time impl            : 0xa307f7f990b7a94c803d4a1006b58c731e4b03e1   (setPrices ac9fd279 gate = msg.sender==trustedForwarder)
    current impl                 : 0x52cbc032124a96bd7ff9d031fe4510d4b2405a90   (setPrices ac9fd279 REMOVED; new fns 4f0840be/d0b9ff99)
    slot 0x97 trustedForwarder   = 0x3274b668... (the forwarder)   [setPrices caller gate]
    slot 0x99                    = 0x7bc8d56c... (vault)
    slot 0x9a                    = 0xa2e2f3726df754c1848c8fd1cbea6aaff84fc5b2
    slot 0x9b                    = 0x796f1793... (router)
    slot 0x9c                    = 0xa02d433868c7ad58c8a2a820d6c3ff8a15536acc
- Position Router                : 0x796f1793599d7b6aca6a87516546ddf8e5f3aa9d  (createIncreasePosition 0x00a30f93 / createDecreasePosition 0xfc2ee01d)
- Vault (holds USDC, mint/burn VUSD): 0x7bc8d56cc78cf467c7230b77de0fcbdea9ac44ce
- USDC (Base)                    : 0x833589fcd6edb6e08f4c7c32d4f71b54bda02913
- Flash pool (UniswapV3 USDC)    : 0xd0b53d9277642d899df5c87a3966a349a798f224

## KiloEx system — BSC (different addresses; same design)
- Forwarder proxy                : 0xad37c86c06be706466ee70cbbf58f20655e7efb1
    exploit-time impl (VULN)     : 0xd8240094e57bf5f893420ffc1e750c94de4a4177
    current impl (FIX)           : 0x0e23c0b311ecca6422eb34bbfe0904b30aacc97f   (BYTE-IDENTICAL to Base current fix; execute()=>revert "not allowed")
    owner=0xdff3c7ce7a57f808c897d2e1d93f4c188644cfe1
- PriceFeed proxy                : 0xaf457b72fff6712641c5f1843515a6e114b2ecde   (current impl 0x58295901ee34dd7f741b6a00c19fa514956faa75; slot0x97=forwarder above)
- Position Router                : 0x298e94d5494e7c461a05903dcf41910e0125d019
- USDT (BSC)                     : 0x55d398326f99059ff775485246999027b3197955
- Flash pool (PancakeV3)         : 0x172fcd41e0913e95784454622d1c3724f546f849

## Exploit facts
- Base: 3 txs blocks 28933730 / 28933848 / 28935593 ; total 3,323,170.89 USDC to attacker EOA
    tx1 0x6b378c... 3,125,495.72 | tx2 0xde7f5e... 186,595.77 | tx3 0xf0fcce... 11,079.39
- BSC: exploit tx 0x1aaf5d1dc3cd07feb5530fbd6aa09d48b02cbd232f78a40c6ce8e12c55927d03 block 48358304
- Each exploit tx = 2x forwarder.execute() (nonce 0 then 1) -> 2x setPrices (pump, then reset) bracketing a position open/close.
