package controller;

import Dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.AsyncContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;

@WebServlet(asyncSupported = true)
public class Register extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException
    {
        AsyncContext asyncContext = request.startAsync(request, response);
        asyncContext.setTimeout(10 * 60 * 1000);
        //addRemoteClient(new RemoteClient(asyncContext));
        ServletContext servletContext = getServletContext();
        RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher("/register");
        //request.setAttribute("async", asyncContext);
        requestDispatcher.forward(asyncContext.getRequest(),asyncContext.getResponse() );
        
        Register_dispatcher.done(asyncContext) ; 
        
        
        
    } 
}
