// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Calculator{
    function sum (uint _a, uint _b) public pure returns (uint){
        uint c;
        c = _a + _b;
        return c;
    }
    function diff (uint _a, uint _b) public pure returns (uint){
        require(_b <= _a);
        uint c;
        c = _a - _b; // 34 - 45 creates a really big value. This is am issue in generating negative values
        return c;
    }
    function mult (uint _a, uint _b) public pure returns (uint){
        if(_a == 0)
            return 0;
        uint c;
        c = _a * _b;
        return c;
    }
    function div (uint _a, uint _b) public pure returns (uint){
        require(_b != 0);
        uint c;
        c = _a / _b;
        return c;
    }
    function mod (uint _a, uint _b) public pure returns (uint){
        uint c;
        c = _a % _b;
        return c;
    }
}