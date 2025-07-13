<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Flight</title>
<link rel="stylesheet" href="style/dashboard.css">
<style>
body {
	background-image:
		url('https://images.unsplash.com/photo-1629153466787-811bd887e1ca?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D');
	background-size: cover;
	background-attachment: fixed;
	font-family: 'Segoe UI', sans-serif;
}

.form-wrapper {
	background-color: rgba(255, 255, 255, 0.92);
	padding: 30px;
	margin-top: 30px;
	width: 600px;
	border-radius: 12px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
	margin-left: auto;
	margin-right: auto;
}

.form-wrapper h3 {
	text-align: center;
	color: #003366;
	margin-bottom: 20px;
}

form label {
	font-weight: bold;
	display: block;
	margin-top: 12px;
	color: #333;
}

form input[type="text"], form input[type="number"] {
	width: 100%;
	padding: 10px;
	margin-top: 4px;
	border: 1px solid #aaa;
	border-radius: 6px;
	font-size: 15px;
}

form input[type="submit"] {
	width: 100%;
	padding: 12px;
	margin-top: 20px;
	background-color: #007bff;
	border: none;
	color: white;
	font-size: 16px;
	border-radius: 6px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

form input[type="submit"]:hover {
	background-color: #0056b3;
}

p {
	text-align: center;
	font-weight: bold;
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
			<div class="form-wrapper">
				<h3>Add Flight Details</h3>
				<form action="AddFlightController" method="post">
					<label>Carrier ID:</label> <input type="number" name="carrierId" required>
						 <label>Origin:</label> <input type="text"
						name="origin" required> <label>Destination:</label> <input
						type="text" name="destination" required> <label>Airfare:</label>
					<input type="number" name="airfare" required> <label>Seat
						Capacity (Business Class):</label> <input type="number" name="business"
						required> <label>Seat Capacity (Economy Class):</label> <input
						type="number" name="economy" required> <label>Seat
						Capacity (Executive Class):</label> <input type="number" name="executive"
						required> <input type="submit" value="Add Flight">
				</form>

				<%
				String msg = request.getParameter("msg");
				if ("success".equals(msg)) {
				%>
				<p style="color: green;">Flight added successfully.</p>
				<%
				} else if ("failure".equals(msg)) {
				%>
				<p style="color: red;">Issue in saving Flight Information.
					Please check the data and try again.</p>
				<%
				}
				%>
			</div>
		</main>
	</div>
</body>
</html>
