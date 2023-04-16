pragma solidity ^0.8.15;

contract Ownable {
    address public owner = msg.sender;

    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: Caller is not the owner.");
        _;
    }
}

contract Pausable is Ownable {
    bool private _paused;

    function paused() public view returns (bool) {
        return _paused;
    }

    function pause() public onlyOwner {
        _paused = true;
    }

    function resume() public onlyOwner {
        _paused = false;
    }

    modifier whenNotPaused() {
        require(!_paused, "Pausable: Contract is paused.");
        _;
    }
}

/// #invariant {:msg "Scribble balance < 10000"} balances[scribble] <= 10000;
contract Exercise1 is Ownable, Pausable {
    
    address scribble = tx.origin;
    mapping(address => uint256) public balances;
    
    constructor()  {
        balances[scribble] = 11000;
    }
    
    function transfer(address to, uint256 value) public whenNotPaused {
        balances[msg.sender] -= value;
        balances[to] += value;
    }
}
