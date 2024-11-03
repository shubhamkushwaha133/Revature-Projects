<%@ page import="com.shubhamKumar.Library.model.Book" %>
<%@ page import="com.shubhamKumar.Library.model.Author" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Book</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- CSS Styles -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px ;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
             border: 2px ; 
        }

        h2 {
            margin-bottom: 20px;
            font-size: 28px;
            color: #333;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            color: #333;
        }

        input[type="text"], select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        input[type="text"]:focus, select:focus {
            border-color: #3498db;
            outline: none;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #2ecc71;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #27ae60;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-align: center;
            text-decoration: none;
            color: #3498db;
            font-size: 14px;
        }

        a:hover {
            color: #2980b9;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .form-container {
                padding: 20px;
            }

            h2 {
                font-size: 24px;
            }

            label {
                font-size: 14px;
            }

            input[type="text"], select, button {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Add New Book</h2>
        <form action="/library/books/add" method="post">
            <label for="title">Book Title:</label>
            <input type="text" id="title" name="title" required />

            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" required />

            <label for="author">Author:</label>
            <select id="author" name="authorId" required>
                <%
                    List<Author> authors = (List<Author>) request.getAttribute("authors");
                    if (authors != null) {
                        for (Author author : authors) {
                %>
                            <option value="<%= author.getId() %>"><%= author.getName() %></option>
                <%
                        }
                    } else {
                %>
                        <option value="">No authors available</option>
                <%
                    }
                %>
            </select>

            <button type="submit">Add Book</button>
        </form>

        <a href="${pageContext.request.contextPath}/library/books">Back to Book List</a>
    </div>

</body>
</html>
