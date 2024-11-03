<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            color: #007bff; /* Blue color for the heading */
            margin-bottom: 20px;
        }

        form {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 400px; /* Fixed width for the form */
            display: flex;
            flex-direction: column;
            gap: 15px; /* Space between form elements */
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"] {
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 10px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #007bff; /* Blue border on focus */
            outline: none;
        }

        button {
            background-color: #28a745; /* Green color */
            color: #ffffff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 16px;
        }

        button:hover {
            background-color: #218838; /* Darker green on hover */
        }

        .back-link {
            margin-top: 15px;
            text-decoration: none;
            color: #ffffff;
            background-color: #dc3545; /* Red color */
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .back-link:hover {
            background-color: #c82333; /* Darker red on hover */
        }
    </style>
</head>
<body>
    <h1>Edit Product</h1>
    <form action="/products/edit/${product.id}" method="post">
        <label>Name:</label>
        <input type="text" name="name" value="${product.name}" required>
        
        <label>Description:</label>
        <input type="text" name="description" value="${product.description}">

        <label>Quantity:</label>
        <input type="number" name="quantity" value="${product.quantity}" required>
        
        <label>Price:</label>
        <input type="number" step="0.01" name="price" value="${product.price}" required>

        <label>Image URL:</label>
        <input type="text" name="image" value="${product.image}"> <!-- Input for image URL -->
        
        <button type="submit">Update Product</button>
    </form>
    <a href="/products" class="back-link">Back to List</a>
</body>
</html>
