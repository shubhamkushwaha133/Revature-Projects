<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Product Management System</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #e9ecef;
            color: #343a40;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            padding: 20px;
        }

        .container {
            padding: 30px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px; /* Responsive width */
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #007bff;
        }

        h3 {
            margin-bottom: 20px; /* Space below the heading */
            color: #6c757d; /* Dark gray for the subheading */
            font-size: 1.2em; /* Slightly larger font size */
            text-align: center; /* Center the text */
        }

        .button-container {
            display: flex;
            flex-direction: column;
            gap: 15px; /* Space between buttons */
        }

        .button {
            text-decoration: none;
            padding: 15px 20px;
            font-size: 1.2em;
            color: #fff;
            background-color: #28a745; /* Green color */
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            box-shadow: 0 4px 10px rgba(40, 167, 69, 0.4);
        }

        .button:hover {
            background-color: #218838; /* Darker green on hover */
            transform: translateY(-3px); /* Slight lift effect */
        }

        .button:nth-child(2) {
            background-color: #ffc107; /* Yellow color */
        }

        .button:nth-child(2):hover {
            background-color: #e0a800; /* Darker yellow on hover */
        }

        .button:nth-child(3) {
            background-color: #17a2b8; /* Cyan color */
        }

        .button:nth-child(3):hover {
            background-color: #138496; /* Darker cyan on hover */
        }

        .button:nth-child(4) {
            background-color: #dc3545; /* Red color */
        }

        .button:nth-child(4):hover {
            background-color: #c82333; /* Darker red on hover */
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2em;
            }

            h3 {
                font-size: 1.1em; /* Slightly smaller font size on mobile */
            }

            .button {
                font-size: 1em;
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Updated By Shubham Kumar (17th October 5pm)</h3>
        <h1>Inventory Management System</h1>
        <div class="button-container">
            <a href="/products" class="button">View Products</a>
            <a href="/products/low-stock" class="button">Low Stock Products</a>
            <a href="/categories" class="button">Categories</a>
            <a href="/orders" class="button">View Orders</a>
        </div>
    </div>
</body>
</html>
