<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="rdao" class="dal.ResultsDAO" scope="request" ></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>RESULTS</title>
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
            <link href="toast.style.min.css" rel="stylesheet">


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
                        <div class="row g-4">            
                            <div class="col-12">
                                <div class="bg-light rounded h-100 p-4">
                                    <h6 class="mb-4">Responsive Table</h6>
                                    <div class="table-responsive">
                                        <table class="table" id="table1">
                                            <thead>
                                                <tr>
                                                    <th scope="col">RollID</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Info</th>
                                                    <th scope="col">Progress Test (20%)</th>
                                                    <th scope="col">Workshop (20%)</th>
                                                    <th scope="col">Practical Exam (30%)</th>
                                                    <th scope="col">Final Exam (30%)</th>
                                                    <th scope="col">Total</th>
                                                    <th scope="col">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody id="table-body">
                                            <c:forEach items="${rdao.getResults(courseId, classId)}" var="c">
                                                <c:set var="total" value="${c.result1*0.2+c.result2*0.2+c.result3*0.3+c.result4*0.3}"/>
                                                <fmt:formatNumber var="formattedTotal" value="${total}" pattern="#0.0" />
                                                <tr>
                                                    <td scope="row">${c.students.rollId}</td>
                                                    <td>${c.students.name}</td>
                                                    <td>
                                                        <a href="#" data-bs-toggle="modal" data-bs-target="#infoModal${c.students.id}">
                                                            <i class="fa fa-eye"></i>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        ${c.result1 == null ? "-":c.result1}
                                                    </td>
                                                    <td>
                                                        ${c.result2 == null ? "-":c.result2}
                                                    </td>
                                                    <td>
                                                        ${c.result3 == null ? "-":c.result3}
                                                    </td>
                                                    <td>
                                                        ${c.result4 == null ? "-":c.result4}
                                                    </td>
                                                    <td scope="row" style="color:${formattedTotal >= 5.0 ? 'green' : 'red'}">
                                                        ${formattedTotal}
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-square btn-outline-warning" data-toggle="tooltip" data-placement="top" title="Update" href="#" onclick="openUpdateModal(${c.id}, ${c.courses.id}, ${c.students.id})">
                                                            <i class="fa fa-edit"></i>
                                                        </a>
                                                        <!-- Update Result Modal Start -->
                                                        <div class="modal fade" id="updateModal${c.students.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Update Results</h5>
                                                                        <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <form action="update-result?id=${c.id}&cid=${c.courses.id}&sid=${c.students.id}" method="POST">
                                                                        <div class="modal-body">
                                                                            <table border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td><label for="studentId">Roll ID:</label></td>
                                                                                        <td><input type="text"  name="rollId" value="${c.students.rollId}" readonly></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><label for="studentName">Student Name:</label></td>
                                                                                        <td><input type="text" name="studentName" value="${c.students.name}" readonly></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><label for="progressTest">Progress Test Result:</label></td>
                                                                                        <td><input type="number" min="0.0" max="10.0" step="0.1" name="rs1" value="${c.result1}"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><label for="practicalExam">Practical Exam Result:</label></td>
                                                                                        <td><input type="number" min="0.0" max="10.0" step="0.1" name="rs2" value="${c.result2}"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><label for="workshop">Workshop Result:</label></td>
                                                                                        <td><input type="number" min="0.0" max="10.0" step="0.1" name="rs3" value="${c.result3}"></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td><label for="finalExam">Final Exam Result:</label></td>
                                                                                        <td><input type="number" min="0.0" max="10.0" step="0.1" name="rs4" value="${c.result4}"></td>
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
                                                        <!-- Update Result Modal End -->

                                                        <a class="btn btn-square btn-outline-danger" data-toggle="tooltip" data-placement="top" title="Delete" href="#" onclick="openDeleteResultModal(${c.id}, ${c.courses.id}, ${c.students.id})">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                        <!-- Delete Result Modal Start -->
                                                        <jsp:include page="components/delete_modal.jsp"></jsp:include>
                                                            <!-- Delete Result Modal End -->
                                                        </td>
                                                    </tr>

                                                    <!-- Student's Information Modal Start -->
                                                <div class="modal fade" id="infoModal${c.students.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Student's Information</h5>
                                                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="row">
                                                                <div class="col-md-6 ml-auto">Roll ID: </div>
                                                                <div class="col-md-6 ml-auto">${c.students.rollId}</div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6 ml-auto">Name: </div>
                                                                <div class="col-md-6 ml-auto">${c.students.name}</div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6 ml-auto">Date of Birth: </div>
                                                                <div class="col-md-6 ml-auto">${c.students.dob}</div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6 ml-auto">Gender: </div>
                                                                <div class="col-md-6 ml-auto">${c.students.sex == 1 ? "Male" : "Female"}</div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6 ml-auto">Address: </div>
                                                                <div class="col-md-6 ml-auto">${c.students.address}</div>
                                                            </div> 
                                                            <div class="row">
                                                                <div class="col-md-6 ml-auto">Class: </div>
                                                                <div class="col-md-6 ml-auto">${c.students.classes.name}</div>
                                                            </div> 
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Student's Information Modal End -->
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <!-- Calculate average result for the whole class -->
                                            <c:set var="totalStudents" value="${rdao.getResults(courseId, classId).size()}" />
                                            <c:set var="totalRs1" value="0" />
                                            <c:set var="totalRs2" value="0" />
                                            <c:set var="totalRs3" value="0" />
                                            <c:set var="totalRs4" value="0" />
                                            <c:set var="totalAverage" value="0" />
                                            <c:forEach items="${rdao.getResults(courseId, classId)}" var="c">
                                                <c:set var="totalRs1" value="${totalRs1 + c.result1}" />
                                                <c:set var="totalRs2" value="${totalRs2 + c.result2}" />
                                                <c:set var="totalRs3" value="${totalRs3 + c.result3}" />
                                                <c:set var="totalRs4" value="${totalRs4 + c.result4}" />
                                                <c:set var="totalAverage" value="${totalAverage + c.result1*0.2+c.result2*0.2+c.result3*0.3+c.result4*0.3}" />
                                            </c:forEach>
                                            <c:set var="aveRs1" value="${totalRs1 / totalStudents}" />
                                            <c:set var="aveRs2" value="${totalRs2 / totalStudents}" />
                                            <c:set var="aveRs3" value="${totalRs3 / totalStudents}" />
                                            <c:set var="aveRs4" value="${totalRs4 / totalStudents}" />
                                            <c:set var="aveTotal" value="${totalAverage / totalStudents}" />
                                            <fmt:formatNumber var="formattedAveRs1" value="${aveRs1}" pattern="#0.0" />
                                            <fmt:formatNumber var="formattedAveRs2" value="${aveRs2}" pattern="#0.0" />
                                            <fmt:formatNumber var="formattedAveRs3" value="${aveRs3}" pattern="#0.0" />
                                            <fmt:formatNumber var="formattedAveRs4" value="${aveRs4}" pattern="#0.0" />
                                            <fmt:formatNumber var="formattedAveTotal" value="${aveTotal}" pattern="#0.0" />
                                            <tr class="table-primary">
                                                <th colspan="3" scope="row">Average</td>
                                                <th scope="row">${formattedAveRs1}</th>
                                                <th scope="row">${formattedAveRs2}</th>
                                                <th scope="row">${formattedAveRs3}</th>
                                                <th scope="row">${formattedAveRs4}</th>
                                                <th scope="row">${formattedAveTotal}</th>
                                                <td></td>
                                            </tr>
                                        </tfoot>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="js/popup.js"></script>

        <!-- Page level plugins -->
        <link href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
        <script src="js/mydatatables.js" type="text/javascript"></script>

    </body>
</html>