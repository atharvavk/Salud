package Dao;

import Model.cart;
import Model.product;

import java.sql.*;
import java.util.ArrayList;

public class CartDao {
    public void insert(int userid,int productid,int quantity) throws ClassNotFoundException, SQLException {
        System.out.println("inside Cart Dao");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("insert into cart(UserId,ProductId,Quantity) values (?,?,?)");
        st.setInt(1,userid);
        st.setInt(2,productid);
        st.setInt(3,quantity);
        st.executeUpdate();

    }
    public void delete(int userid,int prodid) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("delete  from  cart where UserId=? and ProductId=?");
        st.setInt(1, userid);
        st.setInt(2, prodid);
        st.executeUpdate();
    }
    public void clearcart(int userid) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("delete  from  cart where UserId=?");
        st.setInt(1, userid);
        st.executeUpdate();
    }
    public void changequantity(int quantity,int id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("update cart set Quantity=Quantity+? where Id=? ");
        st.setInt(1, quantity);
        st.setInt(2, id);
        st.executeUpdate();
    }
    public void clearzero() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("delete  from  cart where Id=?");
        st.executeUpdate();
    }
    public ArrayList<cart> getall(int userid) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        ArrayList<cart> cartitem = new ArrayList<cart>();
        cart cp;
        PreparedStatement  st = conn.prepareStatement("select cart.Id,ProductId,Name,Description,Price,Quantity,Stock from product inner join cart on cart.ProductId=product.Id where UserId=?");
        st.setInt(1,userid);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            cp = new cart();
            cp.setId(rs.getInt("Id"));
            cp.setProductid(rs.getInt("ProductId"));
            cp.setName(rs.getString("Name"));
            cp.setPrice(rs.getFloat("Price"));
            cp.setDescription(rs.getString("Description"));
            cp.setQuantity(rs.getInt("Quantity"));
            cp.setStock(rs.getInt("Stock"));
            cartitem.add(cp);
        }
        return cartitem;
    }
    public boolean isincart(int UserId,int productId) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement  st = conn.prepareStatement("select * from cart where ProductId=? and Userid=?");
        st.setInt(1,productId);
        st.setInt(2,UserId);
        ResultSet rs = st.executeQuery();
        return rs.next();

    }
}
