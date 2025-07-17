package com.bookstore.servlets;

import com.bookstore.util.DBConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String address = req.getParameter("address");
        String phone = req.getParameter("phone");
        String mailid = req.getParameter("mailid");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users (username, password, firstname, lastname, address, phone, mailid, usertype) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
            );

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, firstname);
            ps.setString(4, lastname);
            ps.setString(5, address);
            ps.setString(6, phone);
            ps.setString(7, mailid);
            ps.setInt(8, 2); // 2 = normal user

            int result = ps.executeUpdate();

            if (result > 0) {
                res.sendRedirect("login.jsp");
            } else {
                res.sendRedirect("register.jsp?error=Registration+Failed");
            }

        } catch (Exception e) {
            throw new ServletException("Registration failed", e);
        }
    }
}
