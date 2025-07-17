package com.bookstore.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false); // Get current session if exists
        if (session != null) {
            session.invalidate(); // End the session
        }
        res.sendRedirect("login.jsp"); // Redirect to login page
    }
}
