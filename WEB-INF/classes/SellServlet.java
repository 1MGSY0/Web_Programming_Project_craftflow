import java.io.*;
import java.sql.*;
import jakarta.servlet.*;    
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig
@WebServlet("/sell")
public class SellServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        try (
            // Step 1: Allocate a database 'Connection' object
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/craftflow?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
                "root", "P0emg@rden4u");
            
        ) {
            // Step 2: Allocate a 'Statement' object in the Connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sqlInsert = "insert into products(name, seller, category, imageFileName, description, price, availableQty) values (?,?,?,?,?,?,?)";
            
            // Step 3: Execute a SQL SELECT query
            Part file = request.getPart("imageFileName");
            String imageFileName = file.getSubmittedFileName();
            String uploadPaths = "C:/myWebProject/tomcat/webapps/craftflow/img/" + imageFileName;
            PreparedStatement stmt = conn.prepareStatement(sqlInsert);
                        
            stmt.setString(1, request.getParameter("name"));
            stmt.setString(2, request.getParameter("seller"));
            stmt.setString(3, request.getParameter("category"));
            stmt.setString(4, imageFileName);
            stmt.setString(5, request.getParameter("description"));
            stmt.setFloat(6, Float.parseFloat(request.getParameter("price")));
            stmt.setInt(7, Integer.parseInt(request.getParameter("availableQty")));
            stmt.executeUpdate();

            try{
                FileOutputStream fos = new FileOutputStream(uploadPaths);
                InputStream is = file.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
            } catch(Exception ex) {
                ex.printStackTrace();
            }
            request.getRequestDispatcher("/homepage.html").forward(request, response);
                
        } catch(Exception ex) {
            ex.printStackTrace();
        }  

    }

   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
        doPost(request, response);
   }

}