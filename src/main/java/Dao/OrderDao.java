package Dao;

import Model.Order;
import Model.cart;

import java.sql.*;
import java.util.ArrayList;

public class OrderDao {
    public void insert(int UserId,int ProductId,int Quantity,String Address) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("insert into orders (UserId,ProductId,Quantity,Address) values (?,?,?,?)");
        st.setInt(1,UserId);
        st.setInt(2,ProductId);
        st.setInt(3,Quantity);
        st.setString(4,Address);
        st.executeUpdate();
    }
    public void delete(int id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("delete from orders where Id=?");
        st.setInt(1,id);
        st.executeUpdate();
    }
    public ArrayList<Order> getall() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("select * from orders inner join product on product.Id=orders.ProductId order by UserId ");
        ArrayList<Order> orderItem = new ArrayList<Order>();
        ResultSet rs= st.executeQuery();
        while (rs.next()) {
            Order od = new Order();
            od.setId(rs.getInt("Id"));
            od.setUserId(rs.getInt("UserId"));
            od.setProductId(rs.getInt("ProductId"));
            od.setProductname(rs.getString("Name"));
            od.setPrice(rs.getFloat("Price"));
            od.setQuantity(rs.getInt("Quantity"));
            od.setAddress(rs.getString("Address"));
            orderItem.add(od);
        }
        return orderItem;
    }
    public ArrayList<Order> getallid(int Id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("select * from orders inner join product on product.Id=orders.ProductId where userId=?");
        st.setInt(1,Id);
        ArrayList<Order> orderItem = new ArrayList<Order>();
        ResultSet rs= st.executeQuery();
        while (rs.next()) {
            Order od = new Order();
            od.setId(rs.getInt("Id"));
            od.setUserId(rs.getInt("UserId"));
            od.setProductId(rs.getInt("ProductId"));
            od.setProductname(rs.getString("Name"));
            od.setPrice(rs.getFloat("Price"));
            od.setQuantity(rs.getInt("Quantity"));
            od.setAddress(rs.getString("Address"));
            orderItem.add(od);
        }
        return orderItem;
    }
}
