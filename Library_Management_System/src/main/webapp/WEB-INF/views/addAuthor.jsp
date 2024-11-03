<!-- WEB-INF/views/addAuthor.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Author</title>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    
    <!-- CSS Styles -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #2c3e50 ;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            font-weight: 600;
            margin-bottom: 20px;
            color: #ffffff;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 10px;
            font-weight: 500;
            color: #fff;
        }

        input[type="text"] {
            padding: 12px;
            border-radius: 8px;
            border: none;
            margin-bottom: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            color: #333;
            font-size: 16px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        input[type="text"]:focus {
            background-color: #f3f3f3;
            outline: none;
        }

        button {
            background-color: #ff4b2b;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        button:hover {
            background-color: #ff3a1a;
            transform: translateY(-3px);
        }

        a {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #ffdd57;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #ffe57a;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h2>Add a New Author</h2>

        <form action="/library/authors/add" method="post">
            <label for="name">Author Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter author's name" required />

            <button type="submit">Add Author</button>
        </form>

        <a href="/library/authors">View All Authors</a>
    </div>

</body>
</html>
