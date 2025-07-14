package com.Dao;

import java.sql.*;

public class LoginDao {

    public static boolean validate(String userId, String password, String userType) {
        boolean status = false;
        String query = "";

        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby:D:\\Users\\2798556\\MyDB;create=true");

            if ("admin".equalsIgnoreCase(userType)) {
                query = "SELECT * FROM Admin WHERE AdminID=? AND Password=?";
            } else if ("passenger".equalsIgnoreCase(userType)) {
                query = "SELECT * FROM UserTable WHERE UserName=? AND Password=?";
            }

            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, userId);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                status = true;
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}