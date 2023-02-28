// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Lottery {

    address public owner;
    address payable[] public players;
    uint public lotteryId;

    mapping( uint => address payable ) public lotteryHistory;

    constructor() {
        owner = msg.sender;
        lotteryId = 1;
    }

    modifier onlyOwner {
        require( msg.sender == owner, "Only the owner can call this function" );
        _;
    }

    function enter() public payable {
        require( msg.value > .01 ether );
        players.push( payable( msg.sender ) );
    }

    function getRandomNumber() public view returns ( uint256 ) {
        return uint( keccak256( abi.encodePacked( owner, block.timestamp ) ) );
    }

    function pickWinner() public onlyOwner {
        uint index = getRandomNumber() % players.length;
        players[ index ].transfer( address( this ).balance );
        lotteryHistory[ lotteryId ] = players[ index ];

        lotteryId++;
        players = new address payable[](0);
    }

    function getBalance() public view returns ( uint ) {
        return address( this ).balance;
    }

    function getPlayers() public view returns ( address payable[] memory ) {
        return players;
    }
}