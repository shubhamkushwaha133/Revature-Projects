<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.revature.shubhamKumar.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>

    <!-- CSS Styles -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        h1 {
            color: #fff;
            font-size: 2.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1.5s ease;
        }

        form {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            animation: slideUp 1.5s ease;
        }

        label {
            font-size: 1.1rem;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        button {
            width: 100%;
            background-color: #ff6b6b;
            color: #fff;
            padding: 15px;
            font-size: 1.2rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #ff4757;
        }

        a {
            display: inline-block;
            margin-top: 10px;
            color: #333;
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #ff4757;
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

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>

    <!-- JavaScript for alert and redirection -->
    <script>
        // Function to show success alert and redirect to the dashboard
        function showAlertAndRedirect() {
            alert("Profile updated successfully!");
            window.location.href = "/employee/dashboard";
        }
    </script>
</head>
<body>
    <h1>Edit Employee</h1>

    <!-- Form for editing employee details -->
    <form action="/employee/edit/${employee.id}" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" value="${employee.name}" required>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" value="${employee.email}" required>

        <label for="city">City:</label>
        <input type="text" name="city" id="city" value="${employee.city}">

        <label for="salary">Salary:</label>
        <input type="number" name="salary" id="salary" value="${employee.salary}">

        <label for="position">Position:</label>
        <input type="text" name="position" id="position" value="${employee.position}">

        <label for="department">Department:</label>
        <input type="text" name="department" id="department" value="${employee.department}">

        <label for="role">Role:</label>
        <select name="role" id="role">
            <option value="ADMIN" ${employee.role == 'ADMIN' ? 'selected' : ''}>Admin</option>
            <option value="MANAGER" ${employee.role == 'MANAGER' ? 'selected' : ''}>Manager</option>
            <option value="EMPLOYEE" ${employee.role == 'EMPLOYEE' ? 'selected' : ''}>Employee</option>
        </select>

        <button type="submit">Update Employee</button>
    </form>

    <!-- Cancel button redirects to dashboard -->
    <a href="/employee/dashboard">Cancel</a>

    <%-- Show success pop-up if a success message is present --%>
    <%
        if (request.getAttribute("successMessage") != null) {
    %>
        <script>
            showAlertAndRedirect();
        </script>
    <%
        }
    %>

</body>
</html>
