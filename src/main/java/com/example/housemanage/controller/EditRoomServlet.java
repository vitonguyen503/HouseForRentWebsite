package com.example.housemanage.controller;

import com.example.housemanage.model.Room;
import com.example.housemanage.model.reverse;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "editroom", value = "/editroom")
public class EditRoomServlet extends HttpServlet {
    Connection connection = DBConnection.getConnection();
    PreparedStatement statement;
    ResultSet resultSet;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String address = req.getParameter("streetaddress");
        String city = req.getParameter("city");
        double area = Double.parseDouble("area");
        double price = Double.parseDouble("price");
        String description = req.getParameter("description");
        int roomid = Integer.parseInt(req.getParameter("roomid"));
        try{
            String sql = "update room set heading = '" + title + "', address = '" + address + "', city = '" + city + "', area = '" + area + "', price = '" + price + "', description = '" + description + "';\n" +
                    "where roomID = " + roomid + ";";
            statement = connection.prepareStatement(sql);
            statement.executeUpdate();

        }
        catch (SQLException ex){
            req.setAttribute("error", "Can't connect to database!");
            doGet(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public Room roomInfor(int id){
        Room room = null;
        try{
            String sql = "select * from room where roomID=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            resultSet = statement.executeQuery();
            while(resultSet.next()){
                room = new Room();
                room.setID(resultSet.getInt(1));
                room.setUserID(resultSet.getInt(2));
                room.setHeading(resultSet.getString(3));
                room.setArea(resultSet.getDouble(4));
                room.setPrice(resultSet.getDouble(5));
                room.setAddress(resultSet.getString(6));
                room.setDescription(resultSet.getString(7));
                room.setImage(resultSet.getByte(8));
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return room;
    }

    public List<reverse> TableReservation(int id){
        List<reverse> reverse = new ArrayList<>();
        try{
            String sql = "select * from reservation where roomID=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);

            resultSet = statement.executeQuery();
            while(resultSet.next()){
                reverse reverse1 = new reverse();
                reverse1.setRoomID(resultSet.getInt(1));
                reverse1.setSenderName(resultSet.getString(2));
                reverse1.setSenderNumber(resultSet.getString(3));
                reverse1.setSenderNote(resultSet.getString(4));
                reverse.add(reverse1);
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return reverse;
    }
}
