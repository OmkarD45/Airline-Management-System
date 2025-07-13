<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.Model.Flight, com.Dao.FlightDao"%>
<!DOCTYPE html>
<html>
<head>
<title>Show Flights</title>
<link rel="stylesheet" href="style/dashboard.css">
<style>
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: rgba(255, 255, 255, 0.95);
}

th, td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: center;
}

th {
	background-color: #3a7bd5;
	color: white;
}

.action-btn {
	padding: 6px 10px;
	margin: 2px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-weight: bold;
}

.edit-btn {
	background-color: #ffc107;
	color: black;
}

.delete-btn {
	background-color: #dc3545;
	color: white;
}
</style>
</head>
<body>

	<header>
		<h2>✈️ Airline Management System - Admin</h2>
	</header>

	<div class="container">
		<nav class="sidebar">
			<ul>
				<li><span>Carrier ▾</span>
					<ul class="submenu">
						<li><a href="add_carrier.jsp">➕ Add Carrier</a></li>
						<li><a href="show_carriers.jsp">📋 Show Carriers</a></li>
					</ul></li>
				<li><span>Flight ▾</span>
					<ul class="submenu">
						<li><a href="add_flight.jsp">➕ Add Flight</a></li>
						<li><a href="show_flights.jsp">📋 Show Flights</a></li>
					</ul></li>
				<li><a href="LogoutController">🚪 Logout</a></li>
			</ul>
		</nav>

		<main class="main-area">
			<h3>All Flights</h3>
			<table>
				<tr>
					<th>ID</th>
					<th>Carrier ID</th>
					<th>Origin</th>
					<th>Destination</th>
					<th>Airfare</th>
					<th>Business</th>
					<th>Economy</th>
					<th>Executive</th>
					<th>Actions</th>
				</tr>

				<%
				FlightDao dao = new FlightDao();
				List<Flight> list = dao.getAllFlights();
				int id = 1;
				for (Flight f : list) {
				%>
				<tr>
					<td><%=id%></td>
					<td><%=f.getCarrierId()%></td>
					<td><%=f.getOrigin()%></td>
					<td><%=f.getDestination()%></td>
					<td><%=f.getAirfare()%></td>
					<td><%=f.getBusinessSeats()%></td>
					<td><%=f.getEconomySeats()%></td>
					<td><%=f.getExecutiveSeats()%></td>
					<td>
						<form action="EditFlightController" method="get"
							style="display: inline;">
							<input type="hidden" name="id" value="<%=id%>">
							<button class="action-btn edit-btn">Edit</button>
						</form>
						<form action="DeleteFlightController" method="post"
							style="display: inline;">
							<input type="hidden" name="id" value="<%=id%>">
							<button class="action-btn delete-btn"
								onclick="return confirm('Delete this flight?');">Delete</button>
						</form>
					</td>
				</tr>
				<%
				id++;
				}
				%>
			</table>
		</main>
	</div>
</body>
</html>
