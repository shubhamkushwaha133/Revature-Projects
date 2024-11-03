<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.day2.model.Product" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Space between cards */
            justify-content: center;
            max-width: 1200px;
        }

        .product-card {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding: 15px;
            width: 250px; /* Card width */
            text-align: center;
            transition: transform 0.2s;
        }

        .product-card:hover {
            transform: translateY(-5px); /* Lift effect on hover */
        }

        .product-card h3 {
            color: #28a745; /* Green for product name */
            margin-bottom: 10px;
        }

        .product-card img {
            width: 100px; /* Fixed width for images */
            height: 100px; /* Fixed height for images */
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .action-buttons {
            margin-top: 15px;
        }

        .action-buttons a {
            text-decoration: none;
            color: #fff;
            background-color: #007bff; /* Blue color */
            padding: 10px 15px;
            border-radius: 5px;
            margin: 5px;
            transition: background-color 0.3s ease;
        }

        .action-buttons a:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .order-form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 10px;
        }

        .order-form input {
            width: 80%;
            padding: 5px;
            margin-bottom: 5px;
            border-radius: 5px;
            border: 1px solid #ced4da;
        }

        .order-form button {
            color: #fff;
            background-color: #28a745; /* Green for order button */
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .order-form button:hover {
            background-color: #218838; /* Darker green on hover */
        }

        .back-link {
            margin-top: 20px;
            text-decoration: none;
            color: #ffffff;
            background-color: #dc3545; /* Red color */
            padding: 10px 15px;
            border-radius: 5px;
        }

        .back-link:hover {
            background-color: #c82333; /* Darker red on hover */
        }
    </style>
</head>
<body>
    <h1>Product List</h1>
    
    <div class="product-container">
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
            <div class="product-card">
                <h3><%= product.getName() %></h3>
                <img src="<%= product.getImage() %>" alt="<%= product.getName() %>"/>
                <p><strong>Description:</strong> <%= product.getDescription() %></p>
                <p><strong>Quantity:</strong> <%= product.getQuantity() %></p>
                <p><strong>Price:</strong> $<%= product.getPrice() %></p>
                <p><strong>Category:</strong> <%= product.getCategory() != null ? product.getCategory().getName() : "N/A" %></p>
                <div class="action-buttons">
                    <a href="/products/edit/<%= product.getId() %>">Edit</a>
                    <a href="/products/delete/<%= product.getId() %>">Delete</a>
                </div>
                <form action="/products/<%= product.getId() %>/order" method="post" class="order-form">
                  <br><br>  <input type="number" name="quantity" min="1" max="<%= product.getQuantity() %>" placeholder="Enter Quantity to order" required>
                    <button type="submit">Order</button>
                </form>
            </div>
        <%
                }
            } else {
        %>
            <div class="product-card">
                <p>No products found</p>
            </div>
        <%
            }
        %>
    </div>
    <p><br> <br>
    <a href="/products/add" class="back-link">Add Product</a>
    <a href="/orders" class="back-link">View Orders</a>
    <a href="/" class="back-link">Home</a></p>
</body>
</html>
