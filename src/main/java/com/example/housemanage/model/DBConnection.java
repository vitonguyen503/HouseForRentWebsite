package com.example.housemanage.model;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;
import java.util.Base64;
import java.util.List;

@WebServlet(name = "test", value = "/test")
public class DBConnection extends HttpServlet {
    private Connection connection = null;
    private Statement statement = null;
    private ResultSet resultSet = null;
    @Override
    public void init() throws ServletException {
        super.init();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            String url = getServletContext().getInitParameter("databaseURL");
            String user = getServletContext().getInitParameter("user");
            String pass = getServletContext().getInitParameter("password");
            connection = DriverManager.getConnection(url, user, pass);
            statement = connection.createStatement();
            System.out.println("OK! 123456789");
        } catch (Exception ex){
            ex.printStackTrace();
        }

//        byte[] imageData = null;
//        File imageFile = new File("C:\\Users\\My MSI\\IdeaProjects\\RoomForRent\\src\\main\\webapp\\img\\anh2.jpg");
//        try (FileInputStream fis = new FileInputStream(imageFile)) {
//            imageData = new byte[(int) imageFile.length()];
//            fis.read(imageData);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        // Insert the image data into the User table using a PreparedStatement
//        String insertSQL = "INSERT INTO User (username, password, name, email, number, avatar) VALUES (?, ?, ?, ?, ?, ?)";
//        try (
//                PreparedStatement preparedStatement = connection.prepareStatement(insertSQL)) {
//            preparedStatement.setString(1, "user1");
//            preparedStatement.setString(2, "password1");
//            preparedStatement.setString(3, "John Doe");
//            preparedStatement.setString(4, "john@example.com");
//            preparedStatement.setString(5, "1234567890");
//            preparedStatement.setBytes(6, imageData); // Insert image data as a LONGBLOB
//
//            preparedStatement.executeUpdate();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int userId = Integer.parseInt(request.getParameter("userID")); // Retrieve the user's ID from the request
//
//        try {
//            String sql = "SELECT avatar FROM User WHERE ID = ?";
//            PreparedStatement preparedStatement = connection.prepareStatement(sql);
//            preparedStatement.setInt(1, userId);
//
//            ResultSet resultSet = preparedStatement.executeQuery();
//            if (resultSet.next()) {
//                byte[] imageData = resultSet.getBytes("avatar");
//
//                // Set response content type to image/jpeg or image/png based on your data
//                response.setContentType("image/jpeg");
//                // Or response.setContentType("image/png");
//
//                // Write image data to the response stream
//                OutputStream out = response.getOutputStream();
//                out.write(imageData);
//                out.close();
//            } else {
//                response.setStatus(HttpServletResponse.SC_NOT_FOUND); // User not found
//            }
//
////            resultSet.close();
////            preparedStatement.close();
////            connection.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//        }
    }
}