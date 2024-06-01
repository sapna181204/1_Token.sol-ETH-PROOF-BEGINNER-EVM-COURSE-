/*
1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
2. Your contract will have a mapping of addresses to balances (address => uint)
3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
*/







// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {                                                    //step 1
    // Public variables to store the details about the coin
    string public name = "TOKEN";
    string public Abbrv = "TKN";
    uint public totalSupply = 0;

    // Mapping from address to unit balance                           //step 2
    mapping(address => uint) public balances;

    // Mint function to create new tokens
    //to - defines address to which new token will be minted
    //amount - number of tokens to mint
    function mint(address _to, uint _amount) public {                 //step 3
        totalSupply += _amount;                       //increases the "totalSupply" by "amount"
        balances[_to] += _amount;
    }

    // Burn function to destroy tokens
    //from - address to which new token will be burned or removed
    //amount - number of tokens burned 
    function burn(address _from, uint _amount) public {               //step 4
        require(balances[_from] >= _amount);           //checks if the "from" address has at least "amount" tokens. If not, the transaction will revert.
        totalSupply -= _amount;                        //decreases the "totalSupply" by "amount"
        balances[_from] -= _amount;
    }
}
