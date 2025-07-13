✈️ Airline Management System (AMS)


🔹 Description:
The Airline Management System (AMS) is a web-based application designed to automate and manage airline operations including flight bookings, carrier management, user registration, ticket cancellations, and admin-level controls. The system supports both admin and passenger functionalities with secure login and intuitive dashboards.

🔹 Key Features:
👤 Passenger Module:
Registration/Login: New users can register; returning users can log in using Passenger ID and password.

Flight Booking: Passengers can view available flights and book seats based on class (Economy, Business, Executive).

View Bookings: Displays booking details with an option to cancel.

Cancel Booking: Calculates refund based on cancellation rules and travel date.

Logout: Ends session and redirects to login.

🛠️ Admin Module:
Login: Admins access the system with secure credentials.

Carrier Management:

Add/Edit/Delete carrier details.

Set discount percentages and refund policies per carrier.

Flight Management:

Add/Edit/Delete flights.

Set seat capacities and base airfare.

View flights with the lowest fare for a route.

Count number of flights under each carrier.

Logout: Securely ends admin session.

🔹 Technology Stack:
Frontend: HTML, CSS, JavaScript (JSP for dynamic content)

Backend: Java Servlets, JDBC

Database: Apache Derby (Embedded)

Tools: Eclipse IDE, Apache Tomcat 10

🔹 Modules Implemented:
LoginController, RegisterController

AddCarrierController, EditCarrierController, UpdateCarrierController

AddFlightController, UpdateFlightController

BookingController, CancelBookingController

DAO and Model layers for Carrier, Flight, Booking

Separate JSP pages for all admin and passenger views

🔹 Special Logic:
Dynamic Discounts: Based on advance booking (30/60/90 days), user loyalty level (Silver/Gold/Platinum), and group size.

Refund Calculation: Based on how early a cancellation is done before the travel date.

Session Management: Ensures only logged-in users can access restricted pages.

