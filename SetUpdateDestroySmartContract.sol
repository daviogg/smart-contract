// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract StartStopUpdateExample {
    
    address public owner;
    bool public paused;

    constructor() {
        owner = msg.sender;
    }
    
    function sendMoney() public payable {

    }

    function withdrawAllMoney(address payable _to) public {
        require(owner == msg.sender, "Fuck you");
        require(paused == false, "Contract Paused");
        _to.transfer(address(this).balance);
    }
    
    function setPaused(bool _paused) public{
        require(owner == msg.sender, "Fuck you");
        paused = _paused;
    }
    
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "Fuck you");
        selfdestruct(_to);
    }
    
}