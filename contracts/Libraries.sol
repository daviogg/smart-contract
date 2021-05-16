// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "./SafeMath.sol";

contract LibrariesExample {
    using SafeMath for uint256;

    mapping(address => uint256) public tokenBalance;

    constructor() {
        tokenBalance[msg.sender] = tokenBalance[msg.sender].add(1);
    }

    function sendToken(address _to, uint256 _amount) public returns (bool) {
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount);
        tokenBalance[_to] = tokenBalance[_to].add(_amount);

        return true;
    }
}
