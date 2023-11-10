package com.example.housemanage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Objects;

@MultipartConfig
@WebServlet(name = "createaccount", value = "/createaccount")
public class CreateAccountServlet extends HttpServlet {
    Connection connection = DBConnection.getConnection();
    PreparedStatement statement;
    ResultSet resultSet;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String confirm = request.getParameter("confirmpassword").trim();
        String email = request.getParameter("email").trim();
        String number = request.getParameter("number").trim();
        Part photo = request.getPart("file");

        // Check if the file is an image (you can enhance this validation)
        String contentType = photo.getContentType();
        System.out.println(contentType);

        if(!password.equals(confirm)) {
            request.setAttribute("error", "Password doesn't match!");
            doGet(request, response);
        } else if(checkEmail(email)){
            request.setAttribute("error", "This email has already been registered");
            doGet(request, response);
        }
        else if (!contentType.startsWith("image/")) {
            request.setAttribute("error", "Wrong photo format");
            doGet(request, response);
        }
        else {
            String sql = "select ID, username, password, email, number, avatar from user where username = '" + username + "'";
            try {
                statement = connection.prepareStatement(sql);
                resultSet = statement.executeQuery(sql);
                if (resultSet.next()){
                    request.setAttribute("error", "Username has already existed!");
                    doGet(request, response);
                } else {
//                    if(photo.getSize() <= 0){
//                        sql = "INSERT INTO user (username, password, email, number) VALUES (?, ?, ?, ?)";
//                        statement = connection.prepareStatement(sql);
//                        statement.setString(1, username);
//                        statement.setString(2, password);
//                        statement.setString(3, email);
//                        statement.setString(4, number);
//                    }
//                    else{
                        sql = "INSERT INTO user (username, password, email, number, avatar) VALUES (?, ?, ?, ?, ?)";
                        statement = connection.prepareStatement(sql);
                        statement.setString(1, username);
                        statement.setString(2, password);
                        statement.setString(3, email);
                        statement.setString(4, number);
                        InputStream photoInputStream = photo.getInputStream();
                        statement.setBinaryStream(5, photoInputStream);
//                    }
                    int rowsInserted = statement.executeUpdate();
                    if (rowsInserted > 0) {
                        request.setAttribute("message", "Account created successfully!");
                        doGet(request, response);
                    } else {
                        request.setAttribute("message", "Failed to create the account.");
                        doGet(request, response);
                    }
                }
            } catch (SQLException ex){
                request.setAttribute("error", "Can't connect to server!");
//                ex.printStackTrace();
                doGet(request, response);
            }
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        getServletContext().getRequestDispatcher("/createAccount.jsp").forward(request, response);
    }

    boolean checkEmail(String email){
        try{
            String sql = "SELECT ID, username, password, email, number, avatar FROM user WHERE email = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            resultSet = statement.executeQuery();
            return resultSet.next();
        }
        catch (SQLException ex){
            return false;
        }
    }
}
