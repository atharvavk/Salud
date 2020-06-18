package controller;

import Dao.CartDao;
import Dao.OrderDao;
import Model.User;
import Model.cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ConfirmOrder",urlPatterns = "/confirm")
public class ConfirmOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        User u=(User)session.getAttribute("User");
        String Address=request.getParameter("address");
        int id=u.getId();
        CartDao cd=new CartDao();
        OrderDao od =new OrderDao();
        ArrayList<cart> ca = null;
        try {
            ca = cd.getall(id);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        for (cart c:ca){
            try {
                od.insert(id,c.getProductid(),c.getQuantity(),Address);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        response.sendRedirect("cart");
    }
}
