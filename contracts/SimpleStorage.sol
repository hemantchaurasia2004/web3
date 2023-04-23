//SPDX-License-Identifier: MIT
pragma solidity 0.8.7; //with 0.8.12 being the latest version running as of now, also to specify we have pragma solidity telling us every time the version of solidity to use
// if we add ^ before the solidity version we are actually telling the computer to opt for the same version or above under our use case, eg. ^0.8.7
//EVM Ethereum Virtual Machine
//Avalanche, FAntom, Polygon.

contract SimpleStorage{

// uint256 MyFavouriteNumber;
// // when uint256 is assigned as a variable and no value is substituted to that variable the default value comes out to be 0
 uint256 public favouriteNumber;
 mapping(string => uint256) public nameToFavouriteNumber;

 struct People{
     uint256 favouriteNumber;
     string name;
 }

 People[] public people;

 function store(uint256 _favouiteNumber) public virtual { //virtual added so to allow function to be overridded
     favouriteNumber= _favouiteNumber;
 }
//  function retreive() public view returns(uint256){
//      return favouriteNumber;
//  }//view and pure functions donot modify the aim of the function
// calldata, memory, storage
 function addPerson(string memory _name, uint256 _favouiteNumber) public{
     people.push(People(_favouiteNumber, _name));
     nameToFavouriteNumber[_name]=_favouiteNumber;
 }
}