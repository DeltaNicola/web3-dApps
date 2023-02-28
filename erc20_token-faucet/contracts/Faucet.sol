// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IERC20 {
    function transfer ( address to, uint256 amount ) external returns ( bool );
    function balanceOf ( address account ) external view returns ( uint256 );
    event Transfer( address indexed from, address indexed to, uint256 value );
}

contract Faucet {

    address payable owner;
    IERC20 public token;

    uint256 public withdrawalAmount = 15 * exp;
    uint256 exp = 10 ** 18;

    uint256 public lockTime = 5 minutes;
    mapping( address => uint256 ) nextAccessTime;

    event Withdraw( address indexed to, uint256 indexed amount );
    event Deposit( address indexed from, uint256 indexed amount );

    constructor( address tokenAddress ) payable {
        token = IERC20( tokenAddress );
        owner = payable( msg.sender );
    }

    function requestTokens() public {
        require( msg.sender != address(0), "request cannot be originated from a zero account");
        require( token.balanceOf( address(this) ) >= withdrawalAmount, "insufficient funds in the faucet!");
        require( block.timestamp >= nextAccessTime[ msg.sender ], "sorry! you gotta wait before making another request" );

        nextAccessTime[ msg.sender ] = block.timestamp + lockTime;

        token.transfer( msg.sender, withdrawalAmount );
    }

    modifier onlyOwner {
        require( msg.sender == owner, "Only the owner can call this function" );
        _;
    }

    receive( ) external payable {
        emit Deposit( msg.sender, msg.value );
    }

    function getBalance() external view returns ( uint256 ) {
        return token.balanceOf( address(this) );
    } 

    function setWithdrawalAmount ( uint256 amount ) public onlyOwner {
        withdrawalAmount = amount * exp;
    }

    function setLockTime ( uint256 amount ) public onlyOwner {
        lockTime = amount * 1 minutes;
    }

    function withdraw() external onlyOwner {
        emit Withdraw( msg.sender, token.balanceOf( address(this) ) );
        token.transfer( msg.sender, token.balanceOf( address(this) ) );
    }
}