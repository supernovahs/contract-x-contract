// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    /// #if_updated "number should be greater than 50 " number > 50;
    uint256 public number =5;

    function setNumber(uint256 newNumber) public {
        require(newNumber <50);
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}