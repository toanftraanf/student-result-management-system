/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.instructor;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.AccountsDAO;
import dal.CoursesDAO;
import dal.TeachingDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DashboardServlet", urlPatterns = {"/home"})
public class HomeServlet extends BasedRequiredAuthenticationController {
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, Accounts account) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, Accounts account) throws ServletException, IOException {
        AccountsDAO adao = new AccountsDAO();
        CoursesDAO cdao = new CoursesDAO();
        TeachingDAO tdao = new TeachingDAO();

        HttpSession session = request.getSession();
        // If the logged-in user is a teacher, retrieve the list of courses they teach
        int teacherId = (int) session.getAttribute("teacherId"); // Assuming you have a method to retrieve the teacher ID
        List<Courses> courses = cdao.getCoursesByTeacherId(teacherId);
        //Set sidebar's attributes
        request.setAttribute("courses", courses);
        List<Teaching> teaching = tdao.getAllTeaching();
        request.setAttribute("teaching", teaching);
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
