package com.example.housemanage.controller;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "delete", value = "/delete")
public class DeleteRoomServlet extends HttpServlet {
    Connection connection = DBConnection.getConnection();
    PreparedStatement statement;
    ResultSet resultSet;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String roomid = req.getParameter("roomID");
        int roomID = Integer.parseInt(roomid);
        try{
            String sql = "delete from room where roomID = " + roomID + ";";
            statement = connection.prepareStatement(sql);
            statement.executeUpdate();

        } catch (Exception ex){
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
