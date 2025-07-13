package com.Controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import com.Dao.FlightDao;

@WebServlet("/DeleteFlightController")
public class DeleteFlightController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        boolean deleted = new FlightDao().deleteFlightById(id);

        if (deleted)
            response.sendRedirect("show_flights.jsp?msg=deleted");
        else
            response.sendRedirect("show_flights.jsp?msg=error");
    }
}
