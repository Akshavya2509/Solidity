//SPDX-License-Identifier: UNLICENSED
// Complier version
pragma solidity >= 0.4.22 <0.6.0;

library SafeMath {
    function sum (uint a, uint b) internal pure returns (uint) {
        uint c = a + b;
        require (c > a);
        return c;
    }

    function sub (uint a, uint b) internal pure returns (uint) {
        require(b <= a);
        uint c = a - b;
        return c;
    }

    function mul (uint a, uint b) internal pure returns (uint) {
        if (a == 0) {
            return 0;
        }
        uint c = a * b;
        require (c/a == b);
        return c;
    }

    function div (uint a, uint b) internal pure returns (uint) {
        require (b > 0);
        uint c = a / b;
        return c;
    }
}
// Token of Cryptocurrency uses ERC20 Protocol

// Token of Cryptocurrency uses ERC20 Protocol
contract ERC20 {
    function totalSupply() public view returns (uint _totalSupply);
    function balanceOf(address _owner) public view returns (uint balance);
    function transfer(address _to, uint256 _value) public returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
    function approve(address _spender, uint256 _value) public returns (bool success);
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);
    // Transfer Event triggered , when tokens are transferred
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    // Triggered on any successful call to approve
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract Cryptocurrency is ERC20 {
    using SafeMath for uint;

    string public symbol = "ElonMuskCoin";
    string public name = "EMC";

    uint public decimals = 0;
    uint totalSupply_ = 100000000000000000000;
    address payable public owner;

    // Balance
    mapping (address => uint) _balanceOf;
    //Owner's Address , uint which is spender's address
    mapping (address => mapping (address => uint)) allowed;
    modifier onlyOwner {
        if(msg.sender != owner){
            revert();
        }
        _;
    }
    // update owner variable with current deployer address
    // update all supply to owner's address
    constructor () public {
        owner = msg.sender;
        _balanceOf [owner] = totalSupply_;
    }
    // TotalSupply function returns the o/p of total supply subtracted from balanceOf owner
    function totalSupply() public view returns (uint){
        return totalSupply_.sub(_balanceOf[address(0)]);
    }
    // return balance token of woner
    function balanceOf(address _owner) public view returns (uint balance){
        return _balanceOf[owner];
    }
    // Transfer will return true on successfull transfer of value, to, from using transfer event
    function transfer(address _to, uint256 _value) public returns (bool success){
        _balanceOf[msg.sender] = _balanceOf[msg.sender].sub(_value);
        _balanceOf[_to] = _balanceOf[_to].sum(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
     function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        _balanceOf[_from] = _balanceOf[_from].sub(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        _balanceOf[_to] = _balanceOf[_to].sum(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }
    function approve(address _spender, uint256 _value) public returns (bool success){
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        return allowed[_owner][_spender];
    }
   function () external payable{
       revert();
    }
        // Owner can send any ERC20-Tokens
    function transferAnyERC20Token (address tokenAddress,uint _value) public onlyOwner returns (bool success){
        return ERC20(tokenAddress).transfer(owner, _value);
    }    

}