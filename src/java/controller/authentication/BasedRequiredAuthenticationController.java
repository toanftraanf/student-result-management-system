/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.authentication;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Accounts;

/**
 *
 * @author admin
 */
public abstract class BasedRequiredAuthenticationController extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        Accounts user = (Accounts) request.getSession().getAttribute("account");
        if(user != null){
            if(user.getRole()==0){
                return true;
            }
        }
        return false;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthenticated(req))
        {
            //do business
            doPost(req, resp, (Accounts) req.getSession().getAttribute("account"));
        }
        else
        {
            resp.sendRedirect("login");
        }
    }
    
     protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(isAuthenticated(req))
        {
            //do business
            doGet(req, resp, (Accounts) req.getSession().getAttribute("account"));
        }
        else
        {
            resp.sendRedirect("login");
        }
    }
    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp, Accounts account) throws ServletException, IOException;

}