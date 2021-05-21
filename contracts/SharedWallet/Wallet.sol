// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "../Utils/Ownable.sol";

contract Wallet is Ownable{

    mapping(address => uint) public allowance;

    function addAllowance(address _who, uint _amount) public onlyOwner{
        allowance[_who] = _amount;
    }

    modifier ownerOrAllowed(uint _amount){
        require(msg.sender == owner() || allowance[msg.sender] >= _amount, "You are not allowed");
        _;
    }

    function reduceAllowance(address _who, uint _amount) internal{
        allowance[_who] -= _amount;
    }

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "Not amount stored in smart contract.");
        
        if(!(msg.sender == owner())){
            reduceAllowance(msg.sender, _amount);
        }

        _to.transfer(_amount);
    }

    receive() external payable { }
}