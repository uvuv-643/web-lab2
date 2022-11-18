package com.example.lab2.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ControllerServlet", value = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("x") != null && request.getParameter("y") != null && request.getParameter("radius") != null) {
            getServletContext().getNamedDispatcher("AreaCheckServlet").forward(request, response);
        } else if (request.getParameter("clear") != null){
            getServletContext().getNamedDispatcher("AreaClearServlet").forward(request, response);



        } else {
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
