<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.revature.shubhamKumar.model.Event" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add Attendee</title>
    
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
        input[type="email"],
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
    <h1>Add Attendee to Event</h1>
    
    <form action="/attendees/add" method="post">
        <label for="name">Attendee Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Attendee Email:</label>
        <input type="email" id="email" name="email" required>

        <!-- Event Selection Dropdown -->
        <label for="eventId">Event:</label>
        <select id="eventId" name="eventId" required>
            <%
                List<Event> events = (List<Event>) request.getAttribute("events");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                
                if (events != null && !events.isEmpty()) {
                    for (Event event : events) {
                        String formattedDate = sdf.format(event.getDate()); // Format the date to remove the time
            %>
                        <option value="<%= event.getId() %>"><%= event.getName() %> - <%= formattedDate %></option>
            <%
                    }
                } else {
            %>
                    <option value="">No events available</option>
            <%
                }
            %>
        </select>

        <input type="submit" value="Add Attendee">
    </form>

    <a href="/events">Back to Event List</a>
</div>

</body>
</html>
