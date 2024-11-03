<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Dashboard</title>

    <!-- CSS Styles -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
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
            text-align: center;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
        }

        nav {
            margin-bottom: 30px;
            background-color: #333;
            padding: 15px;
            border-radius: 10px;
            text-align: center;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            font-size: 1.2rem;
            padding: 10px 20px;
            margin: 10px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        nav a:hover {
            background-color: #ff9a9e;
            border-radius: 5px;
        }

        h2 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 15px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        ul li {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 10px;
        }

        form {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            text-align: left;
        }

        label {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 10px;
            display: block;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        button {
            background-color: #ff9a9e;
            color: #fff;
            font-size: 1.2rem;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #ff6b6b;
        }
    </style>
</head>
<body>
    <h1>Welcome, Manager</h1>

    <nav>
        <a href="/employee/list">View All Employees</a>
        <a href="/employee/logout">Logout</a>
    </nav>

    <h2>Manager Privileges</h2>
    <ul>
        <li>Edit employee details (cannot delete employees)</li>
    </ul>

<!--       <h2>Search Employees</h2>
<form action="/employee/search" method="get">
    <label for="id">Employee ID:</label>
    <input type="text" name="id" id="id" placeholder="Enter ID">

    <label for="name">Employee Name:</label>
    <input type="text" name="name" id="name" placeholder="Enter Name">

     <label for="position">Position:</label>
    <select name="position" id="position">
        <option value="">Select Position</option>
        <option value="Testing Engineer">Testing Engineer</option>
        <option value="Web Developer">Web Developer</option>
        <option value="App Developer">App Developer</option>
        <option value="Tech Support">Tech Support</option>
    </select>

    <label for="department">Department:</label>
    <select name="department" id="department">
        <option value="">Select Department</option>
        <option value="IT Services">IT Services</option>
        <option value="Developer">Developer</option>
        <option value="Testing">Testing</option>
    </select>
 
    <button type="submit">Search</button>
</form> -->

<h2>Search Employees</h2>
<form action="/employee/search" method="get">
    <input type="text" name="query" id="query" placeholder="Enter ID, Name, Position, or Department" style="width: 100%; padding: 10px; margin: 10px 0; border-radius: 5px; border: 1px solid #ccc;">
    <button type="submit">Search</button>
</form>


</body>
</html>
