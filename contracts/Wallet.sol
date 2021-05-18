// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract Variables{

    address public owner;
    constructor(){
        owner = msg.sender;
    }

    function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "You are not allowed.");
        _;
    }



    receive() external payable { }
}