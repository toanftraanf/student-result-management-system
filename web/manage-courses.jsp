<%-- 
    Document   : manage-courses
    Created on : Jul 18, 2023, 2:31:50 PM
    Author     : trant
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>SRSM - Manage Courses</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-fluid position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <jsp:include page="components/spinner.jsp"></jsp:include>
                <!-- Spinner End -->


                <!-- Sidebar Start -->
            <jsp:include page="components/sidebar.jsp"></jsp:include>
                <!-- Sidebar End -->


                <!-- Content Start -->
                <div class="content">
                    <!-- Navbar Start -->
                <jsp:include page="components/navbar.jsp"></jsp:include>
                    <!-- Navbar End -->

                    <!-- Table Start -->
                    <div class="container-fluid pt-4 px-4">
                        <div class="col-auto">
                            <div class="bg-light rounded h-100 p-4">
                                <div class="m-n2">
                                    <button data-bs-toggle="modal" data-bs-target="#addCourseModal" type="button" class="btn btn-primary m-2"><i class="fa fa-home me-2"></i>Add new course</button>
                                    <!-- Add Modal Start -->
                                    <div class="modal fade" id="addCourseModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Add a new course</h5>
                                                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form action="add-course" method="POST">
                                                    <div class="modal-body">
                                                        <div class="form-floating mb-3">
                                                            <input type="text" name="rollId" class="form-control" id="floatingRollId"
                                                                   placeholder="Roll ID">
                                                            <label for="floatingRollId">Roll ID</label>
                                                        </div>
                                                        <div class="form-floating mb-3">
                                                            <input type="text" name="name" class="form-control" id="floatingCourseName"
                                                                   placeholder="Name">
                                                            <label for="floatingCourseName">Name</label>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary" >Add</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Add Modal End -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid pt-4 px-4">
                        <div class="row g-4">            
                            <div class="col-12">
                                <div class="bg-light rounded h-100 p-4">
                                    <h6 class="mb-4">Manage Courses</h6>
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="table1">
                                            <thead>
                                            <%
                                                int i = 1;
                                            %>
                                            <tr class="text-dark">
                                                <th scope="col">No.</th>
                                                <th scope="col">Roll ID</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody id="table-body">
                                            <c:forEach items="${courses}" var="c">
                                                <tr>
                                                    <td><%= i %></td>
                                                    <td>${c.rollId}</td>
                                                    <td>${c.name}</td>
                                                    <td>#</td>
                                                    <td>
                                                        <div class="btn-group" role="group">
                                                            <button data-bs-toggle="modal" data-bs-target="#updateCourseModal${c.id}" type="button" class="btn btn-outline-primary">Edit</button>
                                                            <button onclick="openDeleteModalAdmin(${c.id}, 'courses')" type="button" class="btn btn-outline-primary">Delete</button>
                                                            <!--Delete Modal Start-->
                                                            <jsp:include page="components/delete_modal.jsp"></jsp:include>
                                                                <!--Delete Modal End-->

                                                                <!--Update Modal Start-->
                                                                <div class="modal fade" id="updateCourseModal${c.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Update Courses</h5>
                                                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <form action="update-course?id=${c.id}" method="POST">
                                                                            <div class="modal-body">
                                                                                <table border="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td><label for="courseRollId">Roll ID:</label></td>
                                                                                            <td><input class="form-control" type="text"  name="rollId" value="${c.rollId}" required></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td><label for="courseName">Course Name:</label></td>
                                                                                            <td><input class="form-control" type="text" name="name" value="${c.name}" required></td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                <button type="submit" class="btn btn-primary">Update</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--Update Modal End-->
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%
                                                    i++;
                                                %>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Table End -->

                <!-- Footer Start -->
                <jsp:include page="components/footer.jsp"></jsp:include>
                <!-- Footer End -->
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Page level plugins -->
        <link href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
        <script src="js/mydatatables.js" type="text/javascript"></script>


        <!-- Template Javascript -->
        <script src="js/main.js"></script>

    </body>

</html>
