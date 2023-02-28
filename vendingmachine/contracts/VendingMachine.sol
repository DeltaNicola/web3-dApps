// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.11;

contract VendingMachine {

    address public owner;
    mapping (address => uint) public donutBalances;

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "only the owner can use this function");
        _;
    }

    function getVendingMachineBalance() public view returns (uint) {
        return donutBalances[address(this)];
    }

    function restock(uint amount) public onlyOwner {
        donutBalances[address(this)] += amount;
    }

    function purchase(uint amount) public payable {
        require(msg.value >= amount * 2 ether, "price is at least 2 ETH per donut");
        require(donutBalances[address(this)] >= amount, "sorry, not enough donuts :(");
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }
}