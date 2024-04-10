import bean.Products;
import bean.ShoppingCart;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;    
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.util.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {

        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();

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
            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println(id);

            if(request.getParameter("id")!=null) {

                // Step 3: Execute a SQL SELECT query
                String sqlSearchId = "SELECT * FROM products WHERE id IN ('";
                sqlSearchId += id + "') ";
                query = sqlSearchId;
                System.out.println("searching id: " + query);
                ResultSet rset = stmt.executeQuery(query);

                // Step 4: Process the query result set
                rset.next();
                String name = rset.getString("name");
                String category = rset.getString("category");
                String imageFileName = rset.getString("imageFileName");
                float price = rset.getFloat("price");
                int availableQty = rset.getInt("availableQty");

                if(availableQty>0){

                    ShoppingCart item = new ShoppingCart();
                    item.setId(id);
                    item.setCategory(category);
                    item.setImageFileName(imageFileName);
                    item.setQuantity(1);
                    item.setName(name);
                    item.setPrice(price);
                    session.setAttribute("item", item);

                    ArrayList<ShoppingCart> cartList = (ArrayList<ShoppingCart>) session.getAttribute("cartList");
                    if (cartList == null) {
                        ArrayList<ShoppingCart> shoppingCartList = new ArrayList<>();
                        shoppingCartList.add(item);
                        session.setAttribute("cartList", shoppingCartList);
                    } else {
                        boolean already = false;
                        for (ShoppingCart itemInCart : cartList) {
                            if (itemInCart.getId() == id) {
                                already = true;
                                session.setAttribute("itemInCart", true);
                            }
                        }
                        if (!already) {
                            cartList.add(item);
                        }
                        session.setAttribute("cartList", cartList);
                    }
                    System.out.println("Item Added: " + item);
                }else{
                    System.out.println("Out of Stock");
                }
            }
            request.getRequestDispatcher("/cart.jsp").forward(request, response);

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