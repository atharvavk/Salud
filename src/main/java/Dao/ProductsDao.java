package Dao;
import Model.product;

import java.sql.*;
import java.util.ArrayList;

public class ProductsDao {
    public ArrayList<product> getAllProducts() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        Statement st = conn.createStatement();
        ArrayList<product> allprods = new ArrayList<product>();
        product cp;
        String query = "select * from product";
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            cp = new product();
            cp.setId(rs.getInt("Id"));
            cp.setName(rs.getString("Name"));
            cp.setDescription(rs.getString("Description"));
            cp.setStock(rs.getInt("Stock"));
            cp.setPrice(rs.getFloat("Price"));
            cp.setFilepath(rs.getString("Picname"));
            allprods.add(cp);
        }
        return allprods;
    }
    public product getproductbyid(int id) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        product cp=new product();
        PreparedStatement st=conn.prepareStatement("select * from product where Id=?");
        st.setInt(1,id);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            cp.setId(rs.getInt("Id"));
            cp.setName(rs.getString("Name"));
            cp.setDescription(rs.getString("Description"));
            cp.setStock(rs.getInt("Stock"));
            cp.setPrice(rs.getFloat("Price"));
        }
        return cp;
    }
    public void insert(String name,String Description,int stock,float price) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("insert into product(Name,Description,Stock,Price) values (?,?,?,?)");
        st.setString(1, name);
        st.setString(2, Description);
        st.setInt(3,stock);
        st.setFloat(4,price);
        st.executeUpdate();
    }
    public void insertwfile(String name,String Description,int stock,float price,String picname) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("insert into product(Name,Description,Stock,Price,Picname) values (?,?,?,?,?)");
        st.setString(1, name);
        st.setString(2, Description);
        st.setInt(3,stock);
        st.setFloat(4,price);
        st.setString(5,picname);
        st.executeUpdate();
    }
    public void delete(int id) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("delete  from  product where Id=?");
        st.setInt(1, id);
        st.executeUpdate();
    }
    public void  updatestock(int stock,int id) throws ClassNotFoundException, SQLException {
        System.out.println("inside update Stock");
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("update product set Stock=Stock+? where id=?");
        st.setInt(1, stock);
        st.setInt(2, id);
        st.executeUpdate();

    }
    public void update(int id,int stock,float price,String name,String description) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn
                .prepareStatement("update product set Name=?,Stock=?,Price=?,Description=? where Id=?");
        st.setString(1, name);
        st.setInt(2, stock);
        st.setFloat(3, price);
        st.setString(4, description);
        st.setInt(5, id);
        st.executeUpdate();
    }
    public ArrayList<product> getSearched(String str) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        Statement st = conn.createStatement();
        ArrayList<product> retval = new ArrayList<product>();
        product cp;
        String query = "select * from product";
        ResultSet rs = st.executeQuery(query);
        System.out.println("str = " + str);
        while (rs.next()) {
            if (rs.getString("Name").toLowerCase().contains(str.toLowerCase())) {
                cp = new product();
                cp.setId(rs.getInt("Id"));
                cp.setName(rs.getString("Name"));
                cp.setDescription(rs.getString("Description"));
                cp.setStock(rs.getInt("Stock"));
                cp.setPrice(rs.getFloat("Price"));
                retval.add(cp);
            }
        }
        return retval;
    }
}


    
