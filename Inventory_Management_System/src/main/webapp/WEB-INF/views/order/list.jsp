<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.day2.model.OrderEntity" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Light background color */
            color: #333; /* Dark text color */
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }

        h1 {
            color: #007bff; /* Blue color for heading */
            margin-bottom: 20px;
        }

        .order-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px; /* Space between cards */
        }

        .order-card {
            background-color: #ffffff; /* White card background */
            border: 1px solid #dee2e6; /* Light border */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Shadow effect */
            padding: 15px;
            width: 250px; /* Fixed card width */
            text-align: center; /* Centered text */
            transition: transform 0.2s; /* Smooth transform effect */
        }

        .order-card:hover {
            transform: scale(1.05); /* Scale up card on hover */
        }

        img {
            max-width: 100%; /* Responsive image */
            height: auto; /* Auto height */
            border-radius: 5px; /* Rounded image corners */
        }

        .back-link {
            margin-top: 20px;
            text-decoration: none;
            color: #ffffff; /* White text color */
            background-color: #dc3545; /* Red color for back button */
            padding: 10px 15px;
            border-radius: 5px; /* Rounded corners */
            transition: background-color 0.3s ease; /* Transition effect */
        }

        .back-link:hover {
            background-color: #c82333; /* Darker red on hover */
        }
    </style>
</head>
<body>
    <h1>Order List</h1>
    <div class="order-container">
        <%
            List<OrderEntity> orders = (List<OrderEntity>) request.getAttribute("orders");
            if (orders != null && !orders.isEmpty()) {
                for (OrderEntity order : orders) {
        %>
            <div class="order-card">
                <h3>Order ID: <%= order.getId() %></h3>
                <p><strong>Product Name:</strong> <%= order.getProduct().getName() %></p>
                <p><strong>Quantity:</strong> <%= order.getQuantity() %></p>
                <p><strong>Status:</strong> <%= order.getStatus() %></p>
                <p><strong>Order Date:</strong> <%= order.getOrderDate() %></p>
                <img src="<%= order.getProductImage() %>" alt="Product Image"/>
            </div>
        <%
                }
            } else {
        %>
            <p>No orders found.</p>
        <%
            }
        %>
    </div>
    <a href="/products" class="back-link">Back to Products</a>
     <a href="/" class="back-link">Home</a>
</body>
</html>
