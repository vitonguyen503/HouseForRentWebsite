package com.example.housemanage.controller;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet(name = "delete", value = "/home/delete")
public class DeleteRoomServlet extends HttpServlet {
    Connection connection = DBConnection.getConnection();
    PreparedStatement statement;
    ResultSet resultSet;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String id = req.getParameter("roomid");
        int roomID = Integer.parseInt(new String(Base64.getDecoder().decode(id)));
        if(check(roomID)){
            deleteRoom(roomID);
            deleteReservation(roomID);
            System.out.println("Delete successfully!");
            String receiverServletURL = "http://localhost:8080/HouseManage/home";
            String queryString = "username=" + username;
            String completeURL = receiverServletURL + "?" + queryString;

            // Create the HTTP GET request
            URL url = new URL(completeURL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.disconnect();
            resp.sendRedirect(completeURL);
        }
        else
            goToIndexPage(resp);
    }

    void deleteRoom(int roomID){
        try{
            String sql = "DELETE FROM room WHERE roomID = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, roomID);
            statement.executeUpdate();
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }

    void deleteReservation(int roomID){
        try{
            String sql = "DELETE FROM reservation WHERE roomID = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, roomID);
            statement.executeUpdate();
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }
    boolean check(int roomID){
        try{
            String sql = "SELECT * FROM room WHERE roomID = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, roomID);
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
