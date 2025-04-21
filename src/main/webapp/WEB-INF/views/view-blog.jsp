<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="card">
    <a href="${pageContext.request.contextPath}/home" style="color: #3498db; text-decoration: none; margin-bottom: 1rem; display: inline-block;">
        &larr; Back to Blogs
    </a>
    <h2 class="blog-title">${blog.title}</h2>
    <div class="blog-meta">Posted by ${blog.username} on ${blog.createdAt}</div>
    <div class="blog-content">
        <p>${blog.content}</p>
    </div>
    
    <c:if test="${user.id == blog.userId || user.admin}">
        <div style="display: flex; gap: 0.75rem; margin-top: 1rem;">
            <a href="${pageContext.request.contextPath}/edit-blog?id=${blog.id}" class="btn btn-primary">Edit</a>
            <a href="${pageContext.request.contextPath}/delete-blog?id=${blog.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this blog?')">Delete</a>
        </div>
    </c:if>
</div>

<div class="comments-section">
    <h3 style="color: #2c3e50; margin-top: 0;">Comments</h3>
    
    <div class="card">
        <form action="${pageContext.request.contextPath}/add-comment" method="post">
            <input type="hidden" name="blogId" value="${blog.id}">
            <div class="form-group">
                <label for="content">Add a Comment</label>
                <textarea id="content" name="content" class="form-control" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Comment</button>
        </form>
    </div>
    
    <c:if test="${empty comments}">
        <p style="text-align: center; padding: 1rem;">No comments yet. Be the first to comment!</p>
    </c:if>
    
    <c:forEach var="comment" items="${comments}">
        <div class="comment">
            <div class="comment-meta">Posted by ${comment.username} on ${comment.createdAt}</div>
            <p>${comment.content}</p>
            
            <c:if test="${user.id == comment.userId || user.admin}">
                <div class="comment-actions">
                    <button onclick="showEditCommentForm(${comment.id}, '${comment.content}')" class="btn">Edit</button>
                    <a href="${pageContext.request.contextPath}/delete-comment?commentId=${comment.id}&blogId=${blog.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this comment?')">Delete</a>
                </div>
                <div id="editComment${comment.id}" style="display: none; margin-top: 10px;">
                    <form action="${pageContext.request.contextPath}/edit-comment" method="post">
                        <input type="hidden" name="commentId" value="${comment.id}">
                        <input type="hidden" name="blogId" value="${blog.id}">
                        <div class="form-group">
                            <textarea name="content" class="form-control" rows="2" required></textarea>
                        </div>
                        <div style="display: flex; gap: 0.5rem;">
                            <button type="submit" class="btn btn-primary">Update</button>
                            <button type="button" onclick="hideEditCommentForm(${comment.id})" class="btn">Cancel</button>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
    </c:forEach>
</div>

<script>
    function showEditCommentForm(commentId, content) {
        document.getElementById('editComment' + commentId).style.display = 'block';
        document.getElementById('editComment' + commentId).querySelector('textarea').value = content;
    }
    
    function hideEditCommentForm(commentId) {
        document.getElementById('editComment' + commentId).style.display = 'none';
    }
</script>

<%@ include file="footer.jsp" %>