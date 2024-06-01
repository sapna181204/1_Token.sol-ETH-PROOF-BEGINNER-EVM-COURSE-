# 1_Token.sol-ETH-PROOF-BEGINNER-EVM-COURSE-
# ETH Proof : Beginner EVM Course Project
# CODE FOR THE PROJECT IS:



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
