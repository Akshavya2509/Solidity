// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MyBasicContract{
    //Dynamic array of type person
    Person [] public people;

    uint public peopleCount;
    struct Person{
        string _first_name;
        string _last_name;
        uint _age;
    }
    // whenever u have to assign value ot a string passed as a parameter, u use memory along its declaration
    // when u define parameters of function type string u need to specify the storage whether it is stored in memory or storage
    function addPerson(string memory first_name, string memory last_name, uint age) public {
        people.push(Person(first_name, last_name, age));
        peopleCount += 1;

    }
}