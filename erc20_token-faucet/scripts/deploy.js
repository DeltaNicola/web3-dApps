const hre = require("hardhat");

async function main() {

  const DeltaToken = await hre.ethers.getContractFactory("DeltaToken");
  const deltaToken = await DeltaToken.deploy(100000000, 50);

  await deltaToken.deployed();

  console.log("DeltaToken deployed at: ", deltaToken.address );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
