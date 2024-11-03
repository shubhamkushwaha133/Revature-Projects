<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f0f4f8;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            text-decoration: none;
            color: #007BFF;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        a:hover {
            background-color: green;
            color: #fff;
        }
        .action-links a {
            margin-right: 10px;
        }
        .create-task {
            display: block;
            margin: 20px 0;
            padding: 10px 20px;
            background-color: blue;
            color: white;
            text-align: center;
            border-radius: 5px;
            width: 200px;
            margin-left: auto;
            margin-right: auto;
            text-decoration: none;
        }
        .create-task:hover {
            background-color: green;
        }
    </style>
</head>
<body>
    <h2>Task List</h2>
   
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Priority</th>
                <th>Status</th>
                <th>Due Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Importing the required classes
                List<com.example.TaskManagement.model.Task> tasks = (List<com.example.TaskManagement.model.Task>) request.getAttribute("tasks");
                if (tasks != null && !tasks.isEmpty()) {
                    for (com.example.TaskManagement.model.Task task : tasks) {
            %>
                <tr>
                    <td><%= task.getId() %></td>
                    <td><%= task.getTitle() %></td>
                    <td><%= task.getDescription() %></td>
                    <td><%= task.getPriority() %></td>
                    <td><%= task.getStatus() %></td>
                    <td><%= task.getDueDate() %></td>
                    <td class="action-links">
                        <a href="/tasks/edit/<%= task.getId() %>">Edit</a>
                        <a href="/tasks/delete/<%= task.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            <% 
                    } 
                } else {
            %>
                <tr>
                    <td colspan="7" style="text-align: center;">No tasks available.</td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <a href="/tasks/new" class="create-task">Create New Task</a>
    <a href="/success" class="create-task">User Page</a>
   

</body>
</html>
