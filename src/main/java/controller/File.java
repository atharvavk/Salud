package controller;

import Dao.UserDao;
import Model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "file", urlPatterns = "/admin/file")
public class File extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
        try {
            FileItem file = sf.parseRequest(request).iterator().next();
            if (file.getSize() < 1000000) {
                String filename = file.getName().toLowerCase();
                String[] extn = { ".jpg", ".jpeg", ".png" };
                String fileactualext = new String();
                Boolean ans = false;
                for (String a : extn) {
                    if (filename.endsWith(a)) {
                        ans = true;
                        fileactualext = a;
                        break;
                    }
                }
                if (ans) {
                    HttpSession session = request.getSession();
                    User u = (User) session.getAttribute("User");
                    int n = u.getId();
                    String newname = Integer.toString(n) + fileactualext;
                    file.write(new java.io.File("C:\\Users\\risha\\Desktop\\myawp\\src\\main\\webapp\\admin\\uploads\\" + newname));
                    if(u.isStatus()){
                        UserDao x=new UserDao();
                        x.setStatus(n);
                        u.setStatus(false);
                        session.setAttribute("User",u);
                    }
                    // System.out.println("done");
                    response.sendRedirect("profile.jsp");
                } else {
                    response.sendRedirect("profile.jsp?error=type");
                }
            } else {
                response.sendRedirect("profile.jsp?error=size");
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
