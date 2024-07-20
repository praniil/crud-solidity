// SPDX-License-Identifier: MIT
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
        require(books[bookId].id == 0, "Book with this ID already exists");
        Book memory book1 = Book(bookId, name, author, bookAddress);
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

    function updateBook(uint256 bookId, string memory newName, string memory newAuthor) public returns (uint256, string memory, string memory) {
        Book storage book = books[bookId];
        require(book.id != 0, "The book does not exist.");
        require(book.bookAddress == msg.sender, "Unauthorized entry");
        book.author = newAuthor;
        book.name = newName;
        return (book.id, book.name, book.author);
    }

    function deleteBook(uint256 bookId) external returns (bool) {
        require(totalBooks > 0, "There are no books to delete");
        Book storage book = books[bookId];
        require(book.id != 0, "Book does not exist");
        require(book.bookAddress == msg.sender, "Unauthorized access");

        for (uint i = 0; i < availableBooks.length; i++) {
            if (availableBooks[i].id == bookId) {
                if (i < availableBooks.length - 1) {
                    availableBooks[i] = availableBooks[availableBooks.length - 1];
                }
                availableBooks.pop();
                break;
            }
        }
        
        delete books[bookId];
        totalBooks--;
        return true;
    }
}
