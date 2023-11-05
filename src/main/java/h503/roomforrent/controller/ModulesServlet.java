package h503.roomforrent.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "modules", value = "/modules")
public class ModulesServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        System.out.println("do Post to servlet");
    }

    public  void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        System.out.println("do Get to servlet");
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
