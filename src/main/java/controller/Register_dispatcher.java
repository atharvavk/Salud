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


import Dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "register", urlPatterns = { "/register" } ,asyncSupported = true)
public class Register_dispatcher extends HttpServlet {
    
    
    static void done(AsyncContext asyncContext) {
        asyncContext.complete() ; 
    }
    
     protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            // getting all the input feilds
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            String email = request.getParameter("email");
            String number = request.getParameter("number");
            String pwd = request.getParameter("password");
            UserDao x = new UserDao();
            // checking if the user is alredy taken
            if (x.already(email, number)) {
                response.sendRedirect("register.jsp?error=already");
            } else {
                System.out.println("not duplicate");
                String fullname = firstName + " " + lastName;
                // here insert inserts into the sql table
                if (x.insert(fullname, email, number, pwd)) {
                    response.sendRedirect("login.jsp");
                } else {
                    System.out.println("not Done");
                }
            }

        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    
    }
}
