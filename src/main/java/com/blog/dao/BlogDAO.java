package com.blog.dao;

import com.blog.model.Blog;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BlogDAO {
    // Create a new blog post
    public boolean addBlog(Blog blog) {
        String sql = "INSERT INTO blogs (title, content, user_id, created_at) VALUES (?, ?, ?, ?)";
        Connection conn = null;
        
        try {
            conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, blog.getTitle());
            pstmt.setString(2, blog.getContent());
            pstmt.setInt(3, blog.getUserId());
            pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBConnection.closeConnection(conn);
        }
    }
    
    // Get all blogs with pagination
    public List<Blog> getAllBlogs(int page, int pageSize) {
        List<Blog> blogs = new ArrayList<>();
        String sql = "SELECT b.*, u.username FROM blogs b JOIN users u ON b.user_id = u.id ORDER BY b.created_at DESC LIMIT ? OFFSET ?";
        Connection conn = null;
        
        try {
            conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, (page - 1) * pageSize);
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setUserId(rs.getInt("user_id"));
                blog.setUsername(rs.getString("username"));
                blog.setCreatedAt(rs.getTimestamp("created_at"));
                blogs.add(blog);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(conn);
        }
        
        return blogs;
    }
    
    // Get total number of blogs
    public int getTotalBlogs() {
        String sql = "SELECT COUNT(*) FROM blogs";
        Connection conn = null;
        
        try {
            conn = DBConnection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(conn);
        }
        
        return 0;
    }
    
    // Get blog by ID
    public Blog getBlogById(int blogId) {
        String sql = "SELECT b.*, u.username FROM blogs b JOIN users u ON b.user_id = u.id WHERE b.id = ?";
        Connection conn = null;
        
        try {
            conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, blogId);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Blog blog = new Blog();
                blog.setId(rs.getInt("id"));
                blog.setTitle(rs.getString("title"));
                blog.setContent(rs.getString("content"));
                blog.setUserId(rs.getInt("user_id"));
                blog.setUsername(rs.getString("username"));
                blog.setCreatedAt(rs.getTimestamp("created_at"));
                return blog;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closeConnection(conn);
        }
        
        return null;
    }
    
    // Update a blog post
    public boolean updateBlog(Blog blog) {
        String sql = "UPDATE blogs SET title = ?, content = ? WHERE id = ? AND user_id = ?";
        Connection conn = null;
        
        try {
            conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, blog.getTitle());
            pstmt.setString(2, blog.getContent());
            pstmt.setInt(3, blog.getId());
            pstmt.setInt(4, blog.getUserId());
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBConnection.closeConnection(conn);
        }
    }
    
    // Update a blog post (admin)
    public boolean updateBlogByAdmin(Blog blog) {
        String sql = "UPDATE blogs SET title = ?, content = ? WHERE id = ?";
        Connection conn = null;
        
        try {
            conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, blog.getTitle());
            pstmt.setString(2, blog.getContent());
            pstmt.setInt(3, blog.getId());
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBConnection.closeConnection(conn);
        }
    }
    
    // Delete a blog post
    public boolean deleteBlog(int blogId, int userId) {
        String sql = "DELETE FROM blogs WHERE id = ? AND user_id = ?";
        Connection conn = null;
        
        try {
            conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, blogId);
            pstmt.setInt(2, userId);
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBConnection.closeConnection(conn);
        }
    }
    
    // Delete a blog post (admin)
    public boolean deleteBlogByAdmin(int blogId) {
        String sql = "DELETE FROM blogs WHERE id = ?";
        Connection conn = null;
        
        try {
            conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, blogId);
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBConnection.closeConnection(conn);
        }
    }
}