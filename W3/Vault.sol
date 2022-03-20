// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//import "ERC20.sol";

contract Vault {

    mapping(address => uint) public deposited;
    address public immutable token;

    constructor(address _token) {
        token = _token;
    }

    function deposit(address user, uint amount) public {
        require(ERC20(token).transferFrom(msg.sender, address(this), amount), "Transfer from error");
        deposited[user] += amount;
    }

    function withdraw(uint amount) public {
        require(deposited[msg.sender] - amount >= 0, "Balance not enough");
        ERC20(token).transfer(msg.sender, amount);
        deposited[msg.sender] -= amount;
    }
}
