// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ContactBook{
    struct Contact{
        string _name;
        string phoneNumber;
    }

    mapping (address => Contact) public addressBook;

    function addContract(string memory name, string memory phoneNumber) public{
        addressBook[msg.sender] = Contact(name, phoneNumber);
    }

    function getContact(address userAddress) public view returns(string memory, string memory){
        Contact memory contact = addressBook[userAddress];
        return (contact._name, contact.phoneNumber);
    }
}