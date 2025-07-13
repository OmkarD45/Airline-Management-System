<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.Model.Carrier, com.Dao.CarrierDao" %>
<!DOCTYPE html>
<html>
<head>
    <title>Show Carriers</title>
    <link rel="stylesheet" href="style/dashboard.css">
    <style>
        table {
            background-color: rgba(255,255,255,0.95);
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
            font-size: 14px;
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

        .table-wrapper {
            overflow-x: auto;
            max-width: 100%;
        }
    </style>
</head>
<body>

<!-- Header -->
<header>
    <h2>✈️ Airline Management System - Admin</h2>
</header>

<!-- Sidebar + Main Content -->
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
        <h3>All Registered Carriers</h3>

        <div class="table-wrapper">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>30D%</th>
                    <th>60D%</th>
                    <th>90D%</th>
                    <th>Bulk%</th>
                    <th>Refund 2D%</th>
                    <th>Refund 10D%</th>
                    <th>Refund 20D%</th>
                    <th>Silver%</th>
                    <th>Gold%</th>
                    <th>Platinum%</th>
                    <th>Actions</th>
                </tr>

                <%
                    CarrierDao dao = new CarrierDao();
                    List<Carrier> carriers = dao.getAllCarriers(); // you'll define this method next

                    int id = 1;
                    for (Carrier c : carriers) {
                %>
                    <tr>
                        <td><%= id++ %></td>
                        <td><%= c.getCarrierName() %></td>
                        <td><%= c.getD30() %></td>
                        <td><%= c.getD60() %></td>
                        <td><%= c.getD90() %></td>
                        <td><%= c.getBulk() %></td>
                        <td><%= c.getR2() %></td>
                        <td><%= c.getR10() %></td>
                        <td><%= c.getR20() %></td>
                        <td><%= c.getSilver() %></td>
                        <td><%= c.getGold() %></td>
                        <td><%= c.getPlatinum() %></td>
                        <td>
                            <form action="EditCarrierController" method="get" style="display:inline;">
                                <input type="hidden" name="id" value="<%= id - 1 %>">
                                <button class="action-btn edit-btn" type="submit">Edit</button>
                            </form>
                            <form action="DeleteCarrierController" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= id - 1 %>">
                                <button class="action-btn delete-btn" type="submit" onclick="return confirm('Delete this carrier?');">Delete</button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                %>
            </table>
        </div>
    </main>
</div>

</body>
</html>
