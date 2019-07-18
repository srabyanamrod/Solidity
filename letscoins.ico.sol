// Letscoins ICO

// Version of compiler
pragma solidity ^0.4.11;

contract Letscoin_ico {
    
    // Introducing the naximum number of Letscoins available for sealed
    uint public max_letcoins = 1000000;
    
    // Introducing the USD TO Letscoins conversion rate 
    uint public usd_to_letcoins = 1000;
    
    // Introducing the total number of the Letscoins that have been bought by the investers
    unit public total_letscoins_bought = 0;
    
    // mapping from the investor address to its equity
    mapping(address => unit) equity_Letscoins;
    mapping(address => unit) equity_usd;
    
    // Checking if an investor can buy Letscoins
    modifier can_buy_letscoins(uint usd_invested){
        require (usd_invested * usd_to_letcoins + total_letscoins_bought <= max_letcoins);
        _;
    }
    
    // Getting the equity in Letscoins of an investor
    function equity_in_letscoins(address investor) external constant returns (uint){
        return equity_letscoin[investor];
    }
    
    // Getting the equity in USD of an investor
    function equity_in_usd(address investor) external constant returns (uint){
        returns equity_usd[investor];
    }
        
    // Buying Letscoins
    function can_buy_letscoins(address investor, uint usd_invested) external {
    can_buy_letscoins(usd_invested) {
        uint Letscoins_bought = usd_invested * usd_to_letcoins;
        equity_Letscoins[investor] += Letscoins_bought;
        equity_usd[investor] = equity_Letscoins[investor] / 1000;
        total_letscoin_bought += Letscoins_bought;
    }
    }
    // Selling Letscoins
    function sell_letscoins(address investor, uint Letscoins_sold) external {
        equity_Letscoins[investor] -= Letscoins_sold;
        equity_usd[investor] = equity_Letscoins[investor] / 1000;
        total_letscoin_bought -= Letscoins_sold;
    }

}
