// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract data{

    //These are called as state variables in solidity
    //By default variables are Internal
    //Internal variables are those that can only be accessed within the contract
    string public variable = "Hello World!";
    string public constant value = "Hello World!";

    //Booolean
    bool public MyBoolVal = true;
    bool public MyBoolVal1 = false;

    //Integer
    int MyIntVal = 20000;
    int8 MyIntVal2 = 127; //This is integer 8-not varable declaration(+128 - (-127))

    //Unsigned Integer
    uint public myUintVal = 999999;
    uint8 public myUintVal1 = 255; //Its range is 0-255

    //HexaDecimal
    uint constant ID = 0x123A1;

    // Address datatypes
    //Public: a public variable can be accessed both from within the contract and externallyfrom other contract
    address public owner;

    //Declare an address
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    //Payable - when the address for your account is used for transfer for ammount
    address payable x1 = address(0x123af);
    //This refers to th ecurrent smart contract instance with contractor's code 
    address myAddVal = address(this);

    //Sime global variables in solidity
    //msg - it is predefined global variable that provides info about current 
    // incoming message or transaction being processed by a contract
    address sender = msg.sender;
    uint public val_wei = msg.value;

    //Array Declaration
    //Dynamic Array - It allows for a variable size array that can be modified during runtime
    uint256[] values;

    //static Array
    string[10] Nicknames;
    //Dictionary
    // mapping - it is key values data structure where key will address and value be uint
    mapping (address => uint) _balances;
    //_balances[msg.sender] -> returns Balance value

    
    // 1 ether is equal to 10^18 wei
    uint public oneWei = 1 wei;
    // 1 ether i equal to 10^9 gwei
    uint public onrGwei = 1 gwei;
    uint public oneether = 1 ether;

    //struct datatypes in solidity
    // struct keyword is used to define custom data structures. A struct is user defined
    // data types that allow you to create complex data structures by combining multiple

    struct person{
        string _name;
        uint _age;
        string _email;
    }

    // enum - enumeration - custon data type that represents collection as a set of named values
    enum Status{
        Active,
        Passive,
        Pending
    }
}