<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management System</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <!-- CSS Styles -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: #ecf0f1;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ensure body covers full height */
        }

        .container {
            flex-grow: 1; /* Allows the container to take up the remaining space */
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .section {
            width: 100%;
            padding: 50px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .section:nth-child(odd) {
            background-color: white;
        }

        .section:nth-child(even) {
            background-color: #ecf0f1;
        }

        h1 {
            font-size: 48px;
            margin-bottom: 10px;
            color: #273746 ;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
        }

        h2 {
            font-size: 28px;
            margin-bottom: 40px;
            color: black;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        a {
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            background-color: blue;
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        a:hover {
            background-color: green;
            transform: translateY(-5px);
        }

        footer {
            background-color: #f0f3f4;
            color: black;
            padding: 20px;
            text-align: center;
            position: relative;
            width: 100%;
        }

        footer p {
            margin: 0;
            font-size: 14px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h1 {
                font-size: 36px;
            }

            h2 {
                font-size: 22px;
                
            }

            a {
                font-size: 16px;
                padding: 12px 25px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Section 1: Title and Subtitle -->
        <div class="section">
            <h1>Shubham Kumar</h1>
            <h2>Task Management System</h2>
        </div>

        <!-- Section 2: Links -->
        <div class="section">
         <p>  <a href="${pageContext.request.contextPath}/login">Login</a>
            <a href="${pageContext.request.contextPath}/register">Registration</a> </p>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 Task Management System. All Rights Reserved. Shubham Kumar</p>
    </footer>

</body>
</html>
