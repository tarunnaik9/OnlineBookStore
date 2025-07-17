<%@ page import="com.bookstore.models.Book, com.bookstore.services.BookService, java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
    boolean isEmpty = (cart == null || cart.isEmpty());

    List<Book> allBooks = BookService.getAllBooks();
    Map<String, Book> bookMap = new HashMap<>();
    for (Book b : allBooks) {
        bookMap.put(b.getBarcode(), b);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: url('images/bg-books.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 30px;
            color: #333;
        }

        .cart-container {
            max-width: 900px;
            margin: 0 auto;
            background-color: rgba(255,255,255,0.95);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0,0,0,0.3);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #999;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #333;
            color: white;
        }

        h2 {
            text-align: center;
            font-size: 28px;
            color: #222;
        }

        .total {
            font-weight: bold;
            background-color: gold;
        }

        .actions form {
            display: inline;
        }

        button {
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            background-color: #444;
            color: white;
            cursor: pointer;
        }

        a.back {
            display: block;
            margin-top: 25px;
            text-align: center;
            font-size: 16px;
            color: navy;
            text-decoration: none;
        }

        /* Add space between total and order button */
        tr.total + tr td {
            padding-top: 20px;
        }
    </style>
</head>
<body>
<div class="cart-container">
    <h2>🛒 Your Cart</h2>

    <% if (isEmpty) { %>
        <h3 style="text-align:center;">Your cart is empty.</h3>
    <% } else { %>
        <table>
            <tr>
                <th>Book Name</th>
                <th>Author</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            <%
                int grandTotal = 0;
                for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                    String barcode = entry.getKey();
                    int quantity = entry.getValue();
                    Book book = bookMap.get(barcode);
                    if (book != null) {
                        int total = book.getPrice() * quantity;
                        grandTotal += total;
            %>
            <tr>
                <td><%= book.getName() %></td>
                <td><%= book.getAuthor() %></td>
                <td>₹ <%= book.getPrice() %></td>
                <td class="actions">
                    <form action="updateCart" method="get">
                        <input type="hidden" name="action" value="decrease"/>
                        <input type="hidden" name="barcode" value="<%= book.getBarcode() %>"/>
                        <button type="submit">−</button>
                    </form>

                    <strong><%= quantity %></strong>

                    <form action="addToCart" method="post">
                        <input type="hidden" name="barcode" value="<%= book.getBarcode() %>"/>
                        <button type="submit">+</button>
                    </form>
                </td>
                <td>₹ <%= total %></td>
            </tr>
            <% } } %>
            <tr class="total">
                <td colspan="4">Grand Total</td>
                <td>₹ <%= grandTotal %></td>
            </tr>

            <!-- Redirect to checkout.jsp on form submit -->
            <tr>
                <td colspan="5" style="text-align: center;">
                    <form action="checkout.jsp" method="post">
                        <button type="submit" style="padding: 12px 35px; font-size: 17px; background-color: yellow; color: black; border: none; border-radius: 6px;">
                            🧾 Proceed to Checkout
                        </button>
                    </form>
                </td>
            </tr>
        </table>
    <% } %>

    <a href="books.jsp" class="back">⬅ Back to Books</a>
</div>
</body>
</html>

