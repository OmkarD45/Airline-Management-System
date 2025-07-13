<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Add Carrier</title>
    <link rel="stylesheet" href="style/dashboard.css">
</head>
<body>

<!-- Header -->
<header>
    <h2>✈️ Airline Management System - Admin</h2>
</header>

<!-- Sidebar + Main Content -->
<div class="container">
    <!-- Sidebar -->
    <nav class="sidebar">
        <ul>
            <li>
                <span>Carrier ▾</span>
                <ul class="submenu">
                    <li><a href="add_carrier.jsp">➕ Add Carrier</a></li>
                    <li><a href="show_carriers.jsp">📋 Show Carriers</a></li>
                </ul>
            </li>
            <li>
                <span>Flight ▾</span>
                <ul class="submenu">
                    <li><a href="add_flight.jsp">➕ Add Flight</a></li>
                    <li><a href="show_flights.jsp">📋 Show Flights</a></li>
                </ul>
            </li>
            <li><a href="LogoutController">🚪 Logout</a></li>
            
        </ul>
    </nav>

    <!-- Main Area with Form -->
    <main class="main-area">
        <div class="form-wrapper">
            <h3>Add Carrier Details</h3>
            <form action="AddCarrierController" method="post" class="carrier-form">
                <label>Carrier Name:</label>
                <input type="text" name="carrierName" required>

                <label>Discount for 30 Days Advance Booking (%):</label>
                <input type="number" name="d30" required>

                <label>Discount for 60 Days Advance Booking (%):</label>
                <input type="number" name="d60" required>

                <label>Discount for 90 Days Advance Booking (%):</label>
                <input type="number" name="d90" required>

                <label>Bulk Booking Discount (%):</label>
                <input type="number" name="bulk" required>

                <label>Refund % (Cancel 2 Days Before Travel):</label>
                <input type="number" name="r2" required>

                <label>Refund % (Cancel 10 Days Before Travel):</label>
                <input type="number" name="r10" required>

                <label>Refund % (Cancel 20+ Days Before Travel):</label>
                <input type="number" name="r20" required>

                <label>Silver User Discount (%):</label>
                <input type="number" name="silver" required>

                <label>Gold User Discount (%):</label>
                <input type="number" name="gold" required>

                <label>Platinum User Discount (%):</label>
                <input type="number" name="platinum" required>

                <input type="submit" value="Save Carrier">
            </form>

            <%
                String msg = request.getParameter("msg");
                if (msg != null) {
                    if (msg.equals("success")) {
            %>
                <p style="color:green;">Carrier inserted successfully.</p>
            <%
                    } else {
            %>
                <p style="color:red;">Carrier not saved. Please try again.</p>
            <%
                    }
                }
            %>
        </div>
    </main>
</div>

</body>
</html>
