pragma solidity ^0.4.23;

/*
The contract implements simple token which can be used
for transferring value between parties (eg SafeRoad,
RoadManager)
*/
contract RDWToken {
    // The field contains all balances
    mapping(address => uint) public balances;

    // Mint function allows to generate new tokens
    function mint(uint _amount) public {
        balances[msg.sender] += _amount;
    }

    // BalanceOf allows to retrieve balance of account
    function balanceOf(address _account) view public returns(uint) {
        return balances[_account];
    }

    /* 
    Transfer function allows to transfer amount
    of tokens from sender to receiver
    */
    function transfer(address _to, uint _amount) public {
        require(balances[msg.sender] >= _amount);
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}