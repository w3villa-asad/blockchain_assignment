// SPDX-License-Identifier: None
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestCoin is ERC20 {

    mapping(address => uint256) private _balances;

    uint256 private maxSupply = 1000000 * 10**18;
    // uint256 private _totalSupply;
    uint256 initialSupply = 100 * (10**18);

    constructor() ERC20("TestToken", "TEST") {
        // _mint(msg.sender, initialSupply);
    }

    function balanceOf(address account) public view virtual override returns (uint256) {
    return _balances[account];
    }

    function _maxSupply() public view virtual returns (uint256) {
        return maxSupply;
    }

    // mintable token with maximum supply of 1000000
        function mint(address account, uint256 amount) public virtual override {
        require(account != address(0), "ERC20: mint to the zero address");
        require(maxSupply >= initialSupply, "Insufficient Maximum Supply");
        // _beforeTokenTransfer(address(0), account, amount);

        initialSupply += amount;
        // _balances[account] += amount;
        // emit Transfer(address(0), account, amount);
        _mint(account, amount);
        // _afterTokenTransfer(address(0), account, amount);
    }
    
}