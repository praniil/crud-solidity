import hre from "hardhat"

async function deploy() {
    const CRUD = await hre.ethers.getContractFactory("CRUD");
    const crud = await CRUD.deploy();
    const tx = crud.deploymentTransaction();
    const receipt = await tx?.wait();
    console.log(receipt);
    const address = crud.getAddress();
    return address;
}

deploy().then((a) => {
    console.log(a);
})