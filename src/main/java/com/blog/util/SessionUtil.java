package com.blog.util;

import com.blog.model.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SessionUtil {
    public static void setUser(HttpServletRequest request, User user) {
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
    }
    
    public static User getUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return (User) session.getAttribute("user");
        }
        return null;
    }
    
    public static void clearSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
    
    public static boolean isLoggedIn(HttpServletRequest request) {
        return getUser(request) != null;
    }
    
    public static boolean isAdmin(HttpServletRequest request) {
        User user = getUser(request);
        return user != null && user.isAdmin();
    }
}