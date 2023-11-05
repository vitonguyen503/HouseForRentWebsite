package com.example.housemanage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "getRoomImage", value = "/getRoomImage")
public class GetRoomImageServlet extends HttpServlet {
    Connection connection = DBConnection.getConnection();
    PreparedStatement statement;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("roomID");
            int roomID = Integer.parseInt(id);
            String sql = "SELECT image FROM room WHERE roomID = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, roomID);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                // Get the image data
                byte[] imageData = rs.getBytes("image");

                // Set the image data as a response content
                resp.setContentType("image/jpeg"); // Set the appropriate content type
                OutputStream oStream = resp.getOutputStream();
                oStream.write(imageData);
            } else {
                // Handle image not found
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            // Handle database or other errors
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
