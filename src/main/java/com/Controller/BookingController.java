package com.Controller;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/BookingController")
public class BookingController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int flightId = Integer.parseInt(request.getParameter("flightId"));
        String classType = request.getParameter("classType");
        int seatCount = Integer.parseInt(request.getParameter("seatCount"));

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("userid");

        int passengerId = 0;  // will get UserID from USERTABLE

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean success = false;

        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true");

            // 🔍 Step 1: Lookup UserID from username in USERTABLE
            pst = con.prepareStatement("SELECT UserID FROM USERTABLE WHERE UserName = ?");
            pst.setString(1, username);
            rs = pst.executeQuery();
            if (rs.next()) {
                passengerId = rs.getInt("UserID");
            } else {
                throw new Exception("User not found");
            }
            rs.close();
            pst.close();

            // Step 2: Check available seat count in flight
            pst = con.prepareStatement("SELECT SeatCapacityEconomyClass, SeatCapacityBusinessClass, SeatCapacityExecutiveClass FROM Flight WHERE FlightID=?");
            pst.setInt(1, flightId);
            rs = pst.executeQuery();

            int availableSeats = 0;
            if (rs.next()) {
                switch (classType.toLowerCase()) {
                    case "economy":
                        availableSeats = rs.getInt("SeatCapacityEconomyClass");
                        break;
                    case "business":
                        availableSeats = rs.getInt("SeatCapacityBusinessClass");
                        break;
                    case "executive":
                        availableSeats = rs.getInt("SeatCapacityExecutiveClass");
                        break;
                }
            }
            rs.close();
            pst.close();

            if (availableSeats >= seatCount) {
                // Step 3: Insert into FlightBooking
                pst = con.prepareStatement("INSERT INTO FlightBooking (FlightID, PassengerID, BookingDate, ClassType, SeatCount) VALUES (?, ?, ?, ?, ?)");
                pst.setInt(1, flightId);
                pst.setInt(2, passengerId);
                pst.setDate(3, Date.valueOf(LocalDate.now()));
                pst.setString(4, classType);
                pst.setInt(5, seatCount);
                int inserted = pst.executeUpdate();
                pst.close();

                if (inserted > 0) {
                    // Step 4: Deduct seats from flight table
                    String updateQuery = switch (classType.toLowerCase()) {
                        case "economy" -> "UPDATE Flight SET SeatCapacityEconomyClass = SeatCapacityEconomyClass - ? WHERE FlightID=?";
                        case "business" -> "UPDATE Flight SET SeatCapacityBusinessClass = SeatCapacityBusinessClass - ? WHERE FlightID=?";
                        case "executive" -> "UPDATE Flight SET SeatCapacityExecutiveClass = SeatCapacityExecutiveClass - ? WHERE FlightID=?";
                        default -> null;
                    };

                    if (updateQuery != null) {
                        pst = con.prepareStatement(updateQuery);
                        pst.setInt(1, seatCount);
                        pst.setInt(2, flightId);
                        pst.executeUpdate();
                        success = true;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (pst != null) pst.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }

        if (success) {
            response.sendRedirect("view_flights.jsp?msg=Booking Successful");
        } else {
            response.sendRedirect("view_flights.jsp?msg=Booking Failed or No Seats Available");
        }
    }
}
