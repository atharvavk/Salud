package controller;

import Dao.CartDao;
import Dao.ProductsDao;
import Model.User;
import Model.cart;
import Model.product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.Null;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "Allproducts" ,urlPatterns = { "/store" })
public class Allproducts extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductsDao pd=new ProductsDao();
        CartDao cd=new CartDao();
        HttpSession session=request.getSession();
        try {
            ArrayList<product> products= pd.getAllProducts();
            if(session.getAttribute("User")!=null){
                User u= (User)session.getAttribute("User");
                int uid=u.getId();
                for (product temp:products ){
                    if(cd.isincart(uid,temp.getId())){
                        temp.setIncart(true);
                    }
                }
            }
            request.setAttribute("products",products);
            RequestDispatcher rd = request.getRequestDispatcher("store.jsp");
            rd.forward(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
