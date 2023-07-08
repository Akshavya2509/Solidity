// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ViewPureFunc{

    //state variables - variables declared within a contract that hold value/data
    // This represents the state of contract stored in blockchain
    uint public val = 1;

    //state mutability can be restricted to view
    //view - it doesnt modify function/state variable, read-only functions, state variables
    // cannot be modified, it can only be read

    function addToVal(uint val2) public view returns (uint) {
        return val + val2;
    }
    // pure - it doesnt modify function/state variable, neither able to read the state variables
    // this function uses only the values passed in the funciton
    function add(uint val2, uint val1) public pure returns (uint){
        return val1 + val2;
    }
}