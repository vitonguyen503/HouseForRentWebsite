package h503.roomforrent.controller;

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
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/roomforrent";
                connection = DriverManager.getConnection(url, "root", "lizismee");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
}
