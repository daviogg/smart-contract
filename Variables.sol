pragma solidity ^0.8.1;

contract Variables{
    uint256 public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    bool public myBool;
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    uint8 public myUint8;
    
    function increment() public {
        myUint8++;
    }
    
    function decrement() public {
        myUint8--;
    }
    
    address public myAddress;
    
    function setAddress(address _myAddress) public {
        myAddress = _myAddress;
    }
    
    function getBalance() public view returns(uint){
        return myAddress.balance;
    }
    
    string public myString;
    
    function setString(string memory _myString) public{
        myString = _myString;
    }
    
}