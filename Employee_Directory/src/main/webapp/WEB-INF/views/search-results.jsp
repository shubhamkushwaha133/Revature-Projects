<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.revature.shubhamKumar.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>

    <!-- CSS Styles -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #acb6e5 100%);
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            color: #333;
            font-size: 2.5rem;
            margin-bottom: 20px;
            text-align: center;
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
            background-color: #74ebd5;
            color: #333;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        td {
            color: #333;
        }

        td[colspan="8"] {
            text-align: center;
            font-weight: bold;
            color: #ff6b6b;
        }

        a {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #74ebd5;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #66c5be;
        }

    </style>
</head>
<body>
    <h1>Search Results</h1>

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
            </tr>
        </thead>
        <tbody>
            <%
                // Retrieve the employee list from the request attribute
                List<Employee> employees = (List<Employee>) request.getAttribute("employees");
                
                if (employees != null && !employees.isEmpty()) {
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
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="8">No results found</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="/employee/dashboard">Back to Dashboard</a>
</body>
</html>
