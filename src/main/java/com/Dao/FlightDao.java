package com.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Model.Flight;

public class FlightDao {
    public boolean insertFlight(Flight f) {
        boolean status = false;

        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true");

            String query = "INSERT INTO Flight (CarrierID, Origin, Destination, AirFare, " +
                    "SeatCapacityBusinessClass, SeatCapacityEconomyClass, SeatCapacityExecutiveClass) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, f.getCarrierId());
            pst.setString(2, f.getOrigin());
            pst.setString(3, f.getDestination());
            pst.setInt(4, f.getAirfare());
            pst.setInt(5, f.getBusinessSeats());
            pst.setInt(6, f.getEconomySeats());
            pst.setInt(7, f.getExecutiveSeats());

            int rows = pst.executeUpdate();
            status = rows > 0;

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public List<Flight> getAllFlights() {
        List<Flight> list = new ArrayList<>();
        try {
        	Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true");
            String query = "SELECT * FROM Flight";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Flight f = new Flight();
                f.setCarrierId(rs.getInt("CarrierID"));
                f.setOrigin(rs.getString("Origin"));
                f.setDestination(rs.getString("Destination"));
                f.setAirfare(rs.getInt("AirFare"));
                f.setBusinessSeats(rs.getInt("SeatCapacityBusinessClass"));
                f.setEconomySeats(rs.getInt("SeatCapacityEconomyClass"));
                f.setExecutiveSeats(rs.getInt("SeatCapacityExecutiveClass"));
                list.add(f);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteFlightById(int id) {
        try (Connection con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true")) {
            String query = "DELETE FROM Flight WHERE FlightID=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Flight getFlightById(int id) {
        Flight f = new Flight();
        try (Connection con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true")) {
            String query = "SELECT * FROM Flight WHERE FlightID=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                f.setCarrierId(rs.getInt("CarrierID"));
                f.setOrigin(rs.getString("Origin"));
                f.setDestination(rs.getString("Destination"));
                f.setAirfare(rs.getInt("AirFare"));
                f.setBusinessSeats(rs.getInt("SeatCapacityBusinessClass"));
                f.setEconomySeats(rs.getInt("SeatCapacityEconomyClass"));
                f.setExecutiveSeats(rs.getInt("SeatCapacityExecutiveClass"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateFlightById(Flight f, int id) {
        try (Connection con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true")) {
            String query = "UPDATE Flight SET CarrierID=?, Origin=?, Destination=?, AirFare=?, " +
                    "SeatCapacityBusinessClass=?, SeatCapacityEconomyClass=?, SeatCapacityExecutiveClass=? " +
                    "WHERE FlightID=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, f.getCarrierId());
            pst.setString(2, f.getOrigin());
            pst.setString(3, f.getDestination());
            pst.setInt(4, f.getAirfare());
            pst.setInt(5, f.getBusinessSeats());
            pst.setInt(6, f.getEconomySeats());
            pst.setInt(7, f.getExecutiveSeats());
            pst.setInt(8, id);
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
