<%@ page import="java.util.List" %>
<%@ page import="com.revature.shubhamKumar.model.Event" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Events</title>
    
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
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 36px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            font-size: 16px;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #dcdde1;
        }

        a {
            text-decoration: none;
            color: #2980b9;
            font-weight: bold;
            margin-right: 10px;
        }

        a:hover {
            color: #1abc9c;
        }

        .add-event-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .add-event-btn:hover {
            background-color: #1abc9c;
            color:white;
        }

        .home-link {
            margin-top: 10px;
            display: inline-block;
            text-decoration: none;
            color: #34495e;
        }

        .home-link:hover {
            color: #2980b9;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Events</h1>

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Date</th>
                <th>Venue</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Event> eventList = (List<Event>) request.getAttribute("events");
                if (eventList != null) {
                    for (Event event : eventList) {
            %>
                        <tr>
                            <td><%= event.getName() %></td>
                            <td>
                                <%
                                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                                    String formattedDate = sdf.format(event.getDate());
                                    out.print(formattedDate);
                                %>
                            </td>
                            <td>
                                <%= event.getVenue() != null ? event.getVenue().getName() : "No venue assigned" %>
                            </td>
                            <td>
                                <a href="/events/edit/<%= event.getId() %>">Edit</a> |
                                <a href="/events/delete/<%= event.getId() %>" onclick="return confirm('Are you sure you want to delete this event?')">Delete</a> |
                                <a href="/events/details/<%= event.getId() %>">View Attendees</a> |
                                <a href="/attendees/add">Add Attendees</a>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="4">No events available</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a class="add-event-btn" href="/events/add">Add Event</a>
    <br/>
    <a class="home-link" href="/">Home</a>
</div>

</body>
</html>
