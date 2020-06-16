package controller;

import Dao.CartDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddCart",urlPatterns = "/addcart")
public class Addcart extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid= Integer.parseInt(request.getParameter("prodId"));
        int uid= Integer.parseInt(request.getParameter("userId"));
        CartDao cd =new CartDao();
        try {
            cd.insert(uid,pid,1);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
