//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Simplex {
    string public Greet = "Hello World";

    function storeNew (string memory _greet) public {
        Greet = _greet;
    }
}