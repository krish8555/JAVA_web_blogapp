<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
    <h2 style="color: #2c3e50; margin: 0;">Latest Blogs</h2>
    <a href="${pageContext.request.contextPath}/add-blog" class="btn btn-primary">
        <span style="margin-right: 0.5rem;">+</span> Add New Blog
    </a>
</div>

<c:if test="${empty blogs}">
    <div class="card" style="text-align: center; padding: 3rem;">
        <p>No blogs available. Be the first to create a blog!</p>
        <a href="${pageContext.request.contextPath}/add-blog" class="btn btn-primary">Create Blog</a>
    </div>
</c:if>

<c:forEach var="blog" items="${blogs}">
    <div class="card">
        <h3 class="blog-title">${blog.title}</h3>
        <div class="blog-meta">Posted by ${blog.username} on ${blog.createdAt}</div>
        <div class="blog-content">
            <p>${blog.content.length() > 200 ? blog.content.substring(0, 200).concat('...') : blog.content}</p>
        </div>
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <a href="${pageContext.request.contextPath}/view-blog?id=${blog.id}" class="btn">Read More</a>
            <c:if test="${user.id == blog.userId || user.admin}">
                <div style="display: flex; gap: 0.5rem;">
                    <a href="${pageContext.request.contextPath}/edit-blog?id=${blog.id}" class="btn">Edit</a>
                    <a href="${pageContext.request.contextPath}/delete-blog?id=${blog.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this blog?')">Delete</a>
                </div>
            </c:if>
        </div>
    </div>
</c:forEach>

<c:if test="${totalPages > 1}">
    <ul class="pagination">
        <c:forEach begin="1" end="${totalPages}" var="i">
            <li class="${currentPage == i ? 'active' : ''}">
                <a href="${pageContext.request.contextPath}/home?page=${i}">${i}</a>
            </li>
        </c:forEach>
    </ul>
</c:if>

<%@ include file="footer.jsp" %>