/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.*;
import Model.User;

/**
 *
 * @author risha
 */
@WebServlet(name = "login", urlPatterns = { "/login" })
public class login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String uname = request.getParameter("email");
            String pwd = request.getParameter("password");
            UserDao x = new UserDao();
            User u =x.check(uname,pwd);


            if(!u.getName().equals("incorrect_password")){
                HttpSession session=request.getSession();
                session.setAttribute("User",u);
                if(x.isAdmin(uname,pwd)){
                    response.sendRedirect("admin/index.jsp");
                }
                response.sendRedirect("products.jsp");
            }
            else{
                response.sendRedirect("login.jsp?error=incorrect");
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.getMessage();
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
