/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.ResultsDAO;
import dal.TeachingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author trant
 */
@WebServlet(name = "UpdateResultServlet", urlPatterns = {"/update-result"})
public class UpdateResultServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateResultServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateResultServlet at " + request.getContextPath() + "</h1>");
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
            System.out.println(rs1);
            System.out.println(rs2);
            System.out.println(rs3);
            System.out.println(rs4);
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

}
