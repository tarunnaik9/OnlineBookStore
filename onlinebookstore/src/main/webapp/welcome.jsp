<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to Online Book Store</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url("images/bgs.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            font-family: 'Georgia', serif;
            color: white;
            text-align: center;
            height: 100vh;
        }

        .navbar {
            background-color: #222;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 30px;
            padding: 12px 0;
            flex-wrap: wrap;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            font-size: 17px;
            padding: 10px 20px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
            border-radius: 5px;
        }

        h1 {
            font-size: 48px;
            margin-top: 100px;
            text-shadow: 2px 2px 5px #000;
        }
           h2 {
            font-size: 35px;
            margin-top: 100px;
            text-shadow: 2px 2px 5px #000;
            color: yellow;
        }
    </style>
</head>
<body>

<!-- ✅ Navbar -->
<div class="navbar">
    <a href="welcome.jsp">Home</a>
    <a href="login.jsp">Login User</a>
    <a href="register.jsp">New User? Register</a>
    <a href="admin.jsp">Login as Admin</a>
    <a href="https://flowcv.me/tarunnaik">About Us</a>
</div>

<!-- ✅ Welcome Message -->
<h1>Welcome to Online Book Store</h1>
<h2>📚 “Every story you open adds another layer to your own.”<br>

🛍️ “Buy a book. Borrow a universe.”<br>

📚 “Where words live, imagination thrives.”</h2>

</body>
</html>

