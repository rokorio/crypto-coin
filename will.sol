pragma solidity ^0.5.7;


contract will{
    address owner;
    uint fortune;
    bool deceased;

    constructor() payable public {
        owner=msg.sender;//called address
        fortune=msg.value;//called value
        deceased=false;        
    }

    //create modifiers
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    modifier mustbeDeceased{
        require(deceased == true);
        _;
    }

    address payable[] familywallets;

    mapping(address => uint)inheritance;


    function setinheritance(address payable wallet, uint amount) public onlyOwner{
        familywallets.push(wallet);
        inheritance[wallet]=amount;

    }
    //pay each family member based on wallet 
    function payout()mustbeDeceased  private{
        for(uint i=0;i<familywallets.length;i++){
            familywallets[i].transfer(inheritance[familywallets[i]]);
        }
    }
    function hasdeceased() public onlyOwner{
        deceased = true;
        payout();
    }
}