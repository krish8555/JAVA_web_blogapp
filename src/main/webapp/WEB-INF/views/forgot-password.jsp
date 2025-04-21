<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="card" style="max-width: 500px; margin: 2rem auto;">
    <h2 style="color: #2c3e50; text-align: center; margin-bottom: 1.5rem;">Reset Your Password</h2>
    <form action="${pageContext.request.contextPath}/forgot-password" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="dob">Date of Birth</label>
            <input type="date" id="dob" name="dob" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="newPassword" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm New Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary" style="width: 100%;">Reset Password</button>
    </form>
    <p style="text-align: center; margin-top: 1.5rem;">
        Remember your password? <a href="${pageContext.request.contextPath}/login" style="color: #3498db; text-decoration: none;">Login</a>
    </p>
</div>

<%@ include file="footer.jsp" %>