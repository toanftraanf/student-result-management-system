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
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">RollID</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Progress Test (20%)</th>
                                                <th scope="col">Workshop (20%)</th>
                                                <th scope="col">Practical Exam (30%)</th>
                                                <th scope="col">Final Exam (30%)</th>
                                                <th scope="col">Total</th>
                                                <th scope="col">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${rdao.getResults(courseId, classId)}" var="c">
                                                <c:set var="total" value="${c.result1*0.2+c.result2*0.2+c.result3*0.3+c.result4*0.3}"/>
                                                <fmt:formatNumber var="formattedTotal" value="${total}" pattern="#0.0" />
                                                <tr>
                                                    <th scope="row">${c.students.rollId}</th>
                                                    <td>${c.students.name}</td>
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
                                                    <td style="color:${formattedTotal >= 5.0 ? 'green' : 'red'}">
                                                        ${formattedTotal}
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-square btn-outline-warning" href=""><i class="fa fa-edit"></i></a>
                                                        <a onclick="onMess(${c.id})" class="btn btn-square btn-outline-danger" href=""><i class="fa fa-trash"></i></a>
                                                    </td>
                                                </tr>
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

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="js/popup.js"></script>
        <script>
            function onMess(id) {
            if (confirm("Are you sure to delete this student's grades?")) {
                window.location.href = "delete-grade?id=" + id;
            }
        }
        </script>
    </body>

</html>