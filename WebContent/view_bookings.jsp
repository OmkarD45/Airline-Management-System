<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%
    String userid = (String) session.getAttribute("userid");
    if (userid == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Bookings</title>
    <link rel="stylesheet" href="style/dashboard.css">
    <style>
        table {
            width: 90%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.95);
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #3a7bd5;
            color: white;
        }

        input[type="submit"] {
            padding: 6px 12px;
            background-color: #e74c3c;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

<header>
    <h2>✈️ Airline Management System - Passenger</h2>
</header>

<div class="container">
    <nav class="sidebar">
        <ul>
            <li><a href="view_flights.jsp">✈️ View Flights</a></li>
            <li><a href="view_bookings.jsp">📄 View Bookings</a></li>
            <li><a href="LogoutController">🚪 Logout</a></li>
        </ul>
    </nav>

    <main class="main-area">
        <h3>My Bookings</h3>
        <%
            try {
                Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
                con = DriverManager.getConnection("jdbc:derby:D:\\Users\\2798556\\MyDB;create=true");

                // Step 1: Get actual numeric UserID from session UserName
                int userId = -1;
                pst = con.prepareStatement("SELECT UserID FROM USERTABLE WHERE UserName = ?");
                pst.setString(1, userid);
                rs = pst.executeQuery();
                if (rs.next()) {
                    userId = rs.getInt("UserID");
                } else {
                    out.println("<p style='color:red;'>User not found in database.</p>");
                }
                rs.close();
                pst.close();

                if (userId != -1) {
                    // Step 2: Fetch bookings using UserID
                    pst = con.prepareStatement("SELECT * FROM FlightBooking WHERE PassengerID=?");
                    pst.setInt(1, userId);
                    rs = pst.executeQuery();
        %>
        <table>
            <tr>
                <th>Booking ID</th>
                <th>Flight ID</th>
                <th>Class</th>
                <th>Seats</th>
                <th>Booking Date</th>
                <th>Action</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <form action="CancelBookingController" method="post">
                    <td><%= rs.getInt("BookingID") %>
                        <input type="hidden" name="bookingId" value="<%= rs.getInt("BookingID") %>">
                    </td>
                    <td><%= rs.getInt("FlightID") %>
                        <input type="hidden" name="flightId" value="<%= rs.getInt("FlightID") %>">
                    </td>
                    <td><%= rs.getString("ClassType") %>
                        <input type="hidden" name="classType" value="<%= rs.getString("ClassType") %>">
                    </td>
                    <td><%= rs.getInt("SeatCount") %>
                        <input type="hidden" name="seatCount" value="<%= rs.getInt("SeatCount") %>">
                    </td>
                    <td><%= rs.getDate("BookingDate") %></td>
                    <td><input type="submit" value="Cancel"></td>
                </form>
            </tr>
            <%
                }
            %>
        </table>
        <%
                } else {
                    out.println("<p>No bookings found for user.</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error loading bookings: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception ignored) {}
                if (pst != null) try { pst.close(); } catch (Exception ignored) {}
                if (con != null) try { con.close(); } catch (Exception ignored) {}
            }
        %>
    </main>
</div>

</body>
</html>