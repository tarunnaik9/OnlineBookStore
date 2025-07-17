<%@ page import="com.bookstore.services.BookService, com.bookstore.models.Book, java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" session="true" %>
<%
    // ✅ Allow access if admin OR user is logged in
    boolean isAdmin = session != null && "true".equals(session.getAttribute("admin"));
    boolean isUser = session != null && session.getAttribute("username") != null;

    if (!isAdmin && !isUser) {
        response.sendRedirect("login.jsp"); // or "adminLogin.jsp" if needed
        return;
    }

    List<Book> books = BookService.getAllBooks();
    String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Books</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f4f4f4;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            background-color: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

    <h2>
        <%= isAdmin ? "📚 Admin View: All Books" : "📚 Welcome, " + username + " - Browse Books" %>
    </h2>

    <table>
        <tr>
            <th>Barcode</th>
            <th>Name</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
        </tr>
        <% for (Book book : books) { %>
        <tr>
            <td><%= book.getBarcode() %></td>
            <td><%= book.getName() %></td>
            <td><%= book.getAuthor() %></td>
            <td>$<%= book.getPrice() %></td>
            <td><%= book.getQuantity() %></td>
        </tr>
        <% } %>
    </table>

</body>
</html>

