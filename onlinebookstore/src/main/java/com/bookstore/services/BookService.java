package com.bookstore.services;

import com.bookstore.models.Book;
import com.bookstore.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookService {

    public static List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM books")) {

            while (rs.next()) {
                Book b = new Book();
                b.setBarcode(rs.getString("barcode"));
                b.setName(rs.getString("name"));
                b.setAuthor(rs.getString("author"));
                b.setPrice(rs.getInt("price"));
                b.setQuantity(rs.getInt("quantity"));

                books.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return books;
    }
}

