/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountsDAO;
import dal.CoursesDAO;
import dal.ResultsDAO;
import dal.TeachingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Courses;
import model.Results;

/**
 *
 * @author trant
 */
@WebServlet(name = "ResultsServlet", urlPatterns = {"/results"})
public class ResultsServlet extends HttpServlet {

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ResultsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ResultsServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    int id;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        // If the logged-in user is a teacher, retrieve the list of courses they teach
        int teacherId = adao.getTeacherId((String) session.getAttribute("username")); // Assuming you have a method to retrieve the teacher ID
        List<Courses> courses = cdao.getCoursesByTeacherId(teacherId); // Replace this with your actual method to get the courses by teacher ID
        request.setAttribute("courses", courses);
        try {
            id = Integer.parseInt(request.getParameter("id"));
            int courseId = tdao.getCourseIdByTeachingId(id);
            int classId = tdao.getClassIdByTeachingId(id);
            List<Results> list = rdao.getResults(courseId, classId);
            request.setAttribute("grade", list);
            request.getRequestDispatcher("results.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
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
        processRequest(request, response);
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
