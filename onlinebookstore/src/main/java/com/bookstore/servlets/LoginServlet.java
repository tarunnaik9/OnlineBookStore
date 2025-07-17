package com.bookstore.servlets;

import com.bookstore.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT usertype FROM users WHERE username=? AND password=?"
            );
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int type = rs.getInt("usertype");

                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                session.setAttribute("usertype", type); // ✅ Add this line

                if (type == 1)
                    res.sendRedirect("admin.jsp");
                else
                    res.sendRedirect("dashboard.jsp"); // ✅ updated for user dashboard
            } else {
                res.sendRedirect("login.jsp?error=invalid");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
