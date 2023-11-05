package h503.roomforrent.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.Objects;

@WebServlet(name = "forgetPass", value = "/forgetPassword")
public class ForgetPasswordServlet extends HttpServlet {
    Connection connection = DBConnection.getConnection();
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

        String username = request.getParameter("username").trim();
        String newpass = request.getParameter("newpassword").trim();
        String confirmpass = request.getParameter("confirmpassword").trim();
        if(Objects.equals(username, "") || Objects.equals(newpass, "") || Objects.equals(confirmpass, "")){
            request.setAttribute("error", "Missing information!");
            doGet(request, response);
        } else if (!newpass.equals(confirmpass)) {
            request.setAttribute("error", "Password doesn't match!");
            doGet(request, response);
        }
        else{
            String sql = "select password from user where username = '" + username + "'";
            String tmpPassword = null;
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    tmpPassword = resultSet.getString("password");
                }
            } catch (SQLException e) {
                request.setAttribute("error", "Can't connect to server!");
                doGet(request, response);
            }
            if(tmpPassword == null){
                request.setAttribute("error", "Username hasn't existed!");
                doGet(request, response);
            }
            else{
                sql = "update user set password = '" + newpass + "' where username = '" + username + "';";
                try {
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
                    int i = preparedStatement.executeUpdate();
                    if(i > 0){
                        request.setAttribute("message", "Update successfully!");
                        doGet(request, response);
                    }
                    else {
                        request.setAttribute("message", "Failed to reset password.");
                        System.out.println("Failed to reset password.");
                    }
                } catch (SQLException e) {
                    request.setAttribute("error", "Can't connect to server!");
                    doGet(request, response);
                }
            }
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        getServletContext().getRequestDispatcher("/forgetPassword.jsp").forward(request, response);
    }
}
