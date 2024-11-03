<%@ page import="java.util.List" %>
<%@ page import="com.revature.shubhamKumar.model.Event" %>
<%@ page import="com.revature.shubhamKumar.model.Venue" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Upcoming Events</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6;
        }

        .container {
            max-width: 1000px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
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
            padding: 15px;
            text-align: center;
            font-size: 16px;
        }

        th {
            background-color: #2980b9;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        a {
            text-decoration: none;
            color: #2980b9;
            font-weight: bold;
        }

        a:hover {
            color: #1abc9c;
        }

        .action-links a {
            margin-right: 10px;
        }

        .add-event {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .add-event:hover {
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

    <!-- JavaScript Confirmation -->
    <script>
        function confirmDelete(eventId) {
            const confirmation = confirm('Are you sure you want to delete this event?');
            if (confirmation) {
                window.location.href = `/events/delete/${eventId}`;
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h1>Upcoming Events</h1>
    
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Date</th>
                <th>Venue</th>
               <!--  <th>Description</th> -->
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Event> events = (List<Event>) request.getAttribute("events");
                if (events != null && !events.isEmpty()) {
                    for (Event event : events) {
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
                <%-- <td><%= event.getDescription() %></td> --%>
                <td class="action-links">
                    <a href="/events/edit/<%= event.getId() %>">Edit</a>
                    <%-- <a href="javascript:void(0);" onclick="confirmDelete('<%= event.getId() %>')">Delete</a> --%>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5">No upcoming events found</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a class="add-event" href="/events/add">Add New Event</a>
    <br/>
    <a class="home-link" href="/">Home</a>
</div>

</body>
</html>
