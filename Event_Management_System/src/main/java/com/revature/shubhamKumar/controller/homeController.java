package com.revature.shubhamKumar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class homeController {
	
	@GetMapping
    public String showHome() {
        return "home";
    }

}