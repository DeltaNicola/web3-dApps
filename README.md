# web3-dApps

this repo is a sort of diary of my journey in the web3 world.  
here you can find any project i've built following along with tutorials found on youtube.  
this repo serves the purpose of being my little quick reference doc.

## repo-index
1. [smart contracts](#smart-contracts)
1. [projects summary](#projects-summary)
2. [technology used](#technology-used)
3. [skills learned](#skills-learned)
4. [tutorials followed](#tutorials-followed)

#
## smart contracts
quick links to the SmartContract.sol files.
* [crowd-funding](https://github.com/DeltaNicola/web3-dApps/blob/main/crowd-funding/web3/contracts/CrowdFunding.sol) 
* [erc20_token](https://github.com/DeltaNicola/web3-dApps/blob/main/erc20_token/contracts/DeltaToken.sol)  
* [erc20_token-faucet](https://github.com/DeltaNicola/web3-dApps/blob/main/erc20_token-faucet/contracts/Faucet.sol) 
* [erc721a_nft-collection](https://github.com/DeltaNicola/web3-dApps/blob/main/erc721a_nft-collection/contracts/NFTCollection.sol)
* [nft-evolving](https://github.com/DeltaNicola/web3-dApps/blob/main/nft-evolving/evolving-nfts/src/EvolvingNFT.sol)
* [smart-lottery](https://github.com/DeltaNicola/web3-dApps/blob/main/smart-lottery/contracts/Lottery.sol)  
* [vending-machine](https://github.com/DeltaNicola/web3-dApps/blob/main/vending-machine/contracts/VendingMachine.sol) 

#
## projects summary

* ### crowd-funding  
    this project was focused on building a full-stack application using the smart contract as a "smart backend". the goal was to create a kickstarter-like webapp where clients could submit campaigns that other people could fund sending ethereums.  
    

* ### erc20_token  
* ### erc20_token-faucet  
    this two projects were all about understanding how tokens work. the first one was about implementing a smart contract that would deploy and let people send and receive their erc20 tokens, while the other was about implementing a faucet in order to understand how different contracts interact with each other.  
     

* ### erc721a_nft-collection
    this project was about understanding how nfts work. by developing a basic gallery using erc721a-base contract as a template, the focus was put around roles and how the implemented contracts can help save time by overriding functions and adding custom behaviours like roles restrictions.


* ### nft-evolving
    this project was about understanding how lazy-mint works. it revolved around implement a basic ERC1155 smart contract for nfts and were implemented two functions: the first was to claim one of the nfts, while the other was about burning the first two in order to get an "evolved" one. basically pokemon, but with nfts. 
    

* ### smart-lottery  
    this project was about understanding a bit more some utility functions that developers can use and implement. given a rather easy project, the focus was all about how the blockchain works and what instrument or workarounds it gives me in order to achieve my goal.  


* ### vending-machine  
    this project focused on understanding how truffle works. after implementing a simple vending machine contract for selling virtual donuts at 2 EtH each, truffle was used for running the test scripts and understand how the deploy script worked both on a test-net ( ganache ) and on the main-net.  
     

#
## technologies used
* ### programming
    * solidity  
    * react
    * next.js


* ### web3 frameworks & tools
    * thirdweb
    * hardhat
    * truffle
    * forge


* ### test net
    * goerli
    * rinkeby

* ### wallets
    * metamask

#
## skills learned  

* ### understanding of how smart contracts work  
    * what are smart contracts
    * how to develop a smart contract
    * how to deploy a smart contract on a testnet


* ### understanding of how to use a smart contract  
    * how to interact with it in a web-application
    * differences between "reading" and "writing" on a blockchain
    * how to connect to a wallet
    

* ### understanding on how to develop a smart contract
    * ERC20 tokens
    * ERC721 nfts
    * ERC1155 nfts
    * minting strategies


* ### understanding on tools
    * how to scaffold a project
    * how to execute tests
    * how to run a local testnet

#
## tutorials followed

* [block explorer](https://www.youtube.com/@BlockExplorerMedia) (personal favourite)
* [thirdweb](https://www.youtube.com/@thirdweb_)
* [javascript mastery](https://www.youtube.com/@javascriptmastery/featured)
* [solidity by example](https://solidity-by-example.org/)
* [smart contract programmer](https://www.youtube.com/channel/UCJWh7F3AFyQ_x01VKzr9eyA)
