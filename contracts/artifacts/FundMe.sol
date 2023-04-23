//Get Funds From Users,
//Withdraw funds
//Set Min funding Value in USD

//SPDV-License-Identifier: MIT
pragma solidity ^0.8.0;

 contract FundMe{

 uint256 public minimumUsd = 50;

     function fund() public payable{
         //1. Want to be able to set a minimun fund amount in USD
         //2. How do we send eth to this contract
         require(msg.value >= minimumUsd, "Didn't sent enough");//1eth==1e18 wie
         //What is reverting?
         //Basically undo any action before, and send remaining gas back 
     }
 }

