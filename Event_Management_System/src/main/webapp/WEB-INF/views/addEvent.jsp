<%@ page import="java.util.List" %>
<%@ page import="com.revature.shubhamKumar.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add Event</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- CSS Styles -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #2c3e50;
        }

        input[type="text"],
        input[type="date"],
        select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 20px;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1abc9c;
        }

        a {
            text-decoration: none;
            color: #2980b9;
            font-weight: bold;
            display: inline-block;
            margin-top: 10px;
        }

        a:hover {
            color: #1abc9c;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Add Event</h1>
    <form action="/events/add" method="post">
        <label for="name">Event Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="date">Event Date:</label>
        <input type="date" id="date" name="date" required>

        <label for="venue">Venue:</label>
        <select id="venueId" name="venueId" required>
            <%
                List<Venue> venues = (List<Venue>) request.getAttribute("venues");
                if (venues != null && !venues.isEmpty()) {
                    for (Venue venue : venues) {
            %>
                        <option value="<%= venue.getId() %>"><%= venue.getName() %></option>
            <%
                    }
                } else {
            %>
                    <option value="">No venues available</option>
            <%
                }
            %>
        </select>

        <input type="submit" value="Save">
    </form>
    
    <a href="/events">Back to Events List</a> |
    <a href="/">Home</a>
</div>

</body>
</html>
