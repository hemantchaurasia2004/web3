//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


    import "./SimpleStorage.sol";
contract ExtraStorage is SimpleStorage {
   // what we need to ammend here is to Add 5 to the input of favourite number and then 
   //override
   //virtual
   function store(uint256 _favouiteNumber) public override{
       favouriteNumber = _favouiteNumber+5;
   }
}