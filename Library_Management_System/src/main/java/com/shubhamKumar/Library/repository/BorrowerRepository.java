package com.shubhamKumar.Library.repository;



import com.shubhamKumar.Library.model.Borrower;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BorrowerRepository extends JpaRepository<Borrower, Long> {
}
