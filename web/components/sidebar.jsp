<%-- 
    Document   : nav_bar
    Created on : Jun 27, 2023, 8:38:48 PM
    Author     : trant
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:useBean id="dao" class="dal.CoursesDAO" scope="request" ></jsp:useBean>
<jsp:useBean id="tdao" class="dal.TeachingDAO" scope="request" ></jsp:useBean>
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
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="home.jsp" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>SRMS</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <%
                            if(a.getRole() == 0) {
                        %>
                        <h6 class="mb-0"><%= a.getTeachers().getName() %></h6>
                        <span>
                            <%= (a.getRole() == 0) ? "Instructor" : "Admin" %>
                        </span>
                        <%
                            } else {
                        %>
                        <h6 class="mb-0">Admin</h6>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <%
                        if(a.getRole() == 0) {
                    %>
                    <c:set var="teacherId" scope="session" value='<%= a.getTeachers().getId() %>'></c:set>
                    <c:forEach items="${dao.getCoursesByTeacherId(teacherId)}" var="c">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" ><i class="fa fa-file-alt me-2"></i>${c.rollId}</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <c:forEach items="${tdao.getTeachingByCourseAndTeacher(c.id, teacherId)}" var="t">
                                    <a href="results?id=${t.id}" class="dropdown-item">${t.classes.name}</a>
                                </c:forEach>
                            </div>
                        </div>
                    </c:forEach>
                    <%
                        } else {
                    %>
                    <a href="dashboard" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <a href="manage-courses" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Manage Courses</a>
                    <a href="manage-classes" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Manage Classes</a>
                    <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Manage Students</a>
                    <a href="manage-teachers" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Manage Teachers</a>
                    <%
                        }
                    %>
                </div>
            </nav>
        </div>
    </body>
</html>
