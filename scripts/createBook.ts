import hre from "hardhat"

const address = "0x83566E1037b996cB8947AACa4D4A7a2d86D9430B"
const bookAddress = "0x6884521a136a63597212d64dF1bC72AA10392B5b"

async function main() {
    const [owner, otherAccount] = await hre.ethers.getSigners()
    console.log(owner.address)
    console.log(otherAccount.address)
    const crud = await hre.ethers.getContractAt("CRUD", address)
    const create = await crud.createBook(1, "University Physics", "Hugh Young and Roger Freedman", bookAddress)
    const readBook = await crud.readBook(1)
    console.log("create",create)
    console.log("read book", readBook)
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
})