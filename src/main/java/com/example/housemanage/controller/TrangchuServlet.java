package com.example.housemanage.controller;

import com.example.housemanage.model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrangchuServlet{
    private Connection connection = DBConnection.getConnection();
    private PreparedStatement statement;
    private ResultSet resultSet;

    public List<Room> getRoom() {
        List<Room> roomList = new ArrayList<>();
        try {
            String sql = "SELECT r.roomID, r.heading, r.price, r.area, r.address, r.description\n" +
                    "FROM room r\n" +
                    "JOIN user u ON r.userID = u.ID;";
            statement = this.connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Room room = new Room();
                room.setID(resultSet.getInt("roomID"));
                room.setHeading(resultSet.getString("heading"));
                room.setPrice(resultSet.getDouble("price"));
                room.setArea(resultSet.getDouble("area"));
                room.setAddress(resultSet.getString("address"));
                room.setDescription(resultSet.getString("description"));
//              room.setImage(resultSet.getByte("image"));
                roomList.add(room);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return roomList;
    }
}
