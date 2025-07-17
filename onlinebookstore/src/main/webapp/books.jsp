<%@ page import="com.bookstore.services.BookService, com.bookstore.models.Book, java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) response.sendRedirect("login.jsp");

    List<Book> books = BookService.getAllBooks();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Books</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: url('images/bgs.jpg') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            text-shadow: 2px 2px 5px #000;
        }

        .welcome {
            color: #00f0ff;
        }

        .available {
            color: #ffcc00;
            font-weight: bold;
        }

        .book-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px;
        }

        .book-card {
            background: rgba(255, 255, 255, 0.95); /* semi-transparent white */
            color: #000;
            width: 260px;
            margin: 15px;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.5);
            text-align: center;
        }

        .book-card img {
            width: 100%;
            height: 150px;
            object-fit: contain;
        }

        .book-title {
            font-weight: bold;
            color: #198754;
            margin-top: 10px;
        }

        .book-author {
            font-style: italic;
            color: #0033cc;
        }

        .book-price {
            font-weight: bold;
            color: #ff6600;
        }

        .stock {
            color: #cc0000;
            font-size: 13px;
        }

        .cart-btn {
            background: #007bff;
            color: #fff;
            padding: 8px 12px;
            border: none;
            border-radius: 6px;
            margin-top: 10px;
            cursor: pointer;
            font-weight: bold;
        }

        .cart-btn:hover {
            background-color: #0056b3;
        }

      .logout {
    position: fixed; /* ⬅️ Fixed instead of absolute */
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
    z-index: 999; /* ✅ Always stay on top */
    box-shadow: 0 4px 10px rgba(0,0,0,0.3);
    transition: background-color 0.3s ease;
}

.logout:hover {
    background-color: darkred;
}

        }
    </style>
</head>
<body>

    <a href="logout.jsp" class="logout">Logout</a>

    <h2 class="welcome">Welcome, <%= username %>!</h2>
    <h2 class="available">📚 Available Books</h2>

    <div class="book-container">
        <% for (Book book : books) { %>
        <div class="book-card">
            <img src="images/bookcovers.png" alt="Book Image"/>
            <div class="book-title"><%= book.getName() %></div>
            <div class="book-author">Author: <%= book.getAuthor() %></div>
            <p>Id: <%= book.getBarcode() %></p>
            <p class="book-price">Price: $ <%= book.getPrice() %></p>
            <p class="stock">Only <%= book.getQuantity() %> items left</p>
            <form action="addToCart" method="post">
                <input type="hidden" name="barcode" value="<%= book.getBarcode() %>">
                <input type="submit" value="Add to Cart" class="cart-btn">
            </form>
        </div>
        <% } %>
    </div>

</body>
</html>

