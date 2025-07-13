<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Airline Management System - Login</title>
<link rel="stylesheet" href="style/login.css">
</head>
<body>
	<div class="login-container">
		<h1>Airline Management System</h1>
		<form action="LoginController" method="post"
			onsubmit="return validateForm()">
			<label for="userType">Login As:</label> <select name="userType"
				id="userType" required>
				<option value="">--Select--</option>
				<option value="admin">Admin</option>
				<option value="passenger">Passenger</option>
			</select> <label for="userid">User ID:</label> <input type="text" id="userid"
				name="userid" required> <label for="password">Password:</label>
			<input type="password" id="password" name="password" required>

			<input type="submit" value="Login">
			<p class="register-link">
				New Passenger? <a href="register.jsp">Register here</a>
			</p>
		</form>
		<p id="error" class="error-message"></p>
	</div>

	<script>
		function validateForm() {
			let userid = document.getElementById("userid").value.trim();
			let password = document.getElementById("password").value.trim();
			let userType = document.getElementById("userType").value;

			if (userType === "") {
				document.getElementById("error").textContent = "Please select user type.";
				return false;
			}
			if (userid === "" || password === "") {
				document.getElementById("error").textContent = "User ID and Password are required.";
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
