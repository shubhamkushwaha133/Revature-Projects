<%@ page import="java.util.List" %>
<%@ page import="com.revature.shubhamKumar.model.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee List</title>

    <!-- CSS Styles -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 20px;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            color: #fff;
            font-size: 2.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1.5s ease;
        }

        table {
            width: 100%;
            max-width: 1200px;
            margin-bottom: 20px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #667eea;
            color: #fff;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        td a {
            padding: 8px 12px;
            margin-right: 10px;
            background-color: #667eea;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        td a:hover {
            background-color: #764ba2;
        }

        a.dashboard-btn {
            padding: 10px 20px;
            background-color: #667eea;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a.dashboard-btn:hover {
            background-color: #764ba2;
        }

        /* Keyframe Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <h1>Employee Directory</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>City</th>
                <th>Salary</th>
                <th>Position</th>
                <th>Department</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Employee> employees = (List<Employee>) request.getAttribute("employees");
                Employee loggedInEmployee = (Employee) session.getAttribute("loggedInEmployee");

                if (employees != null) {
                    for (Employee employee : employees) {
            %>
                <tr>
                    <td><%= employee.getId() %></td>
                    <td><%= employee.getName() %></td>
                    <td><%= employee.getEmail() %></td>
                    <td><%= employee.getCity() %></td>
                    <td><%= employee.getSalary() %></td>
                    <td><%= employee.getPosition() %></td>
                    <td><%= employee.getDepartment() %></td>
                    <td><%= employee.getRole() %></td>
                    <td>
                        <% if (loggedInEmployee.getRole() == Employee.Role.ADMIN ||
                               loggedInEmployee.getRole() == Employee.Role.MANAGER ||
                               loggedInEmployee.getId().equals(employee.getId())) { %>
                            <a href="/employee/edit/<%= employee.getId() %>">Edit</a>
                        <% } %>
                        <% if (loggedInEmployee.getRole() == Employee.Role.ADMIN ||
                               loggedInEmployee.getId().equals(employee.getId())) { %>
                            <a href="/employee/delete/<%= employee.getId() %>">Delete</a>
                        <% } %>
                    </td>
                </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>

    <a href="/employee/dashboard" class="dashboard-btn">Dashboard</a>
</body>
</html>
