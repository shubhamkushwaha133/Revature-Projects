<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create/Edit Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            background-color: #fff;
            padding: 20px;
            margin: 0 auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #218838;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h2>${task.id == null ? 'Create Task' : 'Edit Task'}</h2>

    <form action="/tasks/save" method="POST">
        <input type="hidden" name="id" value="${task.id}" />

        <label for="title">Title:</label>
        <input type="text" name="title" value="${task.title}" required />

        <label for="description">Description:</label>
        <input type="text" name="description" value="${task.description}" required />

        <label for="priority">Priority:</label>
        <select name="priority" required>
            <option value="LOW" ${task.priority == 'LOW' ? 'selected' : ''}>Low</option>
            <option value="MEDIUM" ${task.priority == 'MEDIUM' ? 'selected' : ''}>Medium</option>
            <option value="HIGH" ${task.priority == 'HIGH' ? 'selected' : ''}>High</option>
        </select>

        <label for="dueDate">Due Date:</label>
        <input type="date" name="dueDate" value="${task.dueDate}" required />

        <label for="status">Status:</label>
        <select name="status" required>
            <option value="OPEN" ${task.status == 'OPEN' ? 'selected' : ''}>Open</option>
            <option value="CLOSED" ${task.status == 'CLOSED' ? 'selected' : ''}>Closed</option>
        </select>

        <button type="submit">Save Task</button>
    </form>

    <div style="text-align: center;">
        <a href="/tasks">Back to Task List</a>
    </div>

</body>
</html>
