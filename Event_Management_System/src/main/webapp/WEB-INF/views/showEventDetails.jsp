<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.revature.shubhamKumar.model.Attendee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Event Details</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 30px;
        }

        h1, h2, h3 {
            color: #2c3e50;
            text-align: center;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 28px;
            margin-bottom: 15px;
        }

        p {
            font-size: 18px;
            color: #34495e;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 16px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #2980b9;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #dcdde1;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #1abc9c;
        }

        .actions a {
            background-color: #e74c3c;
        }

        .actions a:hover {
            background-color: #c0392b;
        }

        .back-btn {
            background-color: #3498db;
            margin-top: 20px;
        }

        .back-btn:hover {
            background-color: #2980b9;
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: #34495e;
            color: white;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>

    <!-- JavaScript Confirmation for Deletion -->
    <script>
        function confirmDelete(attendeeId, eventId) {
            const confirmation = confirm('Are you sure you want to delete this attendee?');
            if (confirmation) {
                window.location.href = `/attendees/delete/${attendeeId}?eventId=${eventId}`;
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h1>Event Details</h1>

    <!-- Access the event object from the request attributes -->
    <h2><%= request.getAttribute("event") != null ? ((com.revature.shubhamKumar.model.Event) request.getAttribute("event")).getName() : "No event found" %></h2>

    <!-- Format the date to remove the time part -->
    <p>Date: 
        <%
            if (request.getAttribute("event") != null) {
                com.revature.shubhamKumar.model.Event event = (com.revature.shubhamKumar.model.Event) request.getAttribute("event");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String formattedDate = sdf.format(event.getDate());
                out.print(formattedDate);
            } else {
                out.print("No date available");
            }
        %>
    </p>

    <p>Venue: 
        <%= request.getAttribute("event") != null && ((com.revature.shubhamKumar.model.Event) request.getAttribute("event")).getVenue() != null 
            ? ((com.revature.shubhamKumar.model.Event) request.getAttribute("event")).getVenue().getName() 
            : "No venue assigned" %>
    </p>

    <h3>Attendees</h3>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Retrieve the event object from the request
                com.revature.shubhamKumar.model.Event event = (com.revature.shubhamKumar.model.Event) request.getAttribute("event");

                // Check if the event and attendees exist
                if (event != null && event.getAttendees() != null && !event.getAttendees().isEmpty()) {
                    // Loop through the list of attendees and display them
                    for (Attendee attendee : event.getAttendees()) {
            %>
                        <tr>
                            <td><%= attendee.getName() %></td>
                            <td><%= attendee.getEmail() %></td>
                            <td class="actions">
                                <a href="javascript:void(0);" onclick="confirmDelete('<%= attendee.getId() %>', '<%= event.getId() %>')">Delete</a>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="3">No attendees available for this event.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a class="back-btn" href="/events">Back to Event List</a> 
    <a href="/attendees/add">Add Attendee</a> 
    <a href="/">Home</a>
</div>

</body>
</html>
