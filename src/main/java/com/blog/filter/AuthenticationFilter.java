package com.blog.filter;

import com.blog.util.SessionUtil;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
    }
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        
        // Allow access to login, register, and forgot password pages
        if (path.equals("/login") || path.equals("/register") || path.equals("/forgot-password") ||
            path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".jpg") || path.endsWith(".png")) {
            chain.doFilter(request, response);
            return;
        }
        
        // Check if user is logged in
        if (!SessionUtil.isLoggedIn(httpRequest)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
            return;
        }
        
        chain.doFilter(request, response);
    }
    
    @Override
    public void destroy() {
        // Cleanup code, if needed
    }
}