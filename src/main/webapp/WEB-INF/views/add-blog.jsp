<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="card">
    <h2 style="color: #2c3e50; margin-top: 0;">Create New Blog Post</h2>
    <form action="${pageContext.request.contextPath}/add-blog" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="content">Content</label>
            <textarea id="content" name="content" class="form-control" rows="10" required></textarea>
        </div>
        <div style="display: flex; gap: 1rem;">
            <button type="submit" class="btn btn-primary">Publish</button>
            <a href="${pageContext.request.contextPath}/home" class="btn">Cancel</a>
        </div>
    </form>
</div>

<%@ include file="footer.jsp" %>