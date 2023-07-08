// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
//Parent class
contract MainContract {
    function sum(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}
// Child class
contract SecondaryContract is MainContract {
    uint _a = 1;
    uint _b = 2;
    uint public val = sum(_a, _b); // By making it public, e shall be able to find the sum of vlaues in _a and _b
}