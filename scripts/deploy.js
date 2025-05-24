const { ethers } = require("hardhat");

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying IdentityVerification with deployer:", deployer.address);

  const Identity = await ethers.getContractFactory("IdentityVerification");
  const identity = await Identity.deploy(deployer.address);

  await identity.deployed();
  console.log("IdentityVerification deployed at:", identity.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
