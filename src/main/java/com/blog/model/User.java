package com.blog.model;

import java.sql.Date;

public class User {
    private int id;
    private String username;
    private String password;
    private Date dateOfBirth;
    private String role; // "admin" or "user"
    
    public User() {}
    
    public User(int id, String username, String password, Date dateOfBirth, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.dateOfBirth = dateOfBirth;
        this.role = role;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public Date getDateOfBirth() {
        return dateOfBirth;
    }
    
    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    public String getRole() {
        return role;
    }
    
    public void setRole(String role) {
        this.role = role;
    }
    
    public boolean isAdmin() {
        return "admin".equals(role);
    }
}