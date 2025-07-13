package com.Model;

public class User {
    private String userId;
    private String password;
    private String userType; // "admin" or "passenger"

    // Constructor
    public User(String userId, String password, String userType) {
        this.userId = userId;
        this.password = password;
        this.userType = userType;
    }

    // Getters
    public String getUserId() { return userId; }
    public String getPassword() { return password; }
    public String getUserType() { return userType; }
}
