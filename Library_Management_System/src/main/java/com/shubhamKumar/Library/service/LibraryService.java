package com.shubhamKumar.Library.service;

import com.shubhamKumar.Library.model.Book;
import com.shubhamKumar.Library.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class LibraryService {

    @Autowired
    private BookRepository bookRepository;

    // Get all books
    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }

    // Get all borrowed books
    public List<Book> getAllBorrowedBooks() {
        return bookRepository.findAll().stream()
                .filter(Book::isBorrowed)
                .toList();
    }

    // Get book by ID
    public Book getBookById(Long id) {
        return bookRepository.findById(id).orElseThrow(() -> new RuntimeException("Book not found"));
    }

    // Add a new book
    public void addBook(Book book) {
        bookRepository.save(book);
    }

    // Update book
    public void updateBook(Long id, Book updatedBook) {
        Book existingBook = getBookById(id);
        existingBook.setTitle(updatedBook.getTitle());
        existingBook.setIsbn(updatedBook.getIsbn());
        existingBook.setAuthor(updatedBook.getAuthor());
        existingBook.setBorrowed(updatedBook.isBorrowed());
        bookRepository.save(existingBook);
    }

    // Delete book
    public void deleteBook(Long id) {
        bookRepository.deleteById(id);
    }

    // Borrow a book
    public void borrowBook(Long bookId, Long borrowerId) {
        Book book = bookRepository.findById(bookId).orElseThrow();
        if (!book.isBorrowed()) {
            book.setBorrowed(true);
            book.setBorrowDate(new Date());

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(new Date());
            calendar.add(Calendar.DATE, 10);  // 10-day loan period
            book.setDueDate(calendar.getTime());

            bookRepository.save(book);
        }
    }

    public void returnBook(Long bookId) {
        Book book = bookRepository.findById(bookId).orElseThrow();
        if (book.isBorrowed()) {
            book.setBorrowed(false);
            book.setBorrowDate(null);
            book.setDueDate(null);
            bookRepository.save(book);
        }
    }

}
