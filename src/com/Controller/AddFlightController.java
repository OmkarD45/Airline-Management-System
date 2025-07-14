package com.Controller;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Model.Flight;
import com.Dao.FlightDao;

@WebServlet("/AddFlightController")
public class AddFlightController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Flight f = new Flight();
        f.setCarrierId(Integer.parseInt(request.getParameter("carrierId")));
        f.setOrigin(request.getParameter("origin"));
        f.setDestination(request.getParameter("destination"));
        f.setAirfare(Integer.parseInt(request.getParameter("airfare")));
        f.setBusinessSeats(Integer.parseInt(request.getParameter("business")));
        f.setEconomySeats(Integer.parseInt(request.getParameter("economy")));
        f.setExecutiveSeats(Integer.parseInt(request.getParameter("executive")));

        FlightDao dao = new FlightDao();
        boolean result = dao.insertFlight(f);

        if (result)
            response.sendRedirect("add_flight.jsp?msg=success");
        else
            response.sendRedirect("add_flight.jsp?msg=failure");
    }
}