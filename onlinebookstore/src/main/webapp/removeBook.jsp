<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String isAdmin = (String) session.getAttribute("admin");
    if (isAdmin == null || !"true".equals(isAdmin)) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Remove Book</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f2f2f2;
            padding: 40px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 20px;
        }

        input[type="text"], select {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #b52a37;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📕 Remove Book</h2>

        <form action="removeBook" method="post">
            <label for="criteria">Remove By:</label>
            <select name="criteria" id="criteria" required>
                <option value="barcode">Barcode</option>
                <option value="name">Book Name</option>
                <option value="author">Author</option>
            </select>

            <label for="value">Enter Value:</label>
            <input type="text" name="value" id="value" placeholder="Enter barcode or name or author..." required>

            <input type="submit" value="Remove Book">
        </form>
    </div>
</body>
</html>
