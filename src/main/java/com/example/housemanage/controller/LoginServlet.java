package com.example.housemanage.controller;

import com.example.housemanage.controller.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.*;
import java.util.Base64;
import java.util.Objects;

@WebServlet(name = "login", value = "/login")
public class LoginServlet  extends HttpServlet {
    Connection connection = DBConnection.getConnection();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        System.out.println("User: " + username + "\nPass: " + password);
        int userID = getUserId(username, password);
        HttpSession session = request.getSession();
        session.setAttribute("userID", userID);
        session.setAttribute("username", username);
        boolean validUser = false;

        try {
            String sql_query = "SELECT * FROM user WHERE username = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql_query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            validUser = resultSet.next();
        } catch (SQLException e) {
            request.setAttribute("error", "Can't connect to database!");
            doGet(request, response);
        }

        if(!validUser){
            request.setAttribute("error", "Wrong username or password!");
            doGet(request, response);
        }
        else{
            System.out.println(userID);
            // URL of the second servlet (receiver) with data as query parameters
            String receiverServletURL = "http://localhost:8080/HouseManage/home";
            String queryString = "username=" + Base64.getEncoder().encodeToString(username.getBytes());
            String completeURL = receiverServletURL + "?" + queryString;

            // Create the HTTP GET request
            URL url = new URL(completeURL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.disconnect();
            response.sendRedirect(completeURL);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
    }
    public int getUserId(String username, String password) {
        int userID = -1;

        try {
            String sql = "SELECT ID FROM user WHERE username = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                userID = resultSet.getInt("ID");
            }

            resultSet.close();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userID;
    }
}
