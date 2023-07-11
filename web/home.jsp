<%-- 
    Document   : home
    Created on : Jul 10, 2023, 4:31:57 PM
    Author     : trant
--%>
<jsp:useBean id="rdao" class="dal.ResultsDAO" scope="request" ></jsp:useBean>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>STUDENT RESULT MANAGEMENT SYSTEM</title>
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
            <jsp:include page="/components/spinner.jsp"></jsp:include>
                <!-- Spinner End -->


                <!-- Sign In Start -->
                <div class="container-fluid">
                    <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                        <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                            <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                                <div class="d-flex align-items-center justify-content-between mb-3">
                                    <a href="index.html" class="">
                                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>SRMS</h3>
                                    </a>
                                    <h3>Mark Report</h3>
                                </div>

                                <!-- Login failed alert -->
                                <!--                            <c:if test="${not empty param.error}">
                                                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                                <i class="fa fa-exclamation-circle me-2"></i>${param.error}
                                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                                            </div>
                            </c:if>-->

                            <!-- Login Form Start -->
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" name="rollId" placeholder="rollId">
                                <label for="floatingInput">Roll ID</label>
                            </div>

                            <button type="submit" id="submit" class="btn btn-primary py-3 w-100 mb-4" data-bs-toggle="modal" data-bs-target="#reportModal">Submit</button>

                            <!--Mark Report Modal Start-->
                            <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Mark Report</h5>
                                            <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <form action="" method="POST">
                                            <div class="modal-body" id="body">

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!--Mark Report Modal End-->

                            <!-- Login Form End -->
                            <p class="text-center mb-0">Teacher? <a href="login">Sign In</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sign In End -->
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

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script type="text/javascript">
            $("#submit").click(function () {
                var rollId = $("#floatingInput").val();
                var results = ${rdao.getResultsByStudentRollId(rollId)}; // Assuming this returns an array of results
                console.log(rollId);
                console.log(results);
                var str = '<div class="d-flex align-items-start">' +
                        '<div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">';

                results.forEach(function (c) {
                    str += '<button class="nav-link" id="v-pills-tab-' + c.courses.id + '" data-bs-toggle="pill" data-bs-target="#v-pills-' + c.courses.id + '" type="button" role="tab" aria-controls="v-pills-' + c.courses.id + '" aria-selected="false">' + c.courses.rollId + '</button>';
                });

                str += '</div>' +
                        '<div class="tab-content" id="v-pills-tabContent">';

                results.forEach(function (c) {
                    str += '<div class="tab-pane fade" id="v-pills-' + c.courses.id + '" role="tabpanel" aria-labelledby="v-pills-tab-' + c.courses.id + '">' +
                            '<table border="0">' +
                            '<tbody>' +
                            '<tr>' +
                            '<td><label for="studentId">Roll ID:</label></td>' +
                            '<td><input type="text" name="rollId" value="' + c.students.rollId + '" readonly></td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td><label for="studentName">Student Name:</label></td>' +
                            '<td><input type="text" name="studentName" value="' + c.students.name + '" readonly></td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td><label for="progressTest">Progress Test Result:</label></td>' +
                            '<td><input type="number" min="0.0" max="10.0" step="0.1" name="rs1" value="' + c.result1 + '"></td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td><label for="practicalExam">Practical Exam Result:</label></td>' +
                            '<td><input type="number" min="0.0" max="10.0" step="0.1" name="rs2" value="' + c.result2 + '"></td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td><label for="workshop">Workshop Result:</label></td>' +
                            '<td><input type="number" min="0.0" max="10.0" step="0.1" name="rs3" value="' + c.result3 + '"></td>' +
                            '</tr>' +
                            '<tr>' +
                            '<td><label for="finalExam">Final Exam Result:</label></td>' +
                            '<td><input type="number" min="0.0" max="10.0" step="0.1" name="rs4" value="' + c.result4 + '"></td>' +
                            '</tr>' +
                            '</tbody>' +
                            '</table>' +
                            '</div>';
                });

                str += '</div>' +
                        '</div>';
                document.getElementById("body").innerHTML = str;
            });
        </script>
    </body>

</html>