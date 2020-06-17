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
import javax.servlet.AsyncContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;

/**
 *
 * for handling the login
 * 
 * @author risha
 */
@WebServlet(asyncSupported = true)
public class login extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException
    {
        AsyncContext asyncContext = request.startAsync(request, response);
        //asyncContext.setTimeout(10 * 60 * 1000);
        //addRemoteClient(new RemoteClient(asyncContext));
        ServletContext servletContext = getServletContext();
        RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher("/login");
        //request.setAttribute("async", asyncContext);
        requestDispatcher.forward(asyncContext.getRequest() , asyncContext.getResponse()); 
        
        Login_dispatcher.done(asyncContext) ; 
        
        
    } 



}
