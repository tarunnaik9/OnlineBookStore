package com.bookstore.servlets;

import com.bookstore.models.Book;
import com.bookstore.services.BookService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class BookListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Book> books = BookService.getAllBooks();
        req.setAttribute("bookList", books);
        RequestDispatcher dispatcher = req.getRequestDispatcher("books.jsp");
        dispatcher.forward(req, res);
    }
}
