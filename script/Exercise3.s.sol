// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Exercise3.sol";
import "../src/NaiveReceiverLenderPool.sol";

contract CounterScript is Script {

    NaiveReceiverLenderPool public naiveReceiverLenderPool;
    function setUp() public {

        naiveReceiverLenderPool = new NaiveReceiverLenderPool();
        
    }

    function run() public {
        vm.broadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);
        Exercise3 exercise3 = new Exercise3(payable(address(naiveReceiverLenderPool)));
    }
}
