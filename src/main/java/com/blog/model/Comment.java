package com.blog.model;

import java.sql.Timestamp;

public class Comment {
    private int id;
    private String content;
    private int blogId;
    private int userId;
    private String username; // To store the username of the commenter
    private Timestamp createdAt;
    
    public Comment() {}
    
    public Comment(int id, String content, int blogId, int userId, String username, Timestamp createdAt) {
        this.id = id;
        this.content = content;
        this.blogId = blogId;
        this.userId = userId;
        this.username = username;
        this.createdAt = createdAt;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public int getBlogId() {
        return blogId;
    }
    
    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }
    
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public Timestamp getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}