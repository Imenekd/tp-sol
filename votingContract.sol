
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract votingContract{
    address public owner;
    string[] public singers;
    mapping (string => uint256) public singervotes;
    mapping (address => bool) public Voted;
    
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner,"You're not the owner.");
        _;
    }
    
    function addSigner(string memory singer) public onlyOwner(){
        singers.push(singer);
        
    }
    function Vote(string memory singer) public {
        require(!Voted[msg.sender],"the user has voted!");
        singervotes[singer]++;
        Voted[msg.sender]=true;
        
    }
    function getsingerVotes( string memory singer) public view returns(uint256){
        return singervotes[singer];
    }


}