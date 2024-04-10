import bean.Products;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;    
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.util.*;

@WebServlet("/products")
public class PurchaseServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");

        try (
            // Step 1: Allocate a database 'Connection' object
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/craftflow?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC",
                "root", "P0emg@rden4u");

            // Step 2: Allocate a 'Statement' object in the Connection
            Statement stmt = conn.createStatement();
        ) {
            // Step 3: Execute a SQL SELECT query
            String query = "";
            String categoryName = (String) request.getParameter("category");
            String productName = (String) request.getParameter("name");
            System.out.println(categoryName);
            System.out.println(productName);

            if(categoryName=="" && productName=="")
            {
                String sqlAll = "SELECT * FROM products";
                query = sqlAll;
                System.out.println("searching all: " + query);
            }else if(productName==""){
                String sqlSearchCat = "SELECT * FROM products WHERE category IN ('";
                sqlSearchCat += categoryName + "') ";
                query = sqlSearchCat;
                System.out.println("searching cat: " + query);
            }else {
                String sqlSearch = "SELECT * FROM products WHERE category IN ('";
                sqlSearch += categoryName + "') ";
                sqlSearch += "OR name LIKE ('%"+ productName + "%') ";
                sqlSearch += "OR description IN ('%"+ productName + "%') ";
                sqlSearch += "ORDER BY id ASC";
                query = sqlSearch;
                System.out.println("searching some: " + query);
            }                  

            // Step 4: Process the query result set
            ResultSet rset = stmt.executeQuery(query);
            HashMap<Integer, Products> result = new HashMap<>();

            while(rset.next()) {
                int id = rset.getInt("id");
                String name = rset.getString("name");
                String category = rset.getString("category");
                String imageFileName = rset.getString("imageFileName");
                float price = rset.getFloat("price");
                int availableQty = rset.getInt("availableQty");
                String description = rset.getString("description");

                Products product = new Products(id, name, category, imageFileName, price, availableQty, description);
                result.put(product.getId(), product);
                System.out.println("Inserted: " + id + name + category + imageFileName + price + availableQty + description);
            }
            request.setAttribute("products", result);
            request.getRequestDispatcher("/purchase.jsp").forward(request,response);

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