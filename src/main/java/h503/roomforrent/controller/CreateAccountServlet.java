package h503.roomforrent.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.Objects;


@WebServlet(name = "createaccount", value = "/createaccount")
public class CreateAccountServlet extends HttpServlet {
    Connection connection = DBConnection.getConnection();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String confirm = request.getParameter("confirmpassword").trim();
        String name = request.getParameter("name").trim();
        String email = request.getParameter("email").trim();
        String number = request.getParameter("number").trim();
        String address = request.getParameter("address").trim();

        if (Objects.equals(username, "") || Objects.equals(password, "") || Objects.equals(confirm, "") || Objects.equals(name, "") || Objects.equals(email, "") || Objects.equals(number, "") || Objects.equals(address, "")) {
            request.setAttribute("error", "Missing information!");
            doGet(request, response);
        } else if (!password.equals(confirm)) {
            request.setAttribute("error", "Password doesn't match!");
            doGet(request, response);
        } else {
            String sql = "select password from user where username = '" + username + "'";
            String tmpPassword = null;
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery(sql);
                while (resultSet.next()) {
                    tmpPassword = resultSet.getString("password");
                }
            } catch (SQLException ex) {
                request.setAttribute("error", "Can't connect to server!");
                ex.printStackTrace();
                doGet(request, response);
            }
            if (tmpPassword != null) {
                request.setAttribute("error", "Username has already existed!");
                doGet(request, response);
            } else {
                try {
                    sql = "INSERT INTO user (username, password, name, email, number, address) VALUES (?, ?, ?, ?, ?, ?)";
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, username);
                    preparedStatement.setString(2, password);
                    preparedStatement.setString(3, name);
                    preparedStatement.setString(4, email);
                    preparedStatement.setString(5, number);
                    preparedStatement.setString(6, address);

                    int rowsInserted = preparedStatement.executeUpdate();

                    if (rowsInserted > 0) {
                        request.setAttribute("message", "Account created successfully!");
                        doGet(request, response);
                    } else {
                        request.setAttribute("message", "Failed to create the account.");
                        System.out.println("Failed to create the account.");
                    }
                } catch (SQLException ex) {
                    request.setAttribute("error", "Can't connect to server!");
                    doGet(request, response);
                }
            }
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/login").forward(request, response);
    }
}