package h503.roomforrent.controller;

import h503.roomforrent.controller.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.*;
import java.util.Base64;
import java.util.Objects;

@WebServlet(name = "login", value = "/login")
public class LoginServlet  extends HttpServlet {
//    private Connection connection = null;
//    private Statement statement = null;
//    private ResultSet resultSet = null;
//    @Override
//    public void init() throws ServletException {
//        super.init();
//        try{
//            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
//            String url = getServletContext().getInitParameter("databaseURL");
//            String user = getServletContext().getInitParameter("user");
//            String pass = getServletContext().getInitParameter("password");
//            connection = DriverManager.getConnection(url, user, pass);
//            statement = connection.createStatement();
//            System.out.println("OK!");
//        } catch (Exception ex){
//            ex.printStackTrace();
//        }
//    }
    Connection connection = DBConnection.getConnection();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        System.out.println("User: " + username + "\nPass: " + password);
        boolean validUser = false;

        try {
//            if(Objects.equals(username, "") || Objects.equals(password, "")){
//                request.setAttribute("error", "Missing username or password!");
//                doGet(request, response);
//            }
            String sql_query = "SELECT * FROM user WHERE username = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql_query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            validUser = resultSet.next();
        } catch (SQLException e) {
            request.setAttribute("error", "Can't connect to database!");
            doGet(request, response);
        }

        if(!validUser){
            request.setAttribute("error", "Wrong username or password!");
            doGet(request, response);
        }
        else{
            // URL of the second servlet (receiver) with data as query parameters
            String receiverServletURL = "http://localhost:8080/HouseManage/home";
            String queryString = "username=" + Base64.getEncoder().encodeToString(username.getBytes());
            String completeURL = receiverServletURL + "?" + queryString;

            // Create the HTTP GET request
            URL url = new URL(completeURL);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.disconnect();
            response.sendRedirect(completeURL);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
    }
}
