package com.example.housemanage.controller;

import com.example.housemanage.model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
public class SearchServlet {
    private Connection connection = DBConnection.getConnection();
    private PreparedStatement statement;
    private ResultSet resultSet;
    public List<Room> getRoomBySearch(String local, String area, String price, String inputsearch){
        List<Room> roomList = new ArrayList<>();
        Room room = null;

        try{
            String sql = "SELECT r.roomID, r.heading, r.price, r.area, r.address, r.description\n" +
                    "FROM room r JOIN user u ON r.userID = u.ID\n" + "WHERE 1=1";
            Double minArea = null;
            Double maxArea = null;
            Double minPrice = null;
            Double maxPrice = null;
            if(!area.equals("Area")){
                if(area.contains("-")){
                    String[] rangeParts = area.split("-");
                    if (rangeParts.length == 2) {
                        minArea = Double.parseDouble(rangeParts[0]);
                        maxArea = Double.parseDouble(rangeParts[1]);
                    }
                }
                else if(area.startsWith(">")){
                    minArea = Double.parseDouble(area.substring(1));
                }
                if (minArea != null && maxArea != null) {
                    sql += " and area >= " + minArea + " and area <= " + maxArea;
                }
                else if (minArea != null) {
                    sql += " and area >= " + minArea;
                }
            }

            if(!price.equals("Price")){
                if(price.contains("-")){
                    String[] rangeParts = price.split("-");
                    if (rangeParts.length == 2) {
                        minPrice = Double.parseDouble(rangeParts[0]);
                        maxPrice = Double.parseDouble(rangeParts[1]);
                    }
                }
                else if(price.startsWith(">")){
                    minPrice = Double.parseDouble(price.substring(1));
                }
                if (minPrice != null && maxPrice != null) {
                    sql += " and price >= " + minPrice + " AND price <= " + maxPrice;
                }
                else if (minPrice != null) {
                    sql += " and price >= " + minPrice;
                }
            }

            if (!local.equals("Address")) {
                sql += " and city like '" + local + "'";
            }
            if(inputsearch != null && !inputsearch.isEmpty()){
                sql += " and heading like '%" + inputsearch + "%'";
            }
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while(resultSet.next()){
                room = new Room();
                room.setID(resultSet.getInt("roomID"));
                room.setHeading(resultSet.getString("heading"));
                room.setPrice(resultSet.getDouble("price"));
                room.setArea(resultSet.getDouble("area"));
                room.setAddress(resultSet.getString("address"));
                room.setDescription(resultSet.getString("description"));;
                roomList.add(room);
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }

        return roomList;
    }
}
