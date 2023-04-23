// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Address.sol";

/**
 * @title FlashLoanReceiver
 * @author Damn Vulnerable DeFi (https://damnvulnerabledefi.xyz)
 */

contract Exercise3 {
    using Address for address payable;

    address payable private pool;

    constructor(address payable poolAddress) {
        pool = poolAddress;
    }

     /// #if_succeeds {:msg "Ether balance should not decreased"}  address(this).balance >= old(address(this).balance);
    function receiveEther(uint256 fee) public payable {
        require(msg.sender == pool, "Sender must be pool");

        uint256 amountToBeRepaid = msg.value + fee;

        require(address(this).balance >= amountToBeRepaid, "Cannot borrow that much");
        
        _executeActionDuringFlashLoan();
        
        // Return funds to pool
        pool.sendValue(amountToBeRepaid);
    }

    // Internal function where the funds received are used
    function _executeActionDuringFlashLoan() internal { }

    // Allow deposits of ETH
    receive () external payable {}
}