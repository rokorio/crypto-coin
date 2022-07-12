pragma solidity >= 0.7.0 < 0.9.0;

contract simplestorage{
//varibales are stored in these ways:
//string , uint, bool
    uint storedata;
//functions are kept like this 
    function set(uint x)public{
        storedata= x * 3;
    
    }
    function get()public view returns(uint){
        return storedata;
    }
}