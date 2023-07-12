/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.instructor;

import controller.authentication.BasedRequiredAuthenticationController;
import dal.ResultsDAO;
import dal.TeachingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Accounts;

/**
 *
 * @author trant
 */
@WebServlet(name = "DeleteResultServlet", urlPatterns = {"/delete-result"})
public class DeleteResultServlet extends BasedRequiredAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Accounts account)
            throws ServletException, IOException {
        ResultsDAO rdao = new ResultsDAO();
        TeachingDAO tdao = new TeachingDAO();
        int id = Integer.parseInt(request.getParameter("id"));
        int cid = Integer.parseInt(request.getParameter("cid"));
        int sid = Integer.parseInt(request.getParameter("sid"));
        int a = tdao.getTeachingIdByCourseAndStudent(cid, sid);
        rdao.deleteResult(id);
        response.sendRedirect("results?id=" + a);
    }

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
