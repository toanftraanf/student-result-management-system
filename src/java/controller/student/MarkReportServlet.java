/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import dal.ResultsDAO;
import dal.StudentsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Results;
import model.Students;

/**
 *
 * @author trant
 */
@WebServlet(name = "MarkReportServlet", urlPatterns = {"/mark-report"})
public class MarkReportServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.'>
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ResultsDAO rdao = new ResultsDAO();
        StudentsDAO sdao = new StudentsDAO();
        String rollId = request.getParameter("rollId");
        Students student = sdao.getStudentByRollId(rollId);

        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if (student != null) {
                List<Results> list = rdao.getResultsByStudentRollId(rollId);
                out.println("<div class='d-flex align-items-start'>"
                        + "<div class='nav flex-column nav-pills me-3' id='v-pills-tab' role='tablist' aria-orientation='vertical'>");
                int index = 0;
                for (Results d : list) {
                    String courseId = "course-" + d.getCourses().getId();
                    String tabId = "tab-" + d.getCourses().getId();
                    String isActive = (index == 0) ? "active" : "";
                    out.println("<button class='nav-link " + isActive + "' id='" + tabId
                            + "-tab' data-bs-toggle='pill' data-bs-target='#" + tabId
                            + "' type='button' role='tab' aria-controls='" + tabId
                            + "' aria-selected='false'>" + d.getCourses().getRollId()
                            + "</button>");
                    index++;
                }
                out.println("</div>"
                        + "<div class='tab-content' id='v-pills-tabContent'>");
                index = 0;
                for (Results c : list) {
                    String courseId = "course-" + c.getCourses().getId();
                    String tabId = "tab-" + c.getCourses().getId();
                    String isActive = (index == 0) ? "show active" : "";  // Add "show active" classes here
                    Double result1 = (c.getResult1() != null) ? c.getResult1() : 0.0;
                    Double result2 = (c.getResult2() != null) ? c.getResult2() : 0.0;
                    Double result3 = (c.getResult3() != null) ? c.getResult3() : 0.0;
                    Double result4 = (c.getResult4() != null) ? c.getResult4() : 0.0;
                    Double total = result1 * 0.2 + result2 * 0.2 + result3 * 0.3 + result4 * 0.3;

                    out.println("<div class='tab-pane fade " + isActive + "' id='" + tabId + "' role='tabpanel' aria-labelledby='" + tabId + "-tab'>"
                            + "<table class='table'>"
                            + "<tbody>"
                            + "<tr>"
                            + "<td><label for='studentId'>Roll ID:</label></td>"
                            + "<td>" + c.getStudents().getRollId() + "</td>"
                            + "</tr>"
                            + "<tr>"
                            + "<td><label for='studentName'>Student Name:</label></td>"
                            + "<td>" + c.getStudents().getName() + "</td>"
                            + "</tr>"
                            + "<tr>"
                            + "<td><label for='progressTest'>Progress Test:</label></td>"
                            + "<td>" + (c.getResult1() != null ? c.getResult1() : "") + "</td>"
                            + "</tr>"
                            + "<tr>"
                            + "<td><label for='practicalExam'>Practical Exam:</label></td>"
                            + "<td>" + (c.getResult2() != null ? c.getResult2() : "") + "</td>"
                            + "</tr>"
                            + "<tr>"
                            + "<td><label for='workshop'>Workshop:</label></td>"
                            + "<td>" + (c.getResult3() != null ? c.getResult3() : "") + "</td>"
                            + "</tr>"
                            + "<tr>"
                            + "<td><label for='finalExam'>Final Exam:</label></td>"
                            + "<td>" + (c.getResult4() != null ? c.getResult4() : "") + "</td>"
                            + "</tr>"
                            + "<tr>"
                            + "<td><label for='total'>Total:</label></td>"
                            + "<td>" + String.format("%.1f", total) + "</td>"
                            + "</tr>"
                            + "</tbody>"
                            + "</table>"
                            + "</div>");
                    index++;
                }
                out.println("</div>"
                        + "</div>");
            } else {
                out.println("<div class=\"alert alert-danger\" role=\"alert\">\n"
                        + "Roll ID does not exist!\n"
                        + "</div>");
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
