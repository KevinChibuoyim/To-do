import { ethers } from "hardhat";

async function main() {

  const ToDoList = await ethers.getContractFactory("To_Do_List");
  const todolist = await ToDoList.deploy();

  await todolist.deployed();

  console.log(`Created a To-Do list contract deployed to ${todolist.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
