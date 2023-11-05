package com.example.housemanage.controller;

import com.example.housemanage.model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "Home", value = "/home")
public class UserHomepage extends HttpServlet {
    private final Connection connection = DBConnection.getConnection();
    ResultSet resultSet = null;
    PreparedStatement statement;
    int userID;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String encoded = req.getParameter("username");
        if(encoded == null)
            goToIndexPage(resp);
        String user = new String(Base64.getDecoder().decode(encoded));
        String sql = "SELECT * FROM user WHERE username = ?";
        userID = Integer.MIN_VALUE;
        boolean validUser = false;
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, user);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                validUser = true;
                userID = resultSet.getInt("ID");
            }

        } catch (Exception exception){
            exception.printStackTrace();
        }

        if(!validUser)
            goToIndexPage(resp);
        else {
//            try {
//                sql = "SELECT avatar FROM user WHERE username = ?";
//                statement = connection.prepareStatement(sql);
//                statement.setString(1, user);
//                ResultSet rs = statement.executeQuery();
//
//                if (rs.next()) {
//                    // Get the image data
//                    byte[] imageData = rs.getBytes("avatar");
//
//                    // Set the image data as a response content
//                    resp.setContentType("image/jpeg"); // Set the appropriate content type
//                    OutputStream oStream = resp.getOutputStream();
//                    oStream.write(imageData);
//                } else {
//                    // Handle image not found
//                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
//                }
//            } catch (Exception e) {
//                // Handle database or other errors
//                e.printStackTrace();
//                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            }
            List<Room> list_of_room = getContent(userID);
            req.setAttribute("userID", userID);
            req.setAttribute("user", user);
            req.setAttribute("encodedUser", encoded);
            req.setAttribute("count", list_of_room.size());
            req.setAttribute("list_of_room", list_of_room);
            getServletContext().getRequestDispatcher("/dashboardUser.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    private void goToIndexPage(HttpServletResponse response) throws IOException{
        response.sendRedirect("http://localhost:8080/HouseManage");
    }

    List<Room> getContent(int userID){
        List<Room> listOfRooms = new LinkedList<>();
        String sql = "SELECT roomID, heading, price, area, address, description, image FROM room WHERE userID = ?";
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userID);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int roomID = resultSet.getInt("roomID");
                String heading = resultSet.getString("heading");
                double price = resultSet.getDouble("price");
                double area = resultSet.getDouble("area");
                String address = resultSet.getString("address");
                String description = resultSet.getString("description");
                byte[] image = resultSet.getBytes("image");
                listOfRooms.add(new Room(roomID, heading, price, area, address, description, image));
            }
        } catch (Exception exception){
            exception.printStackTrace();
        }
        return listOfRooms;
    }
}
