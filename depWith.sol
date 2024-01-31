//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "./node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract depWith{
    IERC20 public token;
    mapping (address => uint256) public balances; 
    constructor(IERC20 _token){
        token = _token;
    }
    function deposit(uint256 amount) public {
        token.transferFrom(msg.sender, address(this),amount);
        balances[msg.sender] += amount;
    }
    function withdraw(uint256 amount) public {
        require(balances[msg.sender]>= amount,"Not enough tokens.");
        balances[msg.sender]-= amount;
        token.transfer(msg.sender,amount);
        }
}