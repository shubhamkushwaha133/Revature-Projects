<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <!-- Corrected Font Awesome CSS link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #e8f0fe;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
            margin-bottom: 20px;
        }
        .container.welcome {
            background-color: #d1e7dd;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }
        a:hover {
            background-color: green;
        }
        i {
            margin-right: 8px;
        }
    </style>
</head>
<body>

    <!-- Welcome Section -->
    <div class="container welcome">
        <h2> <i class="fas fa-user"></i> Welcome, ${username}! </h2>
    </div>

    <!-- Links Section -->
    <div class="container">
        <a href="/tasks"><i class="fas fa-tasks"></i>View Tasks</a><br>
        <a href="/logout"><i class="fas fa-sign-out-alt"></i>Logout</a>
    </div>

</body>
</html>
