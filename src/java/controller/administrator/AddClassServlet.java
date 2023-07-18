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
import model.Accounts;

/**
 *
 * @author trant
 */
@WebServlet(name = "AddClassServlet", urlPatterns = {"/add-class"})
public class AddClassServlet extends BasedRequiredAdminAuthenticationController {

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
        ClassesDAO cdao = new ClassesDAO();
        String className = req.getParameter("className");
        cdao.addClass(className);
        resp.sendRedirect("manage-classes");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException {
    }

}
