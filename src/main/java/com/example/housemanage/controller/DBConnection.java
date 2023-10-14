package com.example.housemanage.controller;

import java.sql.*;

public class DBConnection {
    private static Connection connection;
    private static ResultSet resultSet;
    private static Statement statement;

    // Đảm bảo rằng chỉ có một phiên bản duy nhất của kết nối
    private DBConnection() {}

    public static Connection getConnection() {
        if (connection == null) {
            try {
                // Tạo kết nối cơ sở dữ liệu ở đây
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/homeforrent";
                connection = DriverManager.getConnection(url, "root", "jungkookdethuong22012003");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
}
