const hardhat = require("hardhat");

async function main() {
  const factory = await hardhat.ethers.getContractFactory("Vote");
  const storage = await factory.deploy();
  const address = await storage.getAddress();
  console.log("Contract deployed to:", address);
}

main()
  .then(() => {
    process.exit(0);
  })
  .catch((err) => {
    console.info(err);
    process.exit(1);
  });
