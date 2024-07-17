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
        books[bookId] = book1;
        totalBooks++;
        return totalBooks;
    }

    function readBook(uint256 bookId) public view returns (Book memory) {
        Book memory requiredBook = books[bookId];
        require(requiredBook.id != 0, "Book not found");
        return requiredBook;
    }

    function updateBook(uint256 bookId, string memory newName, string memory newAuthor) public view returns (uint256, string memory, string memory) {
        Book memory book = books[bookId];
        require(book.id != 0, "The book doesnt exist. No book with given id exists.");
        book.author = newAuthor;
        book.name = newName;
        return(book.id, book.name, book.author);
    }

    function deleteBook(uint256 bookId) external returns (bool) {
        require(totalBooks > 0, "there is no book to delete");
        for (uint i=0; i< totalBooks; i++) {
            if(availableBooks[i].id == bookId) {
                delete availableBooks[i];
                totalBooks = totalBooks - 1;
                return true;
            }
        }
        return false;
    }
}