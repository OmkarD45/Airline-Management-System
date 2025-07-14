
package com.Controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.Dao.CarrierDao;
@WebServlet("/CancelBookingController")
public class CancelBookingController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        int flightId = Integer.parseInt(request.getParameter("flightId"));
        int seatCount = Integer.parseInt(request.getParameter("seatCount"));
        String classType = request.getParameter("classType");

        Connection con = null;
        PreparedStatement pst1 = null, pst2 = null;

        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            con = DriverManager.getConnection("jdbc:derby:D:\\Users\\2798556\\MyDB;create=true");
            con.setAutoCommit(false); // Start transaction

            // Step 1: Delete booking
            pst1 = con.prepareStatement("DELETE FROM FlightBooking WHERE BookingID = ?");
            pst1.setInt(1, bookingId);
            int deleted = pst1.executeUpdate();

            // Step 2: If deleted, update seat count
            if (deleted > 0) {
                String updateQuery = "";
                switch (classType.toLowerCase()) {
                    case "business":
                        updateQuery = "UPDATE Flight SET SeatCapacityBusinessClass = SeatCapacityBusinessClass + ? WHERE FlightID = ?";
                        break;
                    case "economy":
                        updateQuery = "UPDATE Flight SET SeatCapacityEconomyClass = SeatCapacityEconomyClass + ? WHERE FlightID = ?";
                        break;
                    case "executive":
                        updateQuery = "UPDATE Flight SET SeatCapacityExecutiveClass = SeatCapacityExecutiveClass + ? WHERE FlightID = ?";
                        break;
                    default:
                        throw new Exception("Invalid class type");
                }

                pst2 = con.prepareStatement(updateQuery);
                pst2.setInt(1, seatCount);
                pst2.setInt(2, flightId);
                pst2.executeUpdate();

                con.commit(); // Commit both
                response.sendRedirect("view_bookings.jsp");
            } else {
                con.rollback();
                request.setAttribute("errorMsg", "Cancellation failed. Try again.");
                request.getRequestDispatcher("view_bookings.jsp").forward(request, response);
            }

        } catch (Exception e) {
            try {
                if (con != null) con.rollback();
            } catch (SQLException ignored) {}
            e.printStackTrace();
            request.setAttribute("errorMsg", "Error occurred: " + e.getMessage());
            request.getRequestDispatcher("view_bookings.jsp").forward(request, response);
        } finally {
            try { if (pst1 != null) pst1.close(); } catch (Exception ignored) {}
            try { if (pst2 != null) pst2.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}
