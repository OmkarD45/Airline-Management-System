
package com.Controller;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import com.Model.Flight;
import com.Dao.FlightDao;

@WebServlet("/EditFlightController")
public class EditFlightController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        FlightDao dao = new FlightDao();
        Flight f = dao.getFlightById(id);
        request.setAttribute("flight", f);
        request.setAttribute("id", id);
        request.getRequestDispatcher("edit_flight.jsp").forward(request, response);
    }
}
