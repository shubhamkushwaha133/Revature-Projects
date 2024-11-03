<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.day2.model.Category" %>
<%@ page import="com.example.day2.service.CategoryService" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Category</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Light background color */
            color: #333; /* Dark text color */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            color: #007bff; /* Blue color for heading */
            margin-bottom: 20px;
        }

        form {
            background-color: #ffffff; /* White form background */
            border: 1px solid #dee2e6; /* Light border */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Shadow effect */
            padding: 20px;
            width: 300px; /* Fixed width for form */
            display: flex;
            flex-direction: column; /* Column layout for form elements */
            gap: 15px; /* Space between form elements */
        }

        label {
            font-weight: bold; /* Bold labels */
        }

        input[type="text"] {
            padding: 10px;
            border: 1px solid #ced4da; /* Light border */
            border-radius: 5px; /* Rounded input corners */
            transition: border-color 0.3s; /* Transition for border color */
        }

        input[type="text"]:focus {
            border-color: #007bff; /* Change border color on focus */
            outline: none; /* Remove outline */
        }

        button {
            background-color: #007bff; /* Blue button color */
            color: #ffffff; /* White text color */
            padding: 10px;
            border: none; /* Remove border */
            border-radius: 5px; /* Rounded button corners */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background-color 0.3s; /* Transition for background color */
        }

        button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .back-link {
            margin-top: 20px;
            text-decoration: none;
            color: #ffffff; /* White text color */
            background-color: #dc3545; /* Red color for back button */
            padding: 10px 15px;
            border-radius: 5px; /* Rounded corners */
            transition: background-color 0.3s ease; /* Transition effect */
        }

        .back-link:hover {
            background-color: #c82333; /* Darker red on hover */
        }
    </style>
</head>
<body>
    <h1>Edit Category</h1>

    <%
        // Retrieve the category object from the request attribute
        Category category = (Category) request.getAttribute("category");
    %>

    <form action="/categories/<%= category.getId() %>" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= category.getName() %>" required>
        <button type="submit">Update Category</button>
    </form>

    <a href="/categories" class="back-link">Back to List</a>
</body>
</html>
