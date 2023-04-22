pragma solidity ^0.8.15;

contract Ownable {
    address public owner = msg.sender;

    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }

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

contract Exercise2 is Ownable, Pausable {
    mapping(address => uint256) public balances;

// if_succeeds  balances[msg.sender] <= (balances[msg.sender] + value);
    function transfer(address to, uint256 value) public whenNotPaused {
        unchecked{
        balances[msg.sender] -= value;
        balances[to] += value;
        }
    }
}
