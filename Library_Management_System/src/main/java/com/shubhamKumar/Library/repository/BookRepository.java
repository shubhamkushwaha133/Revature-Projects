package com.shubhamKumar.Library.repository;

import com.shubhamKumar.Library.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long> {
}
