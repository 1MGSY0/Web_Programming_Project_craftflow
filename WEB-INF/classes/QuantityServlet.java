import bean.ShoppingCart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/quantity")
public class QuantityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        ArrayList<ShoppingCart> cartList = (ArrayList<ShoppingCart>) session.getAttribute("cartList");
        int action = Integer.parseInt(request.getParameter("action"));
        int index = Integer.parseInt(request.getParameter("index"));
        if(action==1){
            cartList.get(index).setQuantity(cartList.get(index).getQuantity()+1);
        }else{
            cartList.get(index).setQuantity(cartList.get(index).getQuantity()-1);
            if(cartList.get(index).getQuantity()==0){
                cartList.remove(index);
            }
        }
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
        doPost(request, response);
    }

}