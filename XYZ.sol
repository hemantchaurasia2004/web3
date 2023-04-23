//SPDX-License-Identifier: MIT
pragma solidity ^0.4.0;

contract HelloWorld{
    string public greet = "Hello World!";

    function inputGreet(string newGreet) public returns(string){
        greet = newGreet;
        return greet;
    }
}