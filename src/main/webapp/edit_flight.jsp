<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.Model.Flight" %>
<%
    Flight f = (Flight) request.getAttribute("flight");
    int id = (int) request.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Flight</title>
    <link rel="stylesheet" href="style/dashboard.css">
    <style>
        .form-wrapper {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 25px;
            border-radius: 10px;
            width: 50%;
            margin: auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        .form-wrapper h3 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-wrapper form {
            display: flex;
            flex-direction: column;
        }

        .form-wrapper label {
            font-weight: bold;
            margin-top: 10px;
        }

        .form-wrapper input[type="text"],
        .form-wrapper input[type="number"] {
            padding: 8px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #aaa;
        }

        .form-wrapper input[type="submit"] {
            margin-top: 20px;
            padding: 10px;
            background-color: #3a7bd5;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-wrapper input[type="submit"]:hover {
            background-color: #285ec0;
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
            <h3>Edit Flight Details</h3>
            <form action="UpdateFlightController" method="post">
                <input type="hidden" name="id" value="<%= id %>">

                <label>Carrier ID:</label>
                <input type="number" name="carrierId" value="<%= f.getCarrierId() %>" required>

                <label>Origin:</label>
                <input type="text" name="origin" value="<%= f.getOrigin() %>" required>

                <label>Destination:</label>
                <input type="text" name="destination" value="<%= f.getDestination() %>" required>

                <label>Airfare:</label>
                <input type="number" name="airfare" value="<%= f.getAirfare() %>" required>

                <label>Business Class Seats:</label>
                <input type="number" name="business" value="<%= f.getBusinessSeats() %>" required>

                <label>Economy Class Seats:</label>
                <input type="number" name="economy" value="<%= f.getEconomySeats() %>" required>

                <label>Executive Class Seats:</label>
                <input type="number" name="executive" value="<%= f.getExecutiveSeats() %>" required>

                <input type="submit" value="Update Flight">
            </form>
        </div>
    </main>
</div>

</body>
</html>
