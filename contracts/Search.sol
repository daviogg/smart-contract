// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

library Search {
    function indexOf(uint256[] storage self, uint256 value)
        public
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < self.length; i++)
            if (self[i] == value) return i;
        return type(uint256).max;
    }
}

contract NotUsingForExample {
    uint256[] data;

    function append(uint256 value) public {
        data.push(value);
    }

    function replace(uint256 _old, uint256 _new) public {
        // This performs the library function call
        uint256 index = Search.indexOf(data, _old);
        if (index == type(uint256).max) data.push(_new);
        else data[index] = _new;
    }
}

contract UsingForExample {
    using Search for uint256[];
    uint256[] data;

    function append(uint256 value) public {
        data.push(value);
    }

    function replace(uint256 _old, uint256 _new) public {
        // This performs the library function call
        uint256 index = data.indexOf(_old);
        if (index == type(uint256).max) data.push(_new);
        else data[index] = _new;
    }
}
