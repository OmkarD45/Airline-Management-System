<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Registration</title>
    <link rel="stylesheet" href="style/style.css">
    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            font-family: 'Segoe UI', sans-serif;
        }
        .register-box {
            width: 600px;
            margin: 30px auto;
            padding: 25px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="number"],
        input[type="date"] {
            width: 100%;
            padding: 8px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        input[type="submit"] {
            background-color: #3a7bd5;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #2a62c0;
        }
    </style>
</head>
<body>

<div class="register-box">
    <h2>Customer Registration</h2>
    <form action="RegisterController" method="post">
        <label>Username:</label>
        <input type="text" name="username" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <label>Phone:</label>
        <input type="number" name="phone" required>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Address 1:</label>
        <input type="text" name="address1" required>

        <label>Address 2:</label>
        <input type="text" name="address2">

        <label>City:</label>
        <input type="text" name="city" required>

        <label>State:</label>
        <input type="text" name="state" required>

        <label>Country:</label>
        <input type="text" name="country" required>

        <label>Zip Code:</label>
        <input type="number" name="zipcode" required>

        <label>Date of Birth:</label>
        <input type="date" name="dob" required>

        <input type="submit" value="Register">
    </form>
</div>

</body>
</html>