package Dao;

import java.sql.*;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.SecureRandom;
import java.util.ArrayList;

import Model.User;
import Model.cart;
import org.apache.commons.codec.binary.Base64;

//this is Dao class (Dao means user for connection to data base)
// all the heavy lifthing is
public class UserDao {
    // here this Password class is for hashing the password and checking the hashed
    // password
    // it also does salting(ie adding random string to string so that even same pwd
    // dont have same pwd)
    public class Password {
        private static final int iterations = 20 * 1000;
        private static final int saltLen = 32;
        private static final int desiredKeyLen = 256;

        public String getSaltedHash(String password) throws Exception {
            byte[] salt = SecureRandom.getInstance("SHA1PRNG").generateSeed(saltLen);

            return Base64.encodeBase64String(salt) + "$" + hash(password, salt);
        }

        public Boolean check(String password, String stored) throws Exception {
            String[] saltAndHash = stored.split("\\$");
            if (saltAndHash.length != 2) {
                throw new IllegalStateException("The stored password must have the form 'salt$hash'");
            }
            String hashOfInput = hash(password, Base64.decodeBase64(saltAndHash[0]));
            return hashOfInput.equals(saltAndHash[1]);
        }

        private String hash(String password, byte[] salt) throws Exception {
            if (password == null || password.length() == 0)
                throw new IllegalArgumentException("Empty passwords are not supported.");
            SecretKeyFactory f = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
            SecretKey key = f.generateSecret(new PBEKeySpec(password.toCharArray(), salt, iterations, desiredKeyLen));
            return Base64.encodeBase64String(key.getEncoded());
        }
    }

    // this function for login Credintials and return User class object with all
    // details from tha table
    public User check(String user, String pwd) {
        // setting some default values in user
        User u = new User();
        u.setName("incorrect_password");
        u.setEmail("NotSet");
        u.setId(-1);
        u.setMobile("-1");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
            PreparedStatement st = conn.prepareStatement("select * from user where (Email= ? OR Mobile=?)");
            st.setString(1, user);
            st.setString(2, user);
            Password p = new Password();
            ResultSet rs = st.executeQuery();
            // if rs is not empty it means credential are correct(see query)
            if (rs.next()) {
                if (p.check(pwd, rs.getString("Password"))) {
                    u.setName(rs.getString("UserName"));
                    u.setId(rs.getInt("Id"));
                    u.setMobile(rs.getString("Mobile"));
                    u.setEmail(rs.getString("Email"));
                    u.setStatus(rs.getBoolean("ProfileStatus"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    // checks if give User is admin
    // it will be hardcoded as we will only keep 1 Admin
    public Boolean isAdmin(String user, String pwd) {
        if (user.equals("123") && pwd.equals("Admin")) {
            return true;
        }
        return false;
    }

    // this is to check if user already Exists
    public Boolean already(String user, String num) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
            PreparedStatement st = conn.prepareStatement("select * from user where Email= ? OR Mobile=?");
            st.setString(1, user);
            st.setString(2, num);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // this is to insert values into the table
    public Boolean insert(String fname, String email, String num, String pwd) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
            PreparedStatement st = conn
                    .prepareStatement("insert into user(UserName,Mobile,Email,Password) values (?,?,?,?)");
            st.setString(1, fname);
            st.setString(2, num);
            st.setString(3, email);
            Password p = new Password();
            st.setString(4, p.getSaltedHash(pwd));
            st.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

public boolean remove(int id){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "Admin");
            PreparedStatement st = conn
                    .prepareStatement("delete from user where id=?");
            st.setInt(1, id);
            st.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }    // this function changes the status to profile picture set
    public void setStatus(int a) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        PreparedStatement st = conn.prepareStatement("update user set ProfileStatus=0 where id = ?");
        st.setString(1, String.valueOf(a));
        st.executeUpdate();
    }
    public ArrayList<User> getallusers() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myawp", "root", "admin");
        ArrayList<User> allusers = new ArrayList<User>();
        User u;
        PreparedStatement  st = conn.prepareStatement("select * from user ");
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            u = new User();
            u.setId(rs.getInt("Id"));
            u.setName(rs.getString("UserName"));
            u.setMobile(rs.getString("Mobile"));
            u.setEmail(rs.getString("Email"));
            allusers.add(u);
        }
        return allusers;
    }
}