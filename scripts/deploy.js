const hardhat = require("hardhat");

async function main() {
  const factory = await hardhat.ethers.getContractFactory("Vote");
  const storage = await factory.deploy();
  await storage.deployed();
  console.log("Contract deployed to:", storage.address);
}

main()
  .then(() => {
    process.exit(0);
  })
  .catch((err) => {
    process.exit(1);
  });
