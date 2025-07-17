package com.bookstore.servlets;

import com.bookstore.util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class AddBookServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String barcode = req.getParameter("barcode");
        String name = req.getParameter("name");
        String author = req.getParameter("author");
        int price = Integer.parseInt(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO books (barcode, name, author, price, quantity) VALUES (?, ?, ?, ?, ?)"
            );

            ps.setString(1, barcode);
            ps.setString(2, name);
            ps.setString(3, author);
            ps.setInt(4, price);
            ps.setInt(5, quantity);

            int result = ps.executeUpdate();

            if (result > 0) {
                res.sendRedirect("admin.jsp");
            } else {
                res.sendRedirect("addBook.jsp?error=Failed+to+add+book");
            }

        } catch (Exception e) {
            throw new ServletException("Error adding book", e);
        }
    }
}
