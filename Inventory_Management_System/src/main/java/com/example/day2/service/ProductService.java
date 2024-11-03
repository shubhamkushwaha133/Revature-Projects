package com.example.day2.service;



import com.example.day2.model.Product;
import com.example.day2.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public List<Product> findAll() {
        return productRepository.findAll();
    }

    public Product save(Product product) {
        return productRepository.save(product);
    }

    public void deleteById(Long id) {
        productRepository.deleteById(id);
    }

    public Product findById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
    public List<Product> findLowStockProducts() {
        return productRepository.findByQuantityLessThan(5);
    }

}
