package com.example.day2.controller;



import com.example.day2.model.Category;
import com.example.day2.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/categories")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String listCategories(Model model) {
        List<Category> categories = categoryService.findAll();
        model.addAttribute("categories", categories);
        return "category/list"; // Return JSP for displaying categories
    }

    @GetMapping("/add")
    public String addCategoryForm(Model model) {
        model.addAttribute("category", new Category());
        return "category/add"; // Return JSP for adding a category
    }

    @PostMapping
    public String addCategory(@ModelAttribute Category category) {
        categoryService.save(category);
        return "redirect:/categories"; // Redirect to category list after adding
    }
    
    @GetMapping("/edit/{id}")
    public String editCategoryForm(@PathVariable Long id, Model model) {
        Category category = categoryService.findById(id);
        if (category != null) {
            model.addAttribute("category", category);
            return "category/edit"; // This will return the edit.jsp page
        } else {
            return "redirect:/categories"; // Redirect if category not found
        }
    }

    @PostMapping("/{id}")
    public String updateCategory(@PathVariable Long id, @ModelAttribute Category category) {
        category.setId(id); // Set the ID to ensure the correct category is updated
        categoryService.save(category);
        return "redirect:/categories"; // Redirect to the category list after update
    }
    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable Long id) {
        categoryService.deleteById(id); // Call the service method to delete the category
        return "redirect:/categories"; // Redirect to the category list after deletion
    }

}
