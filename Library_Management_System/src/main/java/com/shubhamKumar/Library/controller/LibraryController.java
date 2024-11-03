package com.shubhamKumar.Library.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.shubhamKumar.Library.model.Author;
import com.shubhamKumar.Library.model.Book;
import com.shubhamKumar.Library.repository.AuthorRepository;
import com.shubhamKumar.Library.service.LibraryService;

@Controller
@RequestMapping("/library")
public class LibraryController {

    @Autowired
    private LibraryService libraryService;

    @Autowired
    private AuthorRepository authorRepository;

    // List all books
    @GetMapping("/books")
    public String listBooks(Model model) {
        model.addAttribute("books", libraryService.getAllBooks());
        return "books";
    }

    // Borrow a book
    @PostMapping("/borrow")
    public String borrowBook(@RequestParam Long bookId, @RequestParam Long borrowerId) {
        libraryService.borrowBook(bookId, borrowerId);
        return "redirect:/library/borrowedBooks";
    }

    // Show all borrowed books with charges and fines
    @GetMapping("/borrowedBooks")
    public String listBorrowedBooks(Model model) {
        List<Book> borrowedBooks = libraryService.getAllBorrowedBooks();
        model.addAttribute("borrowedBooks", borrowedBooks);
        return "borrowedBooks";
    }

    // Add new book form
    @GetMapping("/books/add")
    public String showAddBookForm(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("authors", authorRepository.findAll());
        return "addBook";
    }

    // Add new book
    @PostMapping("/books/add")
    public String addBook(@ModelAttribute("book") Book book, @RequestParam Long authorId) {
        Author author = authorRepository.findById(authorId)
                .orElseThrow(() -> new RuntimeException("Author not found"));
        book.setAuthor(author);
        libraryService.addBook(book);
        return "redirect:/library/books";
    }

    // Edit book form
    @GetMapping("/books/edit/{id}")
    public String showEditBookForm(@PathVariable Long id, Model model) {
        Book book = libraryService.getBookById(id);
        model.addAttribute("book", book);
        model.addAttribute("authors", authorRepository.findAll());
        return "editBook";
    }

    // Update book
    @PostMapping("/books/edit/{id}")
    public String editBook(@PathVariable Long id, @ModelAttribute("book") Book updatedBook, @RequestParam Long authorId) {
        Author author = authorRepository.findById(authorId)
                .orElseThrow(() -> new RuntimeException("Author not found"));
        updatedBook.setAuthor(author);
        libraryService.updateBook(id, updatedBook);
        return "redirect:/library/books";
    }

    // Delete book
    @PostMapping("/books/delete/{id}")
    public String deleteBook(@PathVariable Long id) {
        libraryService.deleteBook(id);
        return "redirect:/library/books";
    }

    @PostMapping("/return")
    public String returnBook(@RequestParam Long bookId) {
        libraryService.returnBook(bookId);
        return "redirect:/library/books";
    }
    

    @GetMapping("/authors/add")
       public String showAddAuthorForm(Model model) {
           model.addAttribute("author", new Author());
           return "addAuthor";
       }

       // Add new author
       @PostMapping("/authors/add")
       public String addAuthor(@ModelAttribute("author") Author author) {
           authorRepository.save(author);
           return "redirect:/library/authors";
       }

       // List all authors (optional)
       @GetMapping("/authors")
       public String listAuthors(Model model) {
           model.addAttribute("authors", authorRepository.findAll());
           return "authors";
       }

}







