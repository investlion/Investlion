// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract InvestLion is ERC20, Ownable {
    constructor() ERC20("InvestLion", "ILION") Ownable(msg.sender) {
        uint256 totalSupply = 8000000000 * (10 ** uint256(decimals()));
        _mint(msg.sender, totalSupply);
    }

    // Function to mint additional tokens (only owner)
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Function to burn tokens from another account (with allowance)
    function burnFrom(address account, uint256 amount) public {
        _burn(account, amount);
        _approve(account, msg.sender, allowance(account, msg.sender) - amount);
    }
}
