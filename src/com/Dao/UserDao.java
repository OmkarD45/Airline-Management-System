package com.Dao;

import java.sql.*;
import com.Model.Customer;

public class UserDao {
    public boolean registerCustomer(Customer c) {
        try {
        	Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby:D:\\Users\\2798556\\MyDB;create=true");

            String query = "INSERT INTO UserTable (UserName, Password, Phone, EmailId, Address1, Address2, City, State, Country, ZipCode, DOB, Role, UserCategory) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, c.getUsername());
            pst.setString(2, c.getPassword());
            pst.setLong(3, c.getPhone());
            pst.setString(4, c.getEmail());
            pst.setString(5, c.getAddress1());
            pst.setString(6, c.getAddress2());
            pst.setString(7, c.getCity());
            pst.setString(8, c.getState());
            pst.setString(9, c.getCountry());
            pst.setLong(10, c.getZipcode());
            pst.setString(11, c.getDob());
            pst.setString(12, c.getRole());
            pst.setString(13, c.getUserCategory());

            int count = pst.executeUpdate();
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}