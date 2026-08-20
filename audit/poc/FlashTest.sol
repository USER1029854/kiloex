// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
interface IUniV3Pool { function flash(address recipient, uint256 amount0, uint256 amount1, bytes calldata data) external; }
interface IERC20 { function transfer(address to, uint256 v) external returns (bool); function balanceOf(address) external view returns (uint256); }
contract FlashTest {
    address constant POOL = 0xd0b53D9277642d899DF5C87A3966A349A798F224; // Base UniV3 WETH/USDC 0.05%
    address constant USDC = 0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913;
    uint256 public fee1Captured;
    uint256 public borrowed;
    uint256 public poolGain;
    function go(uint256 amountUSDC) external {
        borrowed = amountUSDC;
        uint256 poolBefore = IERC20(USDC).balanceOf(POOL);
        IUniV3Pool(POOL).flash(address(this), 0, amountUSDC, ""); // USDC = token1
        poolGain = IERC20(USDC).balanceOf(POOL) - poolBefore;
    }
    function uniswapV3FlashCallback(uint256, uint256 fee1, bytes calldata) external {
        require(msg.sender == POOL, "not pool");
        fee1Captured = fee1;                       // <-- the fee the pool demands, measured live
        IERC20(USDC).transfer(POOL, borrowed + fee1); // repay principal + fee
    }
}
