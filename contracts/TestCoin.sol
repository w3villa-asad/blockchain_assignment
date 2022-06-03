// SPDX-License-Identifier: None
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestCoin is ERC20 {
    constructor(uint256 initialSupply) ERC20("TestToken", "TEST") {
        // uint256 initialSupply = 100000;
        _mint(msg.sender, initialSupply);
    }
}