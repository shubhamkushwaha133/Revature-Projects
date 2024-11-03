package com.example.day2.controller;

import com.example.day2.model.OrderEntity;
import com.example.day2.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrderController {
    @Autowired
    private OrderService orderService;

    @GetMapping
    public String listOrders(Model model) {
        List<OrderEntity> orders = orderService.findAll(); // You need to implement this method in OrderService
        model.addAttribute("orders", orders);
        return "order/list"; // Return to order list JSP
    }
}
