package com.shubhamKumar.Library.repository;


import com.shubhamKumar.Library.model.Author;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorRepository extends JpaRepository<Author, Long> {
}
