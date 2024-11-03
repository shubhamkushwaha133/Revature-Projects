package com.revature.shubhamKumar.repository;

import com.revature.shubhamKumar.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
	  List<Employee> findByPosition(String position);
	    List<Employee> findByDepartment(String department);
	    List<Employee> findByPositionAndDepartment(String position, String department);
	    List<Employee> findByNameContainingIgnoreCase(String name);
	    List<Employee> findByNameContainingIgnoreCaseOrPositionContainingIgnoreCaseOrDepartmentContainingIgnoreCase(String name, String position, String department);
	    
}
