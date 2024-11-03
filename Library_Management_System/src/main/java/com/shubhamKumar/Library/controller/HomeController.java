package com.shubhamKumar.Library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	 //home page 
    @GetMapping("/")
    public String homePage() {
        return "home";
    }

}
