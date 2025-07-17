<%@ page contentType="text/html; charset=UTF-8" session="true" %>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");
    int usertype = (Integer) session.getAttribute("usertype");
    if (usertype != 2) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-image: url("images/bg-books.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            min-height: 100vh;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            padding: 10px 30px;
            border-radius: 0 0 20px 20px;
            border-bottom: 3px solid #00bcd4;
        }

        .nav-center {
            display: flex;
            gap: 20px;
            margin: 0 auto;
        }

        .nav-right {
            margin-left: auto;
        }

        .navbar a {
            color: #f2f2f2;
            padding: 10px 25px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .navbar a:hover {
            background-color: #222;
            transform: scale(1.05);
        }

    .logout {
    position: absolute;
    top: 15px;
    right: 25px;
    padding: 10px 20px;
    background-color: crimson;
    color: white;
    border: none;
    border-radius: 8px;
    text-decoration: none;
    font-weight: bold;
    font-size: 16px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
    transition: background-color 0.3s ease;
}

.logout:hover {
    background-color: darkred;
}

        /* Dashboard layout */
        .dashboard-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 60px;
            gap: 40px;
            flex-wrap: nowrap;
        }

        .left-section {
            max-width: 480px;
            color: white;
            flex: 1;
        }

        .left-section h1 {
            font-size: 36px;
            margin-bottom: 10px;
        }

        .left-section p {
            font-size: 18px;
            color: yellow;
            line-height: 1.5;
        }

        .quote {
            font-size: 24px;
            margin-top: 30px;
            font-weight: bold;
        }

        .right-image {
            display: flex;
            gap: 20px;
            flex: 1;
            justify-content: flex-end;
            flex-wrap: wrap;
        }

        .right-image img {
            width: 220px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.4);
            transition: transform 0.3s ease;
        }

        .right-image img:hover {
            transform: scale(1.03);
            
        }
        

        @media (max-width: 992px) {
            .dashboard-container {
                flex-direction: column;
                align-items: center;
                padding: 40px 20px;
            }

            .right-image {
                justify-content: center;
                margin-top: 30px;
            }

            .right-image img {
                width: 80%;
                max-width: 300px;
            }

            .navbar {
                flex-direction: column;
                align-items: center;
                padding: 10px;
            }

            .nav-center, .nav-right {
                margin: 10px 0;
                justify-content: center;
            }
        }
    </style>
</head>
<body>

<!-- ✅ Navbar -->
<div class="navbar">
    <div class="nav-center">
        <a href="viewAllBooks.jsp">📖 Available Books</a>
        <a href="books.jsp">🛒 Buy Book</a>
    </div>
    <div class="nav-right">
        <a href="logout.jsp" class="logout">Logout</a>
    </div>
</div>

<!-- ✅ Dashboard Content -->
<div class="dashboard-container">
    <!-- Left Section -->
    <div class="left-section">
        <h1>Welcome, <%= username %>! 👋</h1>
        <h2>Ready to explore new chapters?</h2>
        <p>
            "One chapter a day could change your tomorrow!"<br>
            Your bookstore is live and thriving — here's your latest update!
        </p>
        <div class="quote">
            "Every book you open is a step closer to your dreams. <br>Keep reading!"
        
        </div>
    </div>

    <!-- Right Section (Images) -->
    <div class="right-image">
        <img src="images/smartbook.png" alt="Smart Learning Books 0" />
        <img src="images/smartbooks1.png" alt="Smart Learning Books 1" />
        <img src="images/smartbook2.png" alt="Smart Learning Books 2" />
        <img src="images/smartbook3.png" alt="Smart Learning Books 3" />
        <img src="images/smartbook4.png" alt="Smart Learning Books 4" />
        <img src="images/smartbook5.png" alt="Smart Learning Books 5" />

        <h1 style="color: white;">"Today’s readers are tomorrow’s leaders. Explore something new!"</h1>
   <div style="background-color: black; padding: 10px; border-radius: 5px; width: 400px; text-align: center;">
  <p style="color: white; font-size: 10px;">"Your future self will thank you for the knowledge you gain today."</p>
</div>

    </div>
    
    
</div>

</body>
</html>




