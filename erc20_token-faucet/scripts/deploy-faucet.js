const hre = require("hardhat");

async function main() {
  // you can deploy multiple contract at once
  // Faucet.deploy takes as a parameter the address of the deployed contract DeltaToken

  const Faucet = await hre.ethers.getContractFactory("Faucet");
  const faucet = await Faucet.deploy();

  await faucet.deployed();

  console.log("Faucet contract deployed at: ", faucet.address );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
