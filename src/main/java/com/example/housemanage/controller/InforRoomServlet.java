package com.example.housemanage.controller;

import com.example.housemanage.model.Room;
import com.example.housemanage.model.user;
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

@WebServlet(name = "inforhome", value = "/inforHome")
public class InforRoomServlet extends HttpServlet{
    private Connection connection = DBConnection.getConnection();
    private PreparedStatement statement;
    private ResultSet resultSet;
    public InforRoomServlet(){}
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String senderName = req.getParameter("sendername");
        String senderNumber = req.getParameter("sendernumber");
        String senderNote = req.getParameter("sendernote");
        String roomID = req.getParameter("roomid");
        int i = Integer.parseInt(roomID);
        try {
            String sql = "insert into reservation (roomID, senderName, senderNumber, senderNote) values ('" + i + "', '" + senderName + "', '" + senderNumber + "', '" + senderNote + "');";
            statement = connection.prepareStatement(sql);
            statement.executeUpdate();
            String link = "/inforHome.jsp?roomid=" + i;
            getServletContext().getRequestDispatcher(link).forward(req, resp);
        } catch (SQLException ex){
            req.setAttribute("error", "Can't connect to database!");
            doGet(req, resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/inforHome.jsp").forward(req, resp);
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
                room.setImage(resultSet.getBytes(8));
                room.setCity(resultSet.getString(9));
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return room;
    }

    public user userInfor(int id){
        user user = null;
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
                room.setImage(resultSet.getBytes(8));
                int i = room.getUserID();
                String sql1 = "select email, number, username from user where ID = ?";
                statement = connection.prepareStatement(sql1);
                statement.setInt(1, i);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    user = new user();
                    user.setUsername(resultSet.getString(3));
                    user.setNumber(resultSet.getString(2));
                    user.setEmail(resultSet.getString(1));
                }
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }
        return user;
    }
}
