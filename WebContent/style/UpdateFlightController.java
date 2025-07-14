
package com.Controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import com.Model.Flight;
import com.Dao.FlightDao;

@WebServlet("/UpdateFlightController")
public class UpdateFlightController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Flight f = new Flight();
        f.setCarrierId(Integer.parseInt(request.getParameter("carrierId")));
        f.setOrigin(request.getParameter("origin"));
        f.setDestination(request.getParameter("destination"));
        f.setAirfare(Integer.parseInt(request.getParameter("airfare")));
        f.setBusinessSeats(Integer.parseInt(request.getParameter("business")));
        f.setEconomySeats(Integer.parseInt(request.getParameter("economy")));
        f.setExecutiveSeats(Integer.parseInt(request.getParameter("executive")));

        boolean result = new FlightDao().updateFlightById(f, id);

        if (result)
            response.sendRedirect("show_flights.jsp?msg=updated");
        else
            response.sendRedirect("show_flights.jsp?msg=failed");
    }
}