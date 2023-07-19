/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.administrator;

import controller.authentication.BasedRequiredAdminAuthenticationController;
import dal.TeachersDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Accounts;
import model.Teachers;

/**
 *
 * @author trant
 */
@WebServlet(name="ManageTeachers", urlPatterns={"/manage-teachers"})
public class ManageTeachers extends BasedRequiredAdminAuthenticationController {
   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException {
        TeachersDAO tdao = new TeachersDAO();
        List<Teachers> list = tdao.getAllTeachers();
        req.setAttribute("teachers", tdao);
        req.getRequestDispatcher("manage-teachers.jsp").forward(req, resp);
    }

}
