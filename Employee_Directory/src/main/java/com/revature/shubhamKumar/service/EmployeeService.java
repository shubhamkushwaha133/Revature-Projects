package com.revature.shubhamKumar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.shubhamKumar.model.Employee;
import com.revature.shubhamKumar.repository.EmployeeRepository;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    public Employee saveEmployee(Employee employee) {
        return employeeRepository.save(employee);
    }

    public Optional<Employee> getEmployeeById(Long id) {
        return employeeRepository.findById(id);
    }

    public List<Employee> searchByPosition(String position) {
        return employeeRepository.findByPosition(position);
    }

    public List<Employee> searchByDepartment(String department) {
        return employeeRepository.findByDepartment(department);
    }

    public List<Employee> searchByPositionAndDepartment(String position, String department) {
        return employeeRepository.findByPositionAndDepartment(position, department);
    }

    public void deleteEmployee(Long id) {
        employeeRepository.deleteById(id);
    }
    
    public List<Employee> searchByName(String name) {
        return employeeRepository.findByNameContainingIgnoreCase(name);
    }
    
    public List<Employee> searchByNameOrPositionOrDepartment(String query) {
        return employeeRepository.findByNameContainingIgnoreCaseOrPositionContainingIgnoreCaseOrDepartmentContainingIgnoreCase(query, query, query);
    }


}
