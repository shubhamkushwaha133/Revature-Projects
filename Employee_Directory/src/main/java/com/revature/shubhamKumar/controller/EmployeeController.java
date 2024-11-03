package com.revature.shubhamKumar.controller;

import com.revature.shubhamKumar.model.Employee;
import com.revature.shubhamKumar.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("employee", new Employee());
        return "register";
    }

    @PostMapping("/register")
    public String registerEmployee(@ModelAttribute Employee employee, HttpSession session) {
        employeeService.saveEmployee(employee);
        session.setAttribute("loggedInEmployee", employee);
        return "redirect:/employee/dashboard";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session) {
        Optional<Employee> employee = employeeService.getAllEmployees().stream()
                .filter(e -> e.getEmail().equals(email) && e.getPassword().equals(password))
                .findFirst();
        if (employee.isPresent()) {
            session.setAttribute("loggedInEmployee", employee.get());
            return "redirect:/employee/dashboard";
        }
        return "login";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Employee loggedInEmployee = (Employee) session.getAttribute("loggedInEmployee");
        if (loggedInEmployee == null) {
            return "redirect:/employee/login";
        }
        model.addAttribute("employee", loggedInEmployee);

        // Redirect based on the user's role
        if (loggedInEmployee.getRole() == Employee.Role.ADMIN) {
            return "admin-dashboard";  // JSP for admin dashboard
        } else if (loggedInEmployee.getRole() == Employee.Role.MANAGER) {
            return "manager-dashboard";  // JSP for manager dashboard
        } else {
            return "employee-dashboard";  // JSP for employee dashboard
        }
    }

    @GetMapping("/list")
    public String listEmployees(Model model) {
        List<Employee> employees = employeeService.getAllEmployees();
        model.addAttribute("employees", employees);
        return "list";
    }

    // New logout mapping
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate the session
        return "redirect:/employee/login"; // Redirect to login page
    }

    // Edit employee - GET method to display the form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, HttpSession session, Model model) {
        Employee loggedInEmployee = (Employee) session.getAttribute("loggedInEmployee");
        Optional<Employee> employeeOpt = employeeService.getEmployeeById(id);

        if (employeeOpt.isPresent()) {
            Employee employee = employeeOpt.get();

            // Prevent Managers from editing Admins
            if (employee.getRole() == Employee.Role.ADMIN && loggedInEmployee.getRole() != Employee.Role.ADMIN) {
                return "redirect:/employee/dashboard";  // Redirect if unauthorized
            }

            // Allow Admin, Manager, or the employee themselves to edit
            if (loggedInEmployee.getRole() == Employee.Role.ADMIN ||
                loggedInEmployee.getRole() == Employee.Role.MANAGER && employee.getRole() != Employee.Role.ADMIN ||
                loggedInEmployee.getId().equals(id)) {

                model.addAttribute("employee", employee);
                return "edit-employee";  // Render the edit page
            }
        }

        return "redirect:/employee/dashboard";  // Redirect if unauthorized or employee not found
    }

    @PostMapping("/edit/{id}")
    public String updateEmployee(@PathVariable("id") Long id, @ModelAttribute Employee updatedEmployee, HttpSession session, Model model) {
        Employee loggedInEmployee = (Employee) session.getAttribute("loggedInEmployee");
        Optional<Employee> existingEmployeeOpt = employeeService.getEmployeeById(id);

        if (existingEmployeeOpt.isPresent()) {
            Employee existingEmployee = existingEmployeeOpt.get();

            // Prevent Managers from updating Admins
            if (existingEmployee.getRole() == Employee.Role.ADMIN && loggedInEmployee.getRole() != Employee.Role.ADMIN) {
                return "redirect:/employee/dashboard";  // Redirect if unauthorized
            }

            // Allow Admin, Manager (not editing Admins), or the employee themselves to update
            if (loggedInEmployee.getRole() == Employee.Role.ADMIN ||
                loggedInEmployee.getRole() == Employee.Role.MANAGER && existingEmployee.getRole() != Employee.Role.ADMIN ||
                loggedInEmployee.getId().equals(id)) {

                // Keep the original password if it's not updated
                if (updatedEmployee.getPassword() == null || updatedEmployee.getPassword().isEmpty()) {
                    updatedEmployee.setPassword(existingEmployee.getPassword());
                }

                // Update other fields
                existingEmployee.setName(updatedEmployee.getName());
                existingEmployee.setEmail(updatedEmployee.getEmail());
                existingEmployee.setCity(updatedEmployee.getCity());
                existingEmployee.setSalary(updatedEmployee.getSalary());
                existingEmployee.setPosition(updatedEmployee.getPosition());
                existingEmployee.setDepartment(updatedEmployee.getDepartment());
                existingEmployee.setRole(updatedEmployee.getRole());

                // Save the updated employee
                employeeService.saveEmployee(existingEmployee);

                // If the logged-in user is editing their own profile, update the session
                if (loggedInEmployee.getId().equals(id)) {
                    session.setAttribute("loggedInEmployee", existingEmployee);
                }

                // Add success message for pop-up
                model.addAttribute("successMessage", "Profile updated successfully!");
            }
        }

        // Instead of trying to access manager-dashboard or admin-dashboard directly, redirect to the general dashboard
        return "redirect:/employee/dashboard";
    }

    // Delete employee - GET method to delete the employee
    @GetMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable("id") Long id, HttpSession session) {
        Employee loggedInEmployee = (Employee) session.getAttribute("loggedInEmployee");
        Optional<Employee> employeeOpt = employeeService.getEmployeeById(id);

        if (employeeOpt.isPresent()) {
            Employee employee = employeeOpt.get();

            // Prevent Managers from deleting Admins
            if (employee.getRole() == Employee.Role.ADMIN && loggedInEmployee.getRole() != Employee.Role.ADMIN) {
                return "redirect:/employee/dashboard";  // Redirect if unauthorized
            }

            // Admin can delete anyone, Employee can delete only themselves
            if (loggedInEmployee.getRole() == Employee.Role.ADMIN ||
                loggedInEmployee.getId().equals(id)) {

                employeeService.deleteEmployee(id);
                if (loggedInEmployee.getId().equals(id)) {
                    session.invalidate(); // Invalidate session if employee deletes their own account
                    return "redirect:/employee/login"; // Redirect to login if self-deleted
                }
                return "redirect:/employee/list"; // Redirect to employee list if admin deleted someone
            }
        }

        return "redirect:/employee/dashboard";  // Unauthorized users get redirected
    }
    
	/*
	 * @GetMapping("/search") public String searchEmployees(
	 * 
	 * @RequestParam(value = "id", required = false) Long id,
	 * 
	 * @RequestParam(value = "name", required = false) String name,
	 * 
	 * @RequestParam(value = "position", required = false) String position,
	 * 
	 * @RequestParam(value = "department", required = false) String department,
	 * Model model) {
	 * 
	 * List<Employee> employees;
	 * 
	 * if (id != null) { // Search by ID if provided Optional<Employee> employeeOpt
	 * = employeeService.getEmployeeById(id); employees =
	 * employeeOpt.map(List::of).orElse(List.of()); } else if (name != null &&
	 * !name.isEmpty()) { // Search by Name if provided employees =
	 * employeeService.searchByName(name); } else if ((position != null &&
	 * !position.isEmpty()) && (department != null && !department.isEmpty())) { //
	 * Search by both Position and Department employees =
	 * employeeService.searchByPositionAndDepartment(position, department); } else
	 * if (position != null && !position.isEmpty()) { // Search by Position only
	 * employees = employeeService.searchByPosition(position); } else if (department
	 * != null && !department.isEmpty()) { // Search by Department only employees =
	 * employeeService.searchByDepartment(department); } else { // If no criteria is
	 * provided, return all employees employees = employeeService.getAllEmployees();
	 * }
	 * 
	 * model.addAttribute("employees", employees); return "search-results"; //
	 * Ensure 'search-results.jsp' is mapped correctly }
	 */

    @GetMapping("/search")
    public String searchEmployees(@RequestParam(value = "query", required = false) String query, Model model) {
        List<Employee> employees;

        if (query == null || query.isEmpty()) {
            employees = employeeService.getAllEmployees();
        } else {
            try {
                // Try to parse as ID
                Long id = Long.parseLong(query);
                Optional<Employee> employeeOpt = employeeService.getEmployeeById(id);
                employees = employeeOpt.map(List::of).orElse(List.of());
            } catch (NumberFormatException e) {
                // Not an ID, search by name, position, or department
                employees = employeeService.searchByNameOrPositionOrDepartment(query);
            }
        }

        model.addAttribute("employees", employees);
        return "search-results"; // Ensure 'search-results.jsp' is mapped correctly
    }

    
}
