/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
                for (Results c : list) {
                    out.println("<button class='nav-link' id='v-pills-tab-" + c.getCourses().getId()
                            + "' data-bs-toggle='pill' data-bs-target='#v-pills-" + c.getCourses().getId()
                            + "' type='button' role='tab' aria-controls='v-pills-" + c.getCourses().getId()
                            + "' aria-selected='false'>" + c.getCourses().getRollId()
                            + "</button>");
                }
                out.println("</div>"
                        + "<div class='tab-content' id='v-pills-tabContent'>");
                for (Results c : list) {
                    Double total = c.getResult1()*0.2+c.getResult2()*0.2+c.getResult3()*0.3+c.getResult4()*0.3;
                    out.println("<div class='tab-pane fade' id='v-pills-" + c.getCourses().getId() + "' role='tabpanel' aria-labelledby='v-pills-tab-" + c.getCourses().getId() + "'>"
                            + "<table border='0'>"
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
                }
                out.println("</div>"
                        + "</div>");
            } else {
                out.println("<div class=\"alert alert-danger\" role=\"alert\">\n"
                        + "                                Roll ID does not exist!\n"
                        + "                            </div>");
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
