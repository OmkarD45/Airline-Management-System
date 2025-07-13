package com.Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.Model.Carrier;

public class CarrierDao {

    private static final String DB_PATH = "C:\\Users\\omkar\\MyDB";

    public boolean insertCarrier(Carrier c) {
        boolean status = false;

        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true");

            String query = "INSERT INTO Carrier (CarrierName, DiscountPercentageThirtyDaysAdvanceBooking, " +
                    "DiscountPercentageSixtyDaysAdvanceBooking, DiscountPercentageNinteyDaysAdvanceBooking, " +
                    "BulkBookingDiscount, RefundPercentageForTicketCancellation2DaysBeforeTravelDate, " +
                    "RefundPercentageForTicketCancellation10DaysBeforeTravelDate, " +
                    "RefundPercentageForTicketCancellation20DaysOrMoreBeforeTravelDate, " +
                    "SilverUserDiscount, GoldUserDiscount, PlatinumUserDiscount) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, c.getCarrierName());
            pst.setInt(2, c.getD30());
            pst.setInt(3, c.getD60());
            pst.setInt(4, c.getD90());
            pst.setInt(5, c.getBulk());
            pst.setInt(6, c.getR2());
            pst.setInt(7, c.getR10());
            pst.setInt(8, c.getR20());
            pst.setInt(9, c.getSilver());
            pst.setInt(10, c.getGold());
            pst.setInt(11, c.getPlatinum());

            int rows = pst.executeUpdate();
            status = rows > 0;

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Carrier> getAllCarriers() {
        List<Carrier> list = new ArrayList<>();

        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true");
            String query = "SELECT * FROM Carrier";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Carrier c = new Carrier();
                c.setCarrierName(rs.getString("CarrierName"));
                c.setD30(rs.getInt("DiscountPercentageThirtyDaysAdvanceBooking"));
                c.setD60(rs.getInt("DiscountPercentageSixtyDaysAdvanceBooking"));
                c.setD90(rs.getInt("DiscountPercentageNinteyDaysAdvanceBooking"));
                c.setBulk(rs.getInt("BulkBookingDiscount"));
                c.setR2(rs.getInt("RefundPercentageForTicketCancellation2DaysBeforeTravelDate"));
                c.setR10(rs.getInt("RefundPercentageForTicketCancellation10DaysBeforeTravelDate"));
                c.setR20(rs.getInt("RefundPercentageForTicketCancellation20DaysOrMoreBeforeTravelDate"));
                c.setSilver(rs.getInt("SilverUserDiscount"));
                c.setGold(rs.getInt("GoldUserDiscount"));
                c.setPlatinum(rs.getInt("PlatinumUserDiscount"));

                list.add(c);
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Carrier getCarrierById(int id) {
        Carrier c = new Carrier();
        try (Connection con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true")) {
            String q = "SELECT * FROM Carrier WHERE CarrierID=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                c.setCarrierName(rs.getString("CarrierName"));
                c.setD30(rs.getInt("DiscountPercentageThirtyDaysAdvanceBooking"));
                c.setD60(rs.getInt("DiscountPercentageSixtyDaysAdvanceBooking"));
                c.setD90(rs.getInt("DiscountPercentageNinteyDaysAdvanceBooking"));
                c.setBulk(rs.getInt("BulkBookingDiscount"));
                c.setR2(rs.getInt("RefundPercentageForTicketCancellation2DaysBeforeTravelDate"));
                c.setR10(rs.getInt("RefundPercentageForTicketCancellation10DaysBeforeTravelDate"));
                c.setR20(rs.getInt("RefundPercentageForTicketCancellation20DaysOrMoreBeforeTravelDate"));
                c.setSilver(rs.getInt("SilverUserDiscount"));
                c.setGold(rs.getInt("GoldUserDiscount"));
                c.setPlatinum(rs.getInt("PlatinumUserDiscount"));
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return c;
    }

    public boolean updateCarrierById(Carrier c, int id) {
        boolean status = false;
        try (Connection con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true")) {
            String query = "UPDATE Carrier SET CarrierName=?, DiscountPercentageThirtyDaysAdvanceBooking=?, " +
                    "DiscountPercentageSixtyDaysAdvanceBooking=?, DiscountPercentageNinteyDaysAdvanceBooking=?, " +
                    "BulkBookingDiscount=?, RefundPercentageForTicketCancellation2DaysBeforeTravelDate=?, " +
                    "RefundPercentageForTicketCancellation10DaysBeforeTravelDate=?, " +
                    "RefundPercentageForTicketCancellation20DaysOrMoreBeforeTravelDate=?, " +
                    "SilverUserDiscount=?, GoldUserDiscount=?, PlatinumUserDiscount=? WHERE CarrierID=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, c.getCarrierName());
            pst.setInt(2, c.getD30());
            pst.setInt(3, c.getD60());
            pst.setInt(4, c.getD90());
            pst.setInt(5, c.getBulk());
            pst.setInt(6, c.getR2());
            pst.setInt(7, c.getR10());
            pst.setInt(8, c.getR20());
            pst.setInt(9, c.getSilver());
            pst.setInt(10, c.getGold());
            pst.setInt(11, c.getPlatinum());
            pst.setInt(12, id);

            int rows = pst.executeUpdate();
            status = rows > 0;

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public boolean deleteCarrierById(int id) {
        try (Connection con = DriverManager.getConnection("jdbc:derby:C:\\Users\\omkar\\MyDB;create=true")) {
        	String q = "DELETE FROM Carrier WHERE CarrierID=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, id);
            return pst.executeUpdate()>0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
