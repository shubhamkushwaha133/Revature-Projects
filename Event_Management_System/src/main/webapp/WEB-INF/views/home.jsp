<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Management System</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <!-- CSS Styles -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(45deg, #ff9a9e 0%, #fad0c4 100%);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .section {
            width: 100%;
            padding: 50px 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .section:nth-child(odd) {
            background-color: #782203 ;
        }

        .section:nth-child(even) {
            background-color: #320e01 ;
        }

        h1 {
            font-size: 48px;
            margin-bottom: 10px;
            color: #ffdd57;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
        }

        h2 {
            font-size: 28px;
            margin-bottom: 40px;
            color: #ffffff;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }

        a {
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            background-color: #0a22f0; /* Blue background for buttons */
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        a:hover {
            background-color: green; /* Green background on hover */
            transform: translateY(-5px);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
        }

        footer {
            background-color: #1f1f1f;
            color: #fff;
            padding: 20px;
            text-align: center;
            width: 100%;
            position: relative;
            bottom: 0;
        }

        footer p {
            margin: 0;
            font-size: 14px;
            color: #ffffff;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            h1 {
                font-size: 36px;
            }

            h2 {
                font-size: 22px;
            }

            a {
                font-size: 16px;
                padding: 12px 25px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Section 1: Title and Subtitle -->
        <div class="section">
            <h1>Shubham Kumar</h1>
            <h2>Event Management System</h2>
        </div>

        <!-- Section 2: Links -->
        <div class="section">
         <p>  <a href="/events/add">Add Event</a>
            <a href="/events">All Events</a>
            <a href="/venues">All Venues</a>
            <a href="/venues/add">Add Venues</a>
            <a href="/events/upcoming">Upcoming Events</a>
            <a href="/attendees/add">Add Attendee</a> </p>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2024 Event Management System. All Rights Reserved. Shubham Kumar</p>
    </footer>

</body>
</html>
