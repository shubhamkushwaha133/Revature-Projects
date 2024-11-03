<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(135deg, #ff6e7f 0%, #bfe9ff 100%);
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            color: #333;
        }

        h1 {
            font-size: 3rem;
            color: #fff;
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1.5s ease;
        }

        nav {
            background-color: #333;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 30px;
            width: 100%;
            max-width: 600px;
            text-align: center;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            font-size: 1.2rem;
            padding: 10px;
            display: inline-block;
            transition: all 0.3s ease;
        }

        nav a:hover {
            background-color: #ff6e7f;
            border-radius: 25px;
            padding: 10px 15px;
        }

        h2 {
            font-size: 2rem;
            margin-top: 20px;
            color: #fff;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1);
            animation: slideIn 1.5s ease;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            font-size: 1.2rem;
            background: rgba(255, 255, 255, 0.8);
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
             display: inline-block;
        }

        form {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
        }

        label {
            font-size: 1rem;
            color: #333;
        }

        select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #ff6e7f;
            color: #fff;
            font-size: 1.2rem;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background-color: #ff9a9e;
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

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-100px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }
    </style>
</head>
<body>
    <h1>Welcome, Admin</h1>

    <nav>
        <a href="/employee/list">View All Employees</a>
        <a href="/employee/logout">Logout</a>
    </nav>

    <h2>Admin Privileges</h2>
    <ul>
     <li>Edit any employee details</li>
        <li>Delete any employee</li> 
        
       <!--  <li>Create new employees</li> -->
    </ul>
      
    
<!--    <h2>Search Employees</h2>
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

    <script>
        // Add simple animation or interaction with JavaScript if needed later.
    </script>
</body>
</html>
