<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        h1 {
            font-size: 3rem;
            color: #fff;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            animation: fadeInDown 1.5s ease;
        }

        .button-container {
            display: flex;
            gap: 20px;
            margin-top: 20px;
            justify-content: center;
        }

        button {
            padding: 15px 30px;
            font-size: 1.2rem;
            color: #fff;
            background-color: #ff5f6d;
            border: none;
            border-radius: 25px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            background-color: #ffc371;
            transform: translateY(-5px);
            box-shadow: 0 15px 20px rgba(0, 0, 0, 0.2);
        }

        button:active {
            transform: translateY(0);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }

        /* Keyframe Animation */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-30px);
            }
            60% {
                transform: translateY(-15px);
            }
        }
    </style>
</head>
<body>
    <div>
        <h1>Welcome to Shubham Kumar Website</h1>
        <div class="button-container">
            <form action="/employee/login" method="get">
                <button type="submit" id="loginBtn">Login</button>
            </form>
            <form action="/employee/register" method="get">
                <button type="submit" id="registerBtn">Register</button>
            </form>
        </div>
    </div>

    <script>
        // Adding JavaScript for button animations
        document.getElementById("loginBtn").addEventListener("mouseover", function() {
            this.style.animation = "bounce 1s";
        });

        document.getElementById("registerBtn").addEventListener("mouseover", function() {
            this.style.animation = "bounce 1s";
        });
    </script>
</body>
</html>
