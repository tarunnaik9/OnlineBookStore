package com.bookstore.servlets;

import com.bookstore.util.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RemoveBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String criteria = request.getParameter("criteria");
        String value = request.getParameter("value");

        String sql = null;
        switch (criteria) {
            case "barcode":
                sql = "DELETE FROM books WHERE barcode = ?";
                break;
            case "name":
                sql = "DELETE FROM books WHERE name = ?";
                break;
            case "author":
                sql = "DELETE FROM books WHERE author = ?";
                break;
            default:
                response.sendRedirect("removeBook.jsp?error=Invalid+criteria");
                return;
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, value);
            int rowsDeleted = stmt.executeUpdate();

            if (rowsDeleted > 0) {
                response.sendRedirect("removeBook.jsp?success=Book+removed+successfully");
            } else {
                response.sendRedirect("removeBook.jsp?error=No+matching+book+found");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("removeBook.jsp?error=Server+error");
        }
    }
}

