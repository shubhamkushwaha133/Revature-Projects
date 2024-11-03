package com.revature.shubhamKumar.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String city;
    private double salary;
    private String position;
    private String department;

    // New field for password
    private String password;

    @Enumerated(EnumType.STRING)
    private Role role;

    public enum Role {
        ADMIN, MANAGER, EMPLOYEE
    }

    // Getters and setters (Lombok will handle it)
}
