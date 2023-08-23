## Welcome to capturethefoundry

_capturethefoundry_ is a platform to practice foundry skills like writing PoCs and debugging. Every module relates to a real life exploit, and a successful completion of the task will mean reproducing an actual hack.

## Introduction

Hey there, researcher! Have you heard of pancakeswap? It seems that I have some FAPEN (Father Pepe Inu) tokens and I want to swap them for some WBNB. Can you help me out? I need the contract address of the FAPEN token and WBNB token first, then I need you to help me swap my FAPEN tokens for BNB tokens. I know it's a lot to ask for, but I really need some BNB right now... 

I think you can find the contract addresses of both tokens [here](https://bscscan.com/tx/0xa2be65e439eb182e8f2acfe7eff9a4bab55eb3cd789dcc0ddd19bf811af78a93).

## Objectives

All the code in the contract should be working fine, so there's no need to delete anything. All you need to do is to add some code in the [test file](https://github.com/capturethefoundry/fapen/blob/main/solution/fapen.t.sol) for the test to work.

1. Clone this repository locally (Make sure you have foundry installed)
2. Run the following command. The command should fail because of incomplete information.  

```
    forge test
```
3. Fix the issues in the test file. 

You should see this in your console once all the issues are fixed:

![Fapen Test](images/fapentest.png)

## Focus

Pancake Router `swapExactTokensForETHSupportingFeeOnTransferTokens()` function.

## Hints

If you're unsure of what to put in for the input parameters of the swap function, I was looking at the transaction logs and I think [this](https://explorer.phalcon.xyz/tx/bsc/0xa2be65e439eb182e8f2acfe7eff9a4bab55eb3cd789dcc0ddd19bf811af78a93) may help. Look at the bottom of the website, you should see `PancakeRouter.swapExactTokensForETHSupportingFeeOnTransferTokens()` and its input parameter. Try following the values in the input and you should be fine.

About the path parameter... I think you have to create the path by youself, like creating an array with 2 indexes. The first index should be the address of FAPEN and the second should be the address of WBNB.

Also, when you're copying the token address, make sure that you copy from the BSCScan website itself. Capital letters are important!

## Solution

The solution will be posted in the [solution](https://github.com/capturethefoundry/fapen/blob/main/solution/fapen.t.sol) folder. 

Good luck, researcher!

## Context

The [FAPEN](https://twitter.com/hexagate_/status/1663501550600302601) token was hacked on the [Binance Smart Chain](https://bscscan.com/tx/0xa2be65e439eb182e8f2acfe7eff9a4bab55eb3cd789dcc0ddd19bf811af78a93) on 29 May 2023 and the attacker ran away with 2 BNB (~600 USD).