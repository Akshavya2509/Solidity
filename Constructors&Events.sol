// SPDX-License-Identifier: GPL-3.0
// ICO - Initial coin offering
pragma solidity >=0.7.0 <0.9.0;

contract My{
    // wallet - stores the amount, or crypto etc.

    address payable wallet;


    // mapping - It will use address of wallet as key and token amount as value
    mapping (address => uint256) public balance;
    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    // constructor - First function which will be called 
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    function buyToken() public payable{
        balance [msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}