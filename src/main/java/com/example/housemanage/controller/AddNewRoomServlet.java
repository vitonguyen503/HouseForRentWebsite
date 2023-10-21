package com.example.housemanage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Objects;

@MultipartConfig
@WebServlet(name = "add", value = "/home/add")
public class AddNewRoomServlet extends HttpServlet {
    Connection connection = DBConnection.getConnection();
    PreparedStatement statement;
    ResultSet resultSet;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String address = req.getParameter("streetaddress");
        String local = req.getParameter("city");
        double area = Double.parseDouble(req.getParameter("area"));
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        Part photo = req.getPart("file");

        String contentType = photo.getContentType();

        HttpSession session = req.getSession();
        Integer userID1 = (Integer) session.getAttribute("userID");
        String username = (String) session.getAttribute("username");
        String usernamegetByte = Base64.getEncoder().encodeToString(username.getBytes());
        int userID = userID1.intValue();
        req.setAttribute("userID", userID);
        if (!contentType.startsWith("image/")) {
            req.setAttribute("error", "Wrong photo format!");
            doGet(req, resp);
        } else if(Objects.equals(local, "")) {
            req.setAttribute("error", "Missing city!");
            doGet(req, resp);
        }

        try {
            String sql = "insert into room (heading, price, area, address, description, city, userID, image) values (?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, title);
            statement.setDouble(2, price);
            statement.setDouble(3, area);
            statement.setString(4, address);
            statement.setString(5, description);
            statement.setString(6, local);
            statement.setInt(7, userID);
            InputStream photoInputStream = photo.getInputStream();
            statement.setBinaryStream(8, photoInputStream);
            statement.executeUpdate();
            System.out.println("Add successfully!");
            String receiverServletURL = "http://localhost:8080/HouseManage/home";
            String queryString = "username=" + usernamegetByte;
            String completeURL = receiverServletURL + "?" + queryString;

            // Create the HTTP GET request
            URL url = new URL(completeURL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.disconnect();
            resp.sendRedirect(completeURL);
        }
        catch (SQLException ex){
            req.setAttribute("error", "Can't connect to database!");
            doGet(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userID = Integer.parseInt(req.getParameter("id"));
        String username = req.getParameter("username");
        req.setAttribute("username", username);
        req.setAttribute("userID", userID);
        getServletContext().getRequestDispatcher("/addHome.jsp").forward(req, resp);
    }
}
