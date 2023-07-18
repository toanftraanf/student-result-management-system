<%-- 
    Document   : navbar
    Created on : Jun 27, 2023, 10:19:25 PM
    Author     : trant
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Accounts" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Accounts a = (Accounts) session.getAttribute("account"); %>
        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
            <a href="home.jsp" class="navbar-brand d-flex d-lg-none me-4">
                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
            </a>
            <a href="#" class="sidebar-toggler flex-shrink-0">
                <i class="fa fa-bars"></i>
            </a>
            <div class="navbar-nav align-items-center ms-auto">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <%
                            if(a.getRole() == 0) {
                        %>
                        <span class="d-none d-lg-inline-flex"><%=  a.getTeachers().getName() %></span>
                        <%
                            } else {
                        %>
                        <span class="d-none d-lg-inline-flex">Admin</span>
                        <%
                            }
                        %>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="logout" class="dropdown-item">Log Out</a>
                    </div>
                </div>
            </div>
        </nav>
    </body>
</html>
