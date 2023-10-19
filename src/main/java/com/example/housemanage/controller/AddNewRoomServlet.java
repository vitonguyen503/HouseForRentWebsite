package com.example.housemanage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Objects;

@WebServlet(name = "addnewroom", value = "/addnewroom")
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
        HttpSession session = req.getSession();
        Integer userID1 = (Integer) session.getAttribute("userID");
        String username = (String) session.getAttribute("username");
        String usernamegetByte = Base64.getEncoder().encodeToString(username.getBytes());
        int userID = userID1.intValue();
        req.setAttribute("userID", userID);
        if(!Objects.equals(local, "Local")){
            req.setAttribute("error", "Missing local!");
        }
        try {
            String sql = "insert into room (heading, price, area, address, description, city, userID) values ('" + title + "', '" + price + "', '" + area + "', '" + address + "', '" + description + "', '" + local + "', '" + userID + "');";
            statement = connection.prepareStatement(sql);
            statement.executeUpdate();
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
        getServletContext().getRequestDispatcher("/addHome.jsp").forward(req, resp);
    }
}
