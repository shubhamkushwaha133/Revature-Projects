<!-- WEB-INF/views/authors.jsp -->
<%@ page import="java.util.List" %>
<%@ page import="com.shubhamKumar.Library.model.Author" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authors List</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <!-- CSS Styles -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #2c3e50 ;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
        }

        h2 {
            font-size: 28px;
            margin-bottom: 20px;
            text-align: center;
            color: white;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 250px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card-title {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #333;
        }

        .card-description {
            font-size: 14px;
            color: #777;
            margin-bottom: 20px;
        }

        .btn {
            background-color: #6a11cb;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #4e0b9b;
        }

        .links {
            margin-top: 20px;
            text-align: center;
        }

        .links a {
            text-decoration: none;
            color: white;
            font-size: 14px;
            margin: 0 10px;
            transition: color 0.3s ease;
        }

        .links a:hover {
            color: green;
        }

        /* Responsive */
        @media (max-width: 600px) {
            .card-container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

    <h2>List of Authors</h2>

    <div class="card-container">
        <%
            List<Author> authors = (List<Author>) request.getAttribute("authors");
            if (authors != null) {
                for (Author author : authors) {
        %>
            <div class="card">
                <div class="card-title"><%= author.getName() %></div>
                <div class="card-description">Famous Author of several books.</div>
                <a href="/library/authors/<%= author.getId() %>" class="btn">View Details</a>
            </div>
        <%
                }
            } else {
        %>
            <p>No authors available.</p>
        <%
            }
        %>
    </div>

    <div class="links">
        <a href="/library/authors/add">Add New Author</a>
        <a href="/">Home</a>
    </div>

</body>
</html>
