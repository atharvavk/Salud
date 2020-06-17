package AdminController;

import Dao.ProductsDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@WebServlet(name = "Trial",urlPatterns = "/AdminAddProduct")
public class Trial extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name="nd",description="nd",newfilename="default";
            int stock=0;
            float price=0;
             ArrayList<FileItem>  items = (ArrayList<FileItem>)new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
            for (FileItem item : items) {
                if (item.isFormField()) {
                    System.out.println(item.getFieldName());
                    if(item.getFieldName().equals("name")){
                        name=item.getString();
                    }
                    else if(item.getFieldName().equals("stock"))
                        stock=Integer.parseInt(item.getString());
                    else if(item.getFieldName().equals("description"))
                        description=item.getString();
                    else
                        price=Float.parseFloat(item.getString());
                } else {
                    String fileName = item.getName().toLowerCase();
                    newfilename= String.valueOf(System.currentTimeMillis());
                    item.write(new java.io.File("C:\\Users\\risha\\Desktop\\myawp - Copy\\src\\main\\webapp\\admin\\uploads\\"+newfilename+".jpg"));
                    response.setContentType("text/plain");
                    response.setCharacterEncoding("UTF-8");
                    // Do whatever with the content InputStream.
//                    ajaxUpdateResult += "File " + fileName + " is successfully uploaded\n\r";
                }
            }
            ProductsDao pd = new ProductsDao();
            pd.insertwfile(name, description, stock, price,newfilename);

        } catch (FileUploadException e) {

            throw new ServletException("Parsing file upload failed.", e);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

//        response.getWriter().print(ajaxUpdateResult);
    }
}
