<%@ page import="com.shubhamKumar.Library.model.Book" %>
<%@ page import="com.shubhamKumar.Library.model.Author" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books</title>
    
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
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            margin-top: 30px;
            font-size: 28px;
            color: #333;
        }

        table {
            width: 80%;
            margin: 20px 0;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #34495e;
            color: #fff;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td a {
            color: #3498db;
            text-decoration: none;
            margin-right: 10px;
        }

        td a:hover {
            color: #2980b9;
        }

        td button {
            background-color: #e74c3c;
            color: #fff;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        td button:hover {
            background-color: #c0392b;
        }

        .actions form {
            display: inline-block;
        }

        .add-btn, .home-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: blue;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .add-btn:hover, .home-btn:hover {
            background-color: green;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 95%;
            }

            th, td {
                padding: 10px;
            }

            .add-btn, .home-btn {
                padding: 8px 15px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <h2>Book List</h2>

    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>ISBN</th>
                <th>Author</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Book> books = (List<Book>) request.getAttribute("books");
                if (books != null) {
                    for (Book book : books) {
            %>
                        <tr>
                            <td><%= book.getTitle() %></td>
                            <td><%= book.getIsbn() %></td>
                            <td>
                                <%
                                    Author author = book.getAuthor();
                                    if (author != null) {
                                        out.print(author.getName());
                                    } else {
                                        out.print("No Author");
                                    }
                                %>
                            </td>
                            <td class="actions">
                                <!-- Edit button -->
                                <a href="<%= request.getContextPath() %>/library/books/edit/<%= book.getId() %>">Edit</a>
                                
                                <!-- Delete button with confirmation -->
                                <form action="<%= request.getContextPath() %>/library/books/delete/<%= book.getId() %>" method="post" style="display:inline;">
                                    <button type="submit" onclick="return confirm('Are you sure you want to delete this book?');">Delete</button>
                                </form>

                                <!-- Borrow button, only if the book is not already borrowed -->
                                <%
                                    if (!book.isBorrowed()) {
                                %>
                                    <form action="<%= request.getContextPath() %>/library/borrow" method="post" style="display:inline;">
                                        <input type="hidden" name="bookId" value="<%= book.getId() %>" />
                                        <input type="hidden" name="borrowerId" value="1" /> <!-- Assuming borrowerId is 1 for now -->
                                        <button type="submit">Borrow</button>
                                    </form>
                                <%
                                    } else {
                                        out.print("Already Borrowed");
                                    }
                                %>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="4">No books available</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
<p>
    <a href="${pageContext.request.contextPath}/library/books/add" class="add-btn">Add New Book</a>
    <a href="/" class="home-btn">Home</a>
    <a href="/library/borrowedBooks" class="home-btn">Borrowed Books</a>
</p>
</body>
</html>
