package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
