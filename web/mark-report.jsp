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

                <!-- Mark Report Start -->
                <div class="container-fluid">
                    <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                        <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                            <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                                <div class="d-flex align-items-center justify-content-between mb-3">
                                    <a href="#" class="">
                                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>SRMS</h3>
                                    </a>
                                    <h3>Mark Report</h3>
                                </div>
                                <!-- Roll ID Input Form Start -->
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput" name="rollId" placeholder="rollId">
                                    <label for="floatingInput">Roll ID</label>
                                </div>
                                <button type="submit" id="submit" class="btn btn-primary py-3 w-100 mb-4" onclick="submitBtn()">Submit</button>
                                <!-- Roll ID Input Form End -->

                                <!--Mark Report Modal Start-->
                                <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Mark Report</h5>
                                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" aria-label="Close">
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

                                <p class="text-center mb-0">Teacher? <a href="login">Sign In</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Mark Report End -->
            </div>

            <!--Footer Start-->
        <jsp:include page="components/footer.jsp"></jsp:include>
        <!--Footer End-->


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
        <script>
                                    function submitBtn() {
                                        var rollId = $("#floatingInput").val();
                                        console.log(rollId);
                                        $.ajax({
                                            url: 'mark-report',
                                            data: {'rollId': rollId},
                                            type: "POST",
                                            success: function (text) {
                                                document.getElementById("body").innerHTML = text;
                                                $('#reportModal').modal('show'); // Open the modal
                                            }
                                        });
                                    }
        </script>
    </body>

</html>