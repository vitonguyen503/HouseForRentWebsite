package com.example.housemanage.controller;

import com.example.housemanage.model.Room;
import com.example.housemanage.model.reverse;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Objects;

@MultipartConfig
@WebServlet(name = "edit", value = "/home/edit")
public class EditRoomServlet extends HttpServlet {
    Connection connection = DBConnection.getConnection();
    PreparedStatement statement;
    ResultSet resultSet;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String roomID = req.getParameter("roomid");
        String username = req.getParameter("username");
        int roomid = Integer.parseInt(roomID);

        String title = req.getParameter("title");
        String address = req.getParameter("streetaddress");
        String local = req.getParameter("city");
        double area = Double.parseDouble(req.getParameter("area"));
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        Part photo = req.getPart("file");

        // Check if the file is an image (you can enhance this validation)
//        String contentType = photo.getContentType();
//        if (!contentType.startsWith("image/")) {
//            req.setAttribute("error", "Wrong photo format!");
//            doGet(req, resp);
//        } else
            if(Objects.equals(local, "")) {
            req.setAttribute("error", "Missing city!");
            doGet(req, resp);
        }
        try {
            String sql;
            if(photo.getSize() <= 0){
                sql = "update room set heading = ?, price = ?,  area = ?, address = ?, description = ?, city = ? where roomID = ?";
                statement = connection.prepareStatement(sql);
                statement.setString(1, title);
                statement.setDouble(2, price);
                statement.setDouble(3, area);
                statement.setString(4, address);
                statement.setString(5, description);
                statement.setString(6, local);
                statement.setInt(7, roomid);
            }
            else{
                sql = "update room set heading = ?, price = ?,  area = ?, address = ?, description = ?, city = ?, image = ? where roomID = ?";
                statement = connection.prepareStatement(sql);
                statement.setString(1, title);
                statement.setDouble(2, price);
                statement.setDouble(3, area);
                statement.setString(4, address);
                statement.setString(5, description);
                statement.setString(6, local);
                InputStream photoInputStream = photo.getInputStream();
                statement.setBinaryStream(7, photoInputStream);
                statement.setInt(8, roomid);
            }
            statement.executeUpdate();
            System.out.println("Edit successfully!");
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
        catch (SQLException ex){
            req.setAttribute("error", "Can't connect to database!");
            doGet(req, resp);
        }
    }
    public static int decodeInteger(String encodedString) {
        // Giải mã chuỗi Base64 thành mảng byte
        byte[] decodedBytes = Base64.getDecoder().decode(encodedString);

        // Chuyển mảng byte thành chuỗi và sau đó chuyển đổi thành số nguyên
        int decodedNumber = Integer.parseInt(new String(decodedBytes));

        return decodedNumber;
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("roomid");
        String encodedUser = req.getParameter("username");
        int roomID = decodeInteger(id);
//        String x = new String(Base64.getDecoder().decode(id));
//        int roomID = Integer.parseInt(x);
        System.out.println(roomID);
        if(check(roomID)){
            req.setAttribute("roomID", roomID);
            req.setAttribute("username", encodedUser);
            getServletContext().getRequestDispatcher("/editHome.jsp").forward(req, resp);
        }else
            goToIndexPage(resp);

    }

    boolean check(int roomID){
        try{
            String sql = "SELECT roomID, userID, heading, price, area, address, description, image, city FROM room WHERE roomID = ?";
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

    public Room getRoomData(int id){
        Room room = new Room();
        try{
            String sql = "select roomID, heading, address, city, area, price, description, image from room where roomID = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if(resultSet.next()){
                room.setID(resultSet.getInt(1));
                room.setHeading(resultSet.getString(2));
                room.setAddress(resultSet.getString(3));
                room.setCity(resultSet.getString(4));
                room.setArea(resultSet.getDouble(5));
                room.setPrice(resultSet.getDouble(6));
                room.setDescription(resultSet.getString(7));
                room.setImage(resultSet.getBytes(8));
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
