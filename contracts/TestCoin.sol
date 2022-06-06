// SPDX-License-Identifier: None
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestCoin is ERC20 {

    mapping(address => uint256) private _balances;
    uint256 private maxSupply = 1000000 * 10**18;
    // uint256 private _totalSupply;

    constructor(uint256 initialSupply) ERC20("TestToken", "TEST") {
        // uint256 initialSupply = 100000;
        _mint(msg.sender, initialSupply);
    }

        function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    function _maxSupply() public view virtual returns (uint256) {
        return maxSupply;
    }

    // mintable token with maximum supply of 1000000
        function _mint(address account, uint256 amount) internal virtual override {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        maxSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }
    
}