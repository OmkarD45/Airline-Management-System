<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.Model.Carrier"%>
<%
Carrier c = (Carrier) request.getAttribute("carrier");
int cid = (int) request.getAttribute("cid");
%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Carrier</title>
<link rel="stylesheet" href="style/dashboard.css">
</head>
<body>

	<header>
		<h2>✈️ Edit Carrier</h2>
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
				<h3>Edit Carrier Info</h3>
				<form action="UpdateCarrierController" method="post"
					class="carrier-form">
					<input type="hidden" name="id" value="<%=cid%>"> <label>Carrier
						Name:</label> <input type="text" name="carrierName"
						value="<%=c.getCarrierName()%>" required> <label>30D:</label>
					<input type="number" name="d30" value="<%=c.getD30()%>" required>

					<label>60D:</label> <input type="number" name="d60"
						value="<%=c.getD60()%>" required> <label>90D:</label> <input
						type="number" name="d90" value="<%=c.getD90()%>" required>

					<label>Bulk:</label> <input type="number" name="bulk"
						value="<%=c.getBulk()%>" required> <label>Refund
						2D:</label> <input type="number" name="r2" value="<%=c.getR2()%>"
						required> <label>Refund 10D:</label> <input type="number"
						name="r10" value="<%=c.getR10()%>" required> <label>Refund
						20D:</label> <input type="number" name="r20" value="<%=c.getR20()%>"
						required> <label>Silver:</label> <input type="number"
						name="silver" value="<%=c.getSilver()%>" required> <label>Gold:</label>
					<input type="number" name="gold" value="<%=c.getGold()%>"
						required> <label>Platinum:</label> <input type="number"
						name="platinum" value="<%=c.getPlatinum()%>" required> <input
						type="submit" value="Update Carrier">
				</form>
			</div>
		</main>
	</div>
</body>
</html>
