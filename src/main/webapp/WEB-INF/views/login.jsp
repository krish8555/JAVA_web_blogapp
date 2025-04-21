<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="card" style="max-width: 500px; margin: 2rem auto;">
    <h2 style="color: #2c3e50; text-align: center; margin-bottom: 1.5rem;">Login to Your Account</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary" style="width: 100%;">Login</button>
    </form>
    <p style="text-align: center; margin-top: 1.5rem;">
        Don't have an account? <a href="${pageContext.request.contextPath}/register" style="color: #3498db; text-decoration: none;">Register</a><br>
        Forgot password? <a href="${pageContext.request.contextPath}/forgot-password" style="color: #3498db; text-decoration: none;">Reset Password</a>
    </p>
</div>

<%@ include file="footer.jsp" %>