/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.administrator;

import controller.authentication.BasedRequiredAdminAuthenticationController;
import dal.CoursesDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Accounts;
import model.Courses;

/**
 *
 * @author trant
 */
@WebServlet(name="ManageCoursesServlet", urlPatterns={"/manage-courses"})
public class ManageCoursesServlet extends BasedRequiredAdminAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException {
        CoursesDAO cdao = new CoursesDAO();
        List<Courses> courses = cdao.getAllCourses();
        req.setAttribute("courses", courses);
        req.getRequestDispatcher("manage-courses.jsp").forward(req, resp);
    } 

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
