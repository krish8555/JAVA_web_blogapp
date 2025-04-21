<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Blog</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f7fa;
            color: #333;
            line-height: 1.6;
        }
        
        header {
            background-color: #2c3e50;
            color: #fff;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        header h1 {
            margin: 0;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        
        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }
        
        nav ul li {
            margin-left: 1.5rem;
        }
        
        nav ul li a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s ease;
            font-weight: 500;
        }
        
        nav ul li a:hover {
            color: #3498db;
        }
        
        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }
        
        .alert {
            padding: 1rem;
            margin-bottom: 1.5rem;
            border-radius: 4px;
            font-weight: 500;
            animation: fadeIn 0.5s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border-left: 4px solid #28a745;
        }
        
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            border-left: 4px solid #dc3545;
        }
        
        .btn {
            display: inline-block;
            padding: 0.6rem 1.2rem;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 0.95rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .btn-primary {
            background-color: #3498db;
        }
        
        .btn-danger {
            background-color: #e74c3c;
        }
        
        .btn-danger:hover {
            background-color: #c0392b;
        }
        
        .btn-success {
            background-color: #2ecc71;
        }
        
        .btn-success:hover {
            background-color: #27ae60;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-control {
            width: 100%;
            padding: 0.8rem;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.25);
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #2c3e50;
        }
        
        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 1.5rem;
            padding: 1.5rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .pagination {
            display: flex;
            list-style: none;
            padding: 0;
            margin-top: 2rem;
            justify-content: center;
        }
        
        .pagination li {
            margin-right: 0.5rem;
        }
        
        .pagination li a {
            display: block;
            padding: 0.5rem 0.8rem;
            background-color: #fff;
            border: 1px solid #ddd;
            color: #333;
            text-decoration: none;
            border-radius: 4px;
            transition: all 0.3s ease;
        }
        
        .pagination li a:hover {
            background-color: #f8f9fa;
            border-color: #3498db;
        }
        
        .pagination li.active a {
            background-color: #3498db;
            color: #fff;
            border-color: #3498db;
        }
        
        .blog-title {
            margin-top: 0;
            margin-bottom: 0.75rem;
            color: #2c3e50;
            font-weight: 600;
        }
        
        .blog-meta {
            color: #6c757d;
            margin-bottom: 1rem;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
        }
        
        .blog-meta:before {
            content: '';
            display: inline-block;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: #3498db;
            margin-right: 8px;
        }
        
        .blog-content {
            margin-bottom: 1.5rem;
            line-height: 1.7;
        }
        
        .comments-section {
            margin-top: 3rem;
            background-color: #f8f9fa;
            padding: 1.5rem;
            border-radius: 8px;
        }
        
        .comment {
            background-color: #fff;
            padding: 1rem;
            border-radius: 6px;
            margin-bottom: 1rem;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }
        
        .comment-meta {
            color: #6c757d;
            font-size: 0.85rem;
            margin-bottom: 0.75rem;
            font-weight: 500;
        }
        
        .comment-actions {
            margin-top: 0.75rem;
            display: flex;
            gap: 0.75rem;
        }
        
        /* Animation for page transitions */
        @keyframes pageTransition {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        
        .container {
            animation: pageTransition 0.5s ease-out;
        }
    </style>
</head>
<body>
    <header>
        <h1>Java Blog</h1>
        <nav>
            <ul>
                <c:if test="${empty user}">
                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                    <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                </c:if>
                <c:if test="${not empty user}">
                    <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/add-blog">Add Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                    <li><span style="color: #3498db; font-weight: bold;">Welcome, ${user.username}${user.admin ? ' (Admin)' : ''}</span></li>
                </c:if>
            </ul>
        </nav>
    </header>
    <div class="container">
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">${errorMessage}</div>
        </c:if>
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">${successMessage}</div>
        </c:if>