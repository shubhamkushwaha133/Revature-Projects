<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard</title>

    <!-- CSS Styles -->
    <style>
        /* Global Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #36d1dc 0%, #5b86e5 100%);
            margin: 0;
            padding: 20px;
            color: #333;
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

        nav {
            background-color: #333;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 30px;
            width: 100%;
            max-width: 600px;
            text-align: center;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        nav a {
            color: #fff;
            text-decoration: none;
            font-size: 1.2rem;
            padding: 10px;
            display: inline-block;
            margin: 10px;
            transition: all 0.3s ease;
        }

        nav a:hover {
            background-color: #36d1dc;
            border-radius: 25px;
            padding: 10px 20px;
        }

        h2 {
            font-size: 2rem;
            color: #fff;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        ul li {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 10px;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        ul li:last-child {
            border-bottom: none;
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
    <h1>Welcome, ${employee.name}</h1>

    <nav>
        <a href="/employee/logout">Logout</a>
        <a href="/employee/edit/${employee.id}">Edit My Profile</a>
    </nav>

    <h2>Your Profile</h2>
    <ul>
        <li>Name: ${employee.name}</li>
        <li>Email: ${employee.email}</li>
        <li>City: ${employee.city}</li>
        <li>Salary: ${employee.salary}</li>
        <li>Position: ${employee.position}</li>
        <li>Department: ${employee.department}</li>
    </ul>
</body>
</html>
