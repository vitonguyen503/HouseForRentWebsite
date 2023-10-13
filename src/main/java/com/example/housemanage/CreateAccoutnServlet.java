package com.example.housemanage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.rowset.serial.SerialException;
import java.io.IOException;

@WebServlet(name = "createaccount", value = "/createaccount")
public class CreateAccoutnServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        
    }
}
