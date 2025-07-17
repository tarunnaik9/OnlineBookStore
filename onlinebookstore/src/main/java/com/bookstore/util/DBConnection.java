package com.bookstore.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/onlinebookstore";
    private static final String USER = "root";
    private static final String PASSWORD = "12345678"; // ✅ your actual password

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
