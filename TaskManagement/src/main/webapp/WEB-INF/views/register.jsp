<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style.css'/>">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        form div {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[readonly] {
            background-color: #e9ecef;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #218838;
        }
        p {
            text-align: center;
            margin-top: 20px;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <form action="/register" method="POST">
        <h2>Register</h2>
        
        <div>
            <label>Username:</label>
            <input type="text" name="username" required/>
        </div>
        
        <div>
            <label>Password:</label>
            <input type="password" name="password" required/>
        </div>
        
        <div>
            <label>Roles:</label>
            <input type="text" name="roles" value="ROLE_USER" readonly/>
        </div>
        
        <div>
            <button type="submit">Register</button>
        </div>

        <p>Already have an account? <a href="/login">Login here</a></p>
    </form>

</body>
</html>
