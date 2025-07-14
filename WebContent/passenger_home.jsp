<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String userid = (String) session.getAttribute("userid");
    if (userid == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Passenger Dashboard - Airline Management System</title>
<link rel="stylesheet" href="style/dashboard.css">
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
			<h3>Welcome, Passenger 🛎️</h3>
			<p>Select an option to book flights or manage your bookings.</p>
		</main>
	</div>
</body>
</html>