//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

 
contract FundMe {

    uint public minimumUsd = 50*1e18;
    
    address[] public funders;
    mapping(address=> uint256) public addressToAmountFunded;
    function fund() public payable{
// Want to be able to set a minimum fund amountin USD
//1. How do we send Eth to this contract?
        require(msg.value >= minimumUsd, "Didn't send Enough!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }
    function getPrice() public view returns(uint256) {
        //ABI 
        //Address 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        AggregatorV3Interface priceFeed= AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        
        (,int256 price, , ,)=priceFeed.latestRoundData();
        return uint(price*1e10); 
    }
    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        return priceFeed.version();
    }
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice= getPrice();
        uint256 ethAountInUsd = (ethPrice*ethAmount)/1e18;
        return ethAountInUsd;
    }
}