package controller;

import Dao.CartDao;
import Dao.OrderDao;
import Model.Order;
import Model.User;
import Model.cart;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "Cart",urlPatterns = "/cart")
public class Cart extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CartDao cd=new CartDao();
        OrderDao od=new OrderDao();
        HttpSession session=request.getSession();
        User u=(User)session.getAttribute("User");
        System.out.println(u);
        if(u==null){
            RequestDispatcher rd =request.getRequestDispatcher("login.jsp");
            rd.forward(request,response);
        }
        int id =u.getId();
        try {
            ArrayList<cart> ca = cd.getall(id);
            System.out.println("before getall");
            ArrayList<Order> oa=od.getallid(id);
            for (Order abc:oa) {
                System.out.println("hiii");
                System.out.println(abc.getId());
                System.out.println(abc.getProductname());
                System.out.println(abc.getPrice());
                System.out.println(abc.getQuantity());
            }
            session.setAttribute("cartproducts",ca);
            request.setAttribute("prevorder",oa);
            RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
            rd.forward(request, response);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
