pragma solidity ^0.4.23;

contract RDWToken {
    mapping(address => uint) public balances;

    function mint(uint _amount) public {
        balances[msg.sender] += _amount;
    }

    function balanceOf(address _account) view public returns(uint) {
        return balances[_account];
    }

    function transfer(address _to, uint _amount) public {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}