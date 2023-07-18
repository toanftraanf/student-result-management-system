/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.instructor;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.AccountsDAO;
import dal.CoursesDAO;
import dal.ResultsDAO;
import dal.TeachingDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Accounts;
import model.Courses;
import model.Teaching;

/**
 *
 * @author trant
 */
@WebServlet(name = "ResultsServlet", urlPatterns = {"/results"})
public class ResultsServlet extends BasedRequiredAuthenticationController {

    AccountsDAO adao = new AccountsDAO();
    CoursesDAO cdao = new CoursesDAO();
    TeachingDAO tdao = new TeachingDAO();
    ResultsDAO rdao = new ResultsDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    int id;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Accounts account)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // If the logged-in user is a teacher, retrieve the list of courses they teach
        int teacherId = (int) session.getAttribute("teacherId"); // Assuming you have a method to retrieve the teacher ID
        List<Courses> courses = cdao.getCoursesByTeacherId(teacherId); // Replace this with your actual method to get the courses by teacher ID
        request.setAttribute("courses", courses);
        try {
            id = Integer.parseInt(request.getParameter("id"));
            int courseId = tdao.getCourseIdByTeachingId(id);
            int classId = tdao.getClassIdByTeachingId(id);
            request.setAttribute("courseId", courseId);
            request.setAttribute("classId", classId);
            List<Teaching> teaching = tdao.getAllTeaching();
            request.setAttribute("teaching", teaching);
            request.getRequestDispatcher("results.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException {
        processRequest(req, resp, account);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException {
        processRequest(req, resp, account);
    }

}
