package com.Model;

public class Flight {
    private int carrierId;
    private String origin;
    private String destination;
    private int airfare;
    private int businessSeats;
    private int economySeats;
    private int executiveSeats;

    public int getCarrierId() { return carrierId; }
    public void setCarrierId(int carrierId) { this.carrierId = carrierId; }

    public String getOrigin() { return origin; }
    public void setOrigin(String origin) { this.origin = origin; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public int getAirfare() { return airfare; }
    public void setAirfare(int airfare) { this.airfare = airfare; }

    public int getBusinessSeats() { return businessSeats; }
    public void setBusinessSeats(int businessSeats) { this.businessSeats = businessSeats; }

    public int getEconomySeats() { return economySeats; }
    public void setEconomySeats(int economySeats) { this.economySeats = economySeats; }

    public int getExecutiveSeats() { return executiveSeats; }
    public void setExecutiveSeats(int executiveSeats) { this.executiveSeats = executiveSeats; }
}