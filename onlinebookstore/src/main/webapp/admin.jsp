<%@ page contentType="text/html; charset=UTF-8" %>
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
    <title>Admin Panel</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url("images/bg-books.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            min-height: 100vh;
            color: white;
        }

        /* ✅ Navbar style similar to dashboard.jsp */
        .navbar {
            width: 100%;
            background-color: #333333;
            padding: 10px 30px;
            margin: 0;
            border-radius: 0 0 20px 20px;
            border-bottom: 3px solid #00bcd4;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .nav-left {
            display: flex;
            gap: 25px;
            flex-wrap: wrap;
        }

        .nav-left a {
            color: #f2f2f2;
            text-decoration: none;
            padding: 12px 25px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.3s ease;
            border-radius: 5px;
        }

        .nav-left a:hover {
            background-color: #222;
            transform: scale(1.05);
        }

        .logout {
            background-color: crimson;
            color: white;
            padding: 12px 25px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .logout:hover {
            background-color: darkred;
        }

        /* Welcome Section */
        .admin-header {
    text-align: center;
    margin-top: 150px;
    padding: 20px;
}

.admin-header h1 {
    font-size: 48px;
    color: #ffffff;
    text-shadow: 3px 3px 6px rgba(0, 0, 0, 0.7);
    margin-bottom: 20px;
}

.admin-header p {
    font-size: 20px;
    color: rgba(255, 255, 255, 0.9);
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.6);
    margin: 10px 0;
}


        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px 20px;
            }

            .nav-left {
                flex-direction: column;
                gap: 15px;
                margin-bottom: 10px;
            }

            .logout {
                align-self: flex-end;
            }
        }
    </style>
</head>
<body>

<!-- ✅ Navigation Bar -->
<div class="navbar">
    <div class="nav-left">
        <a href="welcome.jsp">🏠 Home</a>
        <a href="addBook.jsp">📚 Add Book</a>
        <a href="removeBook.jsp">❌ Remove Book</a>
        <a href="viewAllBooks.jsp">📖 Available Books</a>
    </div>
    <a href="logout.jsp" class="logout">Logout</a>
</div>

<!-- ✅ Admin Header Section -->
<div class="admin-header">
    <h1>Welcome Admin !!! 👋</h1>
    <p>"Knowledge flows faster when systems run smarter — thanks to you!"</p>
    <p>"Order by order, update by update — you're making learning happen."</p>
</div>

</body>
</html>



