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
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

@MultipartConfig
@WebServlet(name = "changeInfo", value = "/home/changeInfo")
public class ChangeInfoServlet extends HttpServlet {
    Connection connection = DBConnection.getConnection();
    PreparedStatement statement;
    ResultSet resultSet;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String encoded = req.getParameter("username");
        String username = new String(Base64.getDecoder().decode(encoded));
        String password = req.getParameter("password");
        String confirm = req.getParameter("confirm");
        String email = req.getParameter("email");
        String number = req.getParameter("number");
        Part photo = req.getPart("file");
        String contentType = photo.getContentType();

        if(!password.equals(confirm)) {
            req.setAttribute("error", "Password doesn't match!");
            doGet(req, resp);
        } else if (!contentType.startsWith("image/")) {
            req.setAttribute("error", "Wrong photo format");
            doGet(req, resp);
        } else {
            String sqlQuery = "UPDATE user SET password = ?, email = ?, number = ?, avatar = ? WHERE username = ?";
            try{
                statement = connection.prepareStatement(sqlQuery);
                statement.setString(1, password);
                statement.setString(2, email);
                statement.setString(3, number);
                InputStream photoInputStream = photo.getInputStream();
                statement.setBinaryStream(4, photoInputStream);
                statement.setString(5, username);
                statement.executeUpdate();
                System.out.println("Change info successfully!");
                String receiverServletURL = "http://localhost:8080/HouseManage/home";
                String queryString = "username=" + encoded;
                String completeURL = receiverServletURL + "?" + queryString;

                // Create the HTTP GET request
                URL url = new URL(completeURL);
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                connection.disconnect();
                resp.sendRedirect(completeURL);
            } catch (Exception ex){
                ex.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String encodedUser = req.getParameter("username");
        String username = new String(Base64.getDecoder().decode(encodedUser));
        if(check(username)){
            req.setAttribute("username", encodedUser);
            getServletContext().getRequestDispatcher("/changeInfo.jsp").forward(req, resp);
        }
        else
            goToIndexPage(resp);
    }

    boolean check(String username){
        try{
            String sql = "SELECT * FROM user WHERE username = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            resultSet = statement.executeQuery();
            return resultSet.next();
        }
        catch (SQLException ex){
            return false;
        }
    }
    private void goToIndexPage(HttpServletResponse response) throws IOException{
        response.sendRedirect("http://localhost:8080/HouseManage");
    }
}
