// SPDX-License-Identifier: MIT

pragma solidity^0.8;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
    
    function getPrice() internal view returns (uint256){

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        
        (,int answer, , , ) = priceFeed.latestRoundData();

        return uint256(answer * 10000000000);
        //return uint256(answer *1e10); same as above
    } 

    function getConversionRate(uint256 ethAmount) internal view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;
    }
}