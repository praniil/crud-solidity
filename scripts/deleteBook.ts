import hre from "hardhat"

const address = "0x83566E1037b996cB8947AACa4D4A7a2d86D9430B"

async function main() {
    const [owner, otherAccount] = await hre.ethers.getSigners()

    console.log(owner.address)
    console.log(otherAccount.address)

    const crud = await hre.ethers.getContractAt("CRUD", address)
    const deleteBook = await crud.deleteBook(1);
    await deleteBook.wait();
    const readBook = await crud.readBook(1)
    console.log(readBook)
}

main().catch((error) => {
    console.log(error)
    process.exitCode = 1;
})
