<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Employee</title>

    <!-- CSS Styles -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .register-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            margin: 40px 0; /* Added margin on top and bottom */
        }

        h1 {
            color: #333;
            font-size: 2rem;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 5px;
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
            background-color: #f77f00;
            color: #fff;
            font-size: 1.2rem;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #d65a00;
        }

        a {
            margin-top: 20px;
            text-align: center;
            display: inline-block;
            color: #333;
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #f77f00;
        }

    </style>
</head>
<body>
    <div class="register-container">
        <h1>Employee Registration</h1>
        <form action="/employee/register" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" id="name" required>

            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required>

            <label for="city">City:</label>
            <input type="text" name="city" id="city">

            <label for="salary">Salary:</label>
            <input type="number" name="salary" id="salary">

            <!-- Position Dropdown -->
            <label for="position">Position:</label>
            <select name="position" id="position">
                <option value="">Select Position</option>
                <option value="Testing Engineer">Testing Engineer</option>
                <option value="Web Developer">Web Developer</option>
                <option value="App Developer">App Developer</option>
                <option value="Tech Support">Tech Support</option>
            </select>

            <!-- Department Dropdown -->
            <label for="department">Department:</label>
            <select name="department" id="department">
                <option value="">Select Department</option>
                <option value="IT Services">IT Services</option>
                <option value="Developer">Developer</option>
                <option value="Testing">Testing</option>
            </select>

            <label for="role">Role:</label>
            <select name="role" id="role">
                <option value="ADMIN">Admin</option>
                <option value="MANAGER">Manager</option>
                <option value="EMPLOYEE">Employee</option>
            </select>

            <button type="submit">Register</button>
        </form>
        <a href="../">Home</a>
    </div>
</body>
</html>
