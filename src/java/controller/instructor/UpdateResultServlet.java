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
@WebServlet(name = "UpdateResultServlet", urlPatterns = {"/update-result"})
public class UpdateResultServlet extends BasedRequiredAuthenticationController {

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
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int cid = Integer.parseInt(request.getParameter("cid"));
            int sid = Integer.parseInt(request.getParameter("sid"));
            Float rs1 = parseFloatOrNull(request.getParameter("rs1"));
            Float rs2 = parseFloatOrNull(request.getParameter("rs2"));
            Float rs3 = parseFloatOrNull(request.getParameter("rs3"));
            Float rs4 = parseFloatOrNull(request.getParameter("rs4"));
            rdao.updateResult(rs1, rs2, rs3, rs4, id);
            int a = tdao.getTeachingIdByCourseAndStudent(cid, sid);
            response.sendRedirect("results?id=" + a);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private Float parseFloatOrNull(String value) {
        if (value == null || value.isEmpty()) {
            return null;
        }

        try {
            return Float.parseFloat(value);
        } catch (NumberFormatException e) {
            // Handle the case where the value is not a valid float
            // You can log an error, display an error message, or perform any other necessary actions
            System.out.println(e);
            return null;
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
