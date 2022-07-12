pragma solidity ^0.8.4;


contract Coin{
    address public minter;
    mapping(address=> uint)public balances;
   
   event Sent(address from,address to,uint amount);
   //is runs deployed constructor
    constructor(){
        minter=msg.sender;
    }
    //make new coin and send them to the address 
    //only thre owner can send these coin
    function mint (address receiver,uint amount) public{
         require(msg.sender ==minter);
         balances[receiver]+=amount;
    }
   
   error insufficientbalance(uint requested,uint available);
    //send any amount of coins to an exist address

    function send(address receiver,uint amount) public{
        //require the amount to be greater he x = true and then run this
        if(amount > balances[msg.sender])
        revert insufficientbalance({
            requested:amount,
            available:balances[msg.sender]
        }); 
        balances[msg.sender]-= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender,receiver, amount);
    }
}