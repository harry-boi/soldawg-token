// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract SoldawgToken is ERC20, ERC20Permit {

    uint256 public minimum_withdrawal;
    uint256 public MAX_WITHDRAWAL = 1000 * 10 ** decimals();
    mapping(address => uint256) public nextClaimTime;

    constructor() ERC20("Soldawg", "SDT") ERC20Permit("Soldawg") {
        _mint(address(this), 10000000 * 10 ** decimals());
        minimum_withdrawal = 500;
    }

    function TransferToken(uint256 _amount) external {
        require(_amount > 0 && _amount <= MAX_WITHDRAWAL, "Invalid amount requested");
        require(balanceOf(address(this)) > _amount, "Insufficient balance in Smart Contract");
        require(block.timestamp >= nextClaimTime[msg.sender], "Wait 24 hours between claims");

        _transfer(address(this), msg.sender, _amount);
        nextClaimTime[msg.sender] = block.timestamp + 1 days;
    }
}
