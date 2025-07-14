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
    <title>View Flights</title>
    <link rel="stylesheet" href="style/dashboard.css">
    <style>
        table {
            width: 95%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: rgba(255,255,255,0.95);
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #3a7bd5;
            color: white;
        }

        form {
            margin: 0;
        }

        select, input[type="number"] {
            padding: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 5px 10px;
            background-color: #3a7bd5;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2c65b2;
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
		<h3>Available Flights</h3>
		<%
		    try {
		        Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
		        con = DriverManager.getConnection("jdbc:derby:D:\\Users\\2798556\\MyDB;create=true");
		        String sql = "SELECT * FROM Flight";
		        pst = con.prepareStatement(sql);
		        rs = pst.executeQuery();
		%>
		<table>
			<tr>
				<th>Flight ID</th>
				<th>Carrier ID</th>
				<th>Origin</th>
				<th>Destination</th>
				<th>Fare</th>
				<th>Economy</th>
				<th>Business</th>
				<th>Executive</th>
				<th>Book</th>
			</tr>
			<%
			    while(rs.next()) {
			%>
			<tr>
				<form action="BookingController" method="post">
					<td><%= rs.getInt("FlightID") %>
						<input type="hidden" name="flightId" value="<%= rs.getInt("FlightID") %>">
					</td>
					<td><%= rs.getInt("CarrierID") %></td>
					<td><%= rs.getString("Origin") %></td>
					<td><%= rs.getString("Destination") %></td>
					<td><%= rs.getInt("AirFare") %></td>
					<td><%= rs.getInt("SeatCapacityEconomyClass") %></td>
					<td><%= rs.getInt("SeatCapacityBusinessClass") %></td>
					<td><%= rs.getInt("SeatCapacityExecutiveClass") %></td>
					<td>
						<select name="classType" required>
							<option value="">Select Class</option>
							<option value="Economy">Economy</option>
							<option value="Business">Business</option>
							<option value="Executive">Executive</option>
						</select>
						<br><input type="number" name="seatCount" min="1" max="10" placeholder="Seats" required>
						<br><input type="submit" value="Book">
					</td>
				</form>
			</tr>
			<%
			    }
			%>
		</table>
		<%
		    } catch(Exception e) {
		        out.println("<p>Error fetching flights: " + e.getMessage() + "</p>");
		    } finally {
		        if(rs != null) rs.close();
		        if(pst != null) pst.close();
		        if(con != null) con.close();
		    }
		%>
	</main>
</div>

</body>
</html>