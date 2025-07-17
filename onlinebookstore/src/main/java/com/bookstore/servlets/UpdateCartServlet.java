package com.bookstore.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class UpdateCartServlet extends HttpServlet {

    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action"); // "decrease", "remove"
        String barcode = request.getParameter("barcode");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        if (cart == null || !cart.containsKey(barcode)) {
            response.sendRedirect("cart.jsp");
            return;
        }

        if ("decrease".equals(action)) {
            int qty = cart.get(barcode);
            if (qty <= 1) {
                cart.remove(barcode); // remove book if 1
            } else {
                cart.put(barcode, qty - 1); // decrease by 1
            }
        } else if ("remove".equals(action)) {
            cart.remove(barcode);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}
