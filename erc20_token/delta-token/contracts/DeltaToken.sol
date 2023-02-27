// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DeltaToken is ERC20Capped, ERC20Burnable {

    string fullName = "DeltaToken";
    string signature = "DLT";

    address payable public owner;

    uint256 initialSupply = 70000000;
    uint256 public blockReward;
    uint256 exp = 10 ** decimals();

    constructor ( uint256 capSupply, uint256 reward ) ERC20 ( fullName, signature ) ERC20Capped ( capSupply * exp ) {
        owner = payable(msg.sender);
        _mint( owner, initialSupply * exp );
        blockReward = reward * exp;
    }

    function _mint(address account, uint256 amount) internal virtual override ( ERC20Capped, ERC20 ) {
        require(ERC20.totalSupply() + amount <= cap(), "ERC20Capped: cap exceeded");
        super._mint(account, amount);
    }

    modifier onlyOwner {
        require( msg.sender == owner, "Only the owner can call this function" );
        _;
    }

    function _mintMinerReward() internal {
        _mint( block.coinbase, blockReward );
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        if ( from != address(0) && to != block.coinbase && block.coinbase != address(0) ) {
            _mintMinerReward();
        } 
        super._beforeTokenTransfer( from, to, amount );
    }

    function setBlockReward( uint256 reward ) public onlyOwner {
        blockReward = reward * exp;
    }

    function destroy() public onlyOwner {
        selfdestruct( owner );
    }
}