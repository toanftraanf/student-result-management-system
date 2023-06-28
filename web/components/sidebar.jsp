<%-- 
    Document   : nav_bar
    Created on : Jun 27, 2023, 8:38:48 PM
    Author     : trant
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:useBean id="dao" class="dal.CoursesDAO" scope="request" ></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="index.html" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>SRMS</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0"><%= session.getAttribute("username") %></h6>
                        <span>
                            <c:if test="${sessionScope.role == 0}">
                                Teacher
                            </c:if>
                            <c:if test="${sessionScope.role != 0}">
                                Admin
                            </c:if>
                        </span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <c:set var="teacherId" scope="session" value='<%=(int)session.getAttribute("teacherId") %>'></c:set>
                    <c:forEach items="${dao.getCoursesByTeacherId(teacherId)}" var="c">
                        <div class="nav-item dropdown">
                            <a onclick="loadClasses(${c.id}, '<%=session.getAttribute("username") %>')" href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-file-alt me-2"></i>${c.rollId}</a>
                            <div id="aaa${c.id}" class="dropdown-menu bg-transparent border-0">
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </nav>
        </div>
    </body>
</html>
