package controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.nimbus.State;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "advsearch",urlPatterns = "/advsearch")
public class advsearch extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws IOException
     */
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        String url= "jdbc:mysql://localhost:3306/myawp";
        String username ="root";
        String password = "admin";
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(advsearch.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            Connection conn = DriverManager.getConnection(url , username , password);
            Statement st = conn.createStatement();
            String ip = request.getParameter("str");
            ResultSet rs = st.executeQuery("select * from product");
            String prodName;
            while(rs.next())
            {
                prodName = rs.getString("Name")+ "";
                prodName = prodName.toLowerCase();
                if(prodName.contains(ip)){
                    out.print("<option value='" + rs.getString("Name") + "'>");
                }
            }
        } catch (SQLException throwables) {
            out.print("<option value='failed'>");
        }

    }
}
