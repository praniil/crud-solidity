// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;
import "hardhat/console.sol";


contract CRUD {
    struct Book {
        uint256 id;
        string name;
        string author;
        address bookAddress;
    }

    Book[] public availableBooks;
    uint public totalBooks;

    mapping (uint256 => Book) public books;

    constructor() {
        totalBooks = 0;
    }

    function createBook(uint256 bookId, string memory name, string memory author, address bookAddress) public returns (uint256) {
        Book memory book1 = Book (bookId, name, author, bookAddress);
        availableBooks.push(book1);
        totalBooks++;
        return totalBooks;
    }
}