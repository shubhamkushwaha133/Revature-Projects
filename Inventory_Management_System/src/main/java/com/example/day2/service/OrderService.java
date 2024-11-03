package com.example.day2.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.day2.model.OrderEntity;
import com.example.day2.model.Product;
import com.example.day2.repository.OrderRepository;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public OrderEntity createOrder(Product product, int quantity) {
    	OrderEntity order = new OrderEntity();
        order.setProduct(product);
        order.setQuantity(quantity);
        order.setStatus("Processing");
        order.setOrderDate(new Date());
        order.setProductImage(product.getImage()); // Set product image
        return orderRepository.save(order);
    }
    public List<OrderEntity> findAll() {
        return orderRepository.findAll();
    }

}
