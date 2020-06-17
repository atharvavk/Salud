/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author HP
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Dao.UserDao;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "login", urlPatterns = { "/login" } ,asyncSupported = true)
public class Login_dispatcher extends HttpServlet {


    static void done(AsyncContext asyncContext) {
        asyncContext.complete() ; 
    }

    
    
    
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            // getting username pwd
            String uname = request.getParameter("email");
            String pwd = request.getParameter("password");
            UserDao x = new UserDao();
            User u = x.check(uname, pwd);
            
            //asyncContext = request.getAsyncContext() ; 

            // here "incorrect_password" is the default name in dao
            if (!u.getName().equals("incorrect_password")) {
                HttpSession session = request.getSession();
                session.setAttribute("User", u);
                // checking if user is admin
                if (x.isAdmin(uname, pwd)) {
                   // asyncContext.complete() ; 
                    response.sendRedirect("admin/index.jsp");
                }
                
                //asyncContext.complete() ; 
                response.sendRedirect("products.jsp");
                
                
            } else {
                //asyncContext.complete() ; 
                response.sendRedirect("login.jsp?error=incorrect");
            }

        } catch (Exception e) {
            // TODO: handle exception
            //asyncContext.complete() ; 
            e.getMessage();
        }
    } 
}
