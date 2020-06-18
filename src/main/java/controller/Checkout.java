package controller;

import Dao.CartDao;
import Dao.ProductsDao;
import Model.User;
import Model.cart;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet(name = "Checkout",urlPatterns = "/checkout")
public class Checkout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("inside checkout servelet");
        HttpSession session=request.getSession();
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        CartDao cd =new CartDao();
        User u=(User)session.getAttribute("User");
        int id=u.getId();
        ArrayList<cart> ca= null;
        try {
            ca = cd.getall(id);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        JSONObject retval =new JSONObject();
        JSONArray wrong=new JSONArray();
        ProductsDao pd=new ProductsDao();
        System.out.println("inside checkout servelet2");
            try {
                for (cart c:ca) {
                    System.out.println(c.getProductid()+" "+c.getQuantity()+ " "+c.getId());
                    if(pd.checkstock(c.getQuantity(),c.getProductid())==false){
                        wrong.put(c.getId());
                    }
                }
                System.out.println("inside checkout servelet 3");
                if(wrong.length()==0){
                    for (cart c:ca) {
                        pd.decstock(c.getQuantity(),c.getProductid());
                    }
                    retval.put("redirect","checkout.jsp");
                }
                else{
                    retval.put("wrong",wrong);
                }
                System.out.println("inside checkout servelet4"+wrong.toString());
                out.print(retval.toString());
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

    }
}
