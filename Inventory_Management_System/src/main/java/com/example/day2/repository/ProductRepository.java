package com.example.day2.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.day2.model.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
	 List<Product> findByQuantityLessThan(int quantity);
}
