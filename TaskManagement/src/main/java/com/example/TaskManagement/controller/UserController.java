package com.example.TaskManagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.TaskManagement.model.User;
import com.example.TaskManagement.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // Display home page
    @GetMapping("/")
    public String home(HttpSession session, Model model) {
        String loggedInUser = (String) session.getAttribute("username");
        if (loggedInUser != null) {
            model.addAttribute("username", loggedInUser);
            return "success"; // Redirect to success page if already logged in
        }
        return "home"; // Redirect to login if not logged in
    }

    // Display login page
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    // Handle login form submission
 // Handle login form submission
    @PostMapping("/login")
    public String handleLogin(@RequestParam("username") String username, 
                              @RequestParam("password") String password, 
                              HttpSession session, Model model) {
        // Find user by username
        User user = userService.findByUsername(username);

        if (user != null) {
            // Debugging: Print hashed password from the database and the password being checked
            System.out.println("Password from database: " + user.getPassword());
            System.out.println("Password entered: " + password);

            // Correctly check if raw password matches the stored hashed password
            if (passwordEncoder.matches(password, user.getPassword())) {
                // Password matches, create session
                session.setAttribute("username", user.getUsername());
                session.setAttribute("userId", user.getId());
                System.out.println("Password matches.");
                return "redirect:/success";
            } else {
                // Password does not match
                System.out.println("Password mismatch.");
                model.addAttribute("error", "Invalid username or password");
                return "login";
            }
        } else {
            // User not found
            System.out.println("User not found.");
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }
    
    


    
    
    // Display registration page
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }


    
 // Handle registration form submission
    @PostMapping("/register")
    public String processRegistration(@ModelAttribute("user") User user, Model model) {
        // Check if user with the same username already exists
        User existingUser = userService.findByUsername(user.getUsername());
        if (existingUser != null) {
            model.addAttribute("error", "Username already exists!");
            return "register";
        }

        // Save the plain text password directly (No encoding)
        // Only for testing, not recommended for production
        String plainPassword = user.getPassword();
        user.setPassword(plainPassword);

        // Debugging: Print plain text password during registration
        System.out.println("Plain text password during registration: " + plainPassword);

        // Save the user
        userService.registerUser(user);

        return "redirect:/login"; // Redirect to login page after successful registration
    }



    // Display success page after successful login
    @GetMapping("/success")
    public String success(HttpSession session, Model model) {
        String loggedInUser = (String) session.getAttribute("username");
        if (loggedInUser == null) {
            return "redirect:/login"; // Redirect to login if not logged in
        }
        model.addAttribute("username", loggedInUser);
        return "success";
    }

    // Handle logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // Invalidate the session to log out the user
        session.invalidate();
        return "redirect:/login";
    }
}
