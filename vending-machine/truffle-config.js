require('dotenv').config()
const HDWalletProvider = require('@truffle/hdwallet-provider')

const private_keys = [
  process.env.PRIVATE_KEY_0,
  process.env.PRIVATE_KEY_1,
]

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*", // Match any network id
      gas: 5000000
    },
    rinkeby: {
      provider: () => HDWalletProvider({
        privateKeys: private_keys,
        providerOrUrl: '',
        numberOfAddress: 2
      }),
      network_id: 2,
      gas: 5500000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryDrun: true
    },
    mainnet: {
      provider: () => HDWalletProvider({
        privateKeys: process.env.SECRET_KEY,
        providerOrUrl: process.env.URL,
      }),
      network_id: process.env.NETWORK_ID,
      gas: process.env.GAS,
      gasPrice: process.env.GAS_PRICE,
      confirmations: process.env.CONFIRMATIONS,
      timeoutBlocks: process.env.TIMEOUT_BLOCKS,
      skipDryDrun: true
    }
  },
  compilers: {
    solc: {
      version: '0.8.11',
      settings: {
        optimizer: {
          enabled: true, // Default: false
          runs: 200      // Default: 200
        },
      }
    }
  }
};
