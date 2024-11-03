package com.example.TaskManagement.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; // Use the correct Spring Model class
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.TaskManagement.model.Task;
import com.example.TaskManagement.service.TaskService;

import jakarta.servlet.http.HttpSession;
@Controller
@RequestMapping("/tasks")
public class TaskController {

    private final TaskService taskService;

    public TaskController(TaskService taskService) {
        this.taskService = taskService;
    }

    // Check session for all task-related operations
    @GetMapping
    public String getAllTasks(HttpSession session, Model model) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";  // If user is not logged in, redirect to login page
        }

        List<Task> tasks = taskService.getAllTasks();
        model.addAttribute("tasks", tasks);
        return "task-list";  // Returns task-list.jsp
    }

    @GetMapping("/new")
    public String showCreateTaskForm(HttpSession session, Model model) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";  // If user is not logged in, redirect to login page
        }

        model.addAttribute("task", new Task());
        return "task-form";  // Returns task-form.jsp for creating a new task
    }

    @PostMapping("/save")
    public String createOrUpdateTask(@ModelAttribute("task") Task task, HttpSession session) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";  // If user is not logged in, redirect to login page
        }

        taskService.createTask(task);
        return "redirect:/tasks";  // Redirect back to task list after saving
    }

    @GetMapping("/edit/{id}")
    public String showEditTaskForm(@PathVariable Long id, HttpSession session, Model model) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";  // If user is not logged in, redirect to login page
        }

        Task task = taskService.getTaskById(id);
        model.addAttribute("task", task);
        return "task-form";  // Returns task-form.jsp for editing the task
    }

    @GetMapping("/delete/{id}")
    public String deleteTask(@PathVariable Long id, HttpSession session) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";  // If user is not logged in, redirect to login page
        }

        taskService.deleteTask(id);
        return "redirect:/tasks";
    }
}
