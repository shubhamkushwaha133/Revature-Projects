<%@ page import="java.util.List" %>
<%@ page import="com.revature.shubhamKumar.model.Venue" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Venues</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- CSS Styles -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7f6;
        }

        .container {
            max-width: 800px;
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

        .action-links a {
            margin-right: 10px;
        }

        .add-venue {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .add-venue:hover {
            background-color: #1abc9c;
            color:white;
        }

        .back-link {
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
            color: #34495e;
        }

        .back-link:hover {
            color: #2980b9;
        }

        footer {
            text-align: center;
            margin-top: 40px;
            color: #7f8c8d;
        }
    </style>

    <!-- JavaScript Confirmation -->
    <script>
        function confirmDelete(venueId) {
            const confirmation = confirm('Are you sure you want to delete this venue?');
            if (confirmation) {
                window.location.href = '/venues/delete/' + venueId;
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h1>Venues</h1>

    <a class="add-venue" href="/venues/add">Add New Venue</a>
    <br/><br/>

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Location</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Venue> venues = (List<Venue>) request.getAttribute("venues");
                if (venues != null && !venues.isEmpty()) {
                    for (Venue venue : venues) {
            %>
                        <tr>
                            <td><%= venue.getName() %></td>
                            <td><%= venue.getLocation() %></td>
                            <td class="action-links">
                                <a href="javascript:void(0);" onclick="confirmDelete('<%= venue.getId() %>')">Delete</a>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="3">No venues available</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a class="back-link" href="/events">Back to Events</a> 
    <a class="back-link" href="/">Home</a>
</div>

</body>
</html>
