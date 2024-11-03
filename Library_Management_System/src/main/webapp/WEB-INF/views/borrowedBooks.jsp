<%@ page import="com.shubhamKumar.Library.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrowed Books</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <!-- CSS Styles -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            color: #2c3e50;
        }

        h2 {
            margin-top: 30px;
            font-size: 36px;
            color: #2c3e50;
        }

        table {
            width: 90%;
            margin: 20px 0;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: #fff;
            font-weight: 600;
            font-size: 18px;
        }

        td {
            font-size: 16px;
            color: #34495e;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td a {
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
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
            font-size: 14px;
        }

        td button:hover {
            background-color: #c0392b;
        }

        .actions form {
            display: inline-block;
        }

        .home-btn {
            margin-top: 20px;
            padding: 12px 24px;
            background-color: #2ecc71;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .home-btn:hover {
            background-color: #27ae60;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                padding: 10px;
            }

            .home-btn {
                padding: 10px 20px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

    <h2>Borrowed Books</h2>

    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Borrow Date</th>
                <th>Due Date</th>
                <th>Charges</th>
                <th>Fine</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Book> borrowedBooks = (List<Book>) request.getAttribute("borrowedBooks");
                if (borrowedBooks != null) {
                    for (Book book : borrowedBooks) {
                        Date borrowDate = book.getBorrowDate();
                        Date dueDate = book.getDueDate();
                        long daysBorrowed = borrowDate != null ? (new Date().getTime() - borrowDate.getTime()) / (1000 * 60 * 60 * 24) : 0;
                        long extraDays = daysBorrowed > 10 ? daysBorrowed - 10 : 0;
                        int fine = extraDays > 0 ? (int) (extraDays / 10) * 100 : 0;
                        int charge = (int) daysBorrowed * 30 + 100; // initial fee 100
            %>
                        <tr>
                            <td><%= book.getTitle() %></td>
                            <td><%= borrowDate != null ? borrowDate : "Not Borrowed" %></td>
                            <td><%= dueDate != null ? dueDate : "Not Borrowed" %></td>
                            <td><%= borrowDate != null ? charge : "N/A" %> Rs</td>
                            <td><%= borrowDate != null ? fine : "N/A" %> Rs</td>
                            <td class="actions">
                                <form action="<%= request.getContextPath() %>/library/return" method="post">
                                    <input type="hidden" name="bookId" value="<%= book.getId() %>" />
                                    <button type="submit" onclick="return confirm('Are you sure you want to return this book?');">Return</button>
                                </form>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="6">No borrowed books available</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="/library/books" class="home-btn">Books Page</a>

</body>
</html>
