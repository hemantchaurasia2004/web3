//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Practice1{
    uint256 public aFavNumber;
    mapping(string => uint256) public nameToFavouriteNumber;
    struct People{
        uint256 aFavNumber;
        string personName;
    }
    People[] public people;
     

     function addPerson(string memory _name, uint256 _favouiteNumber) public{
     people.push(People(_favouiteNumber, _name));
     nameToFavouriteNumber[_name]=_favouiteNumber;
 }
}
