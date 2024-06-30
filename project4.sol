// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {
    event Redeem(address indexed from, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) external onlyOwner {
        require(to != address(0), "Minting to zero address not allowed");
        _mint(to, amount);
    }

    function redeem(uint256 amount) external {
        address sender = _msgSender();
        require(balanceOf(sender) >= amount, "Insufficient balance to redeem");
        _burn(sender, amount);
        emit Redeem(sender, amount);
    }

    function burn(uint256 amount) external {
        address sender = _msgSender();
        require(balanceOf(sender) >= amount, "Insufficient balance to burn");
        _burn(sender, amount);
        emit Burn(sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(to != address(0), "Transfer to zero address not allowed");
        return super.transfer(to, amount);
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        require(from != address(0), "Transfer from zero address not allowed");
        require(to != address(0), "Transfer to zero address not allowed");
        return super.transferFrom(from, to, amount);
    }

    function balanceOf(address account) public view override returns (uint256) {
        return super.balanceOf(account);
    }
}
