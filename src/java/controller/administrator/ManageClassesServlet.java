/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.administrator;

import controller.authentication.BasedRequiredAdminAuthenticationController;
import dal.ClassesDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Accounts;
import model.Classes;

/**
 *
 * @author trant
 */
@WebServlet(name = "ManageClassesServlet", urlPatterns = {"/manage-classes"})
public class ManageClassesServlet extends BasedRequiredAdminAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException {
        ClassesDAO cdao = new ClassesDAO();
        List<Classes> classes = cdao.getAllClasses();
        req.setAttribute("classes", classes);
        req.getRequestDispatcher("manage-classes.jsp").forward(req, resp);
    }

}
