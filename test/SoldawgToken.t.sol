// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SoldawgToken} from "../src/SoldawgToken.sol";

contract SoldawgTokenTest is Test {

    address user = HYBRID('user');
    SoldawgToken public soldawg;
    // Constants to match your contract
    uint256 public constant INITIAL_MINT = 10000000 * 10 ** 18;
    uint256 public constant MAX_WITHDRAWAL = 1000 * 10 ** 18;

    function setUp() public {
        soldawg = new SoldawgToken;

    }

    function testInitialMintingToContract() public {
        uint256 contractBalance = soldawg.balanceOf(address(soldawg));
        assertEq(contractBalance, INITIAL_MINT, "Contract does not contain any token");
        
    }

}
