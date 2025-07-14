<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Airline Management System</title>
<link rel="stylesheet" href="style/dashboard.css">
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
			<h3>Welcome, Admin 👨‍✈️</h3>
			<p>Select an option from the dashboard to manage carriers and
				flights.</p>
		</main>
	</div>
</body>
</html>