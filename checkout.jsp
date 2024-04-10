<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.ShoppingCart" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<ShoppingCart> cartList = (ArrayList<ShoppingCart>) session.getAttribute("cartList");
    if (cartList == null) cartList = new ArrayList<ShoppingCart>();
    float total = 0;
    DecimalFormat formatter = new DecimalFormat("#0.00");
%>

<head>
    <meta charset="utf-8"/>
    <title>Check Out</title>
    <link rel="stylesheet" href="/craftflow/css/styles.css">
</head>

<body>
    <div id="cart-section">
        <img id="home-img" src="/craftflow/img/home_img.jpg" alt="home_img.jpg"/>
        <div class="header-container">
            <nav>
                <ul id="nav_bar">
                    <form action="finish" method="post">
                        <button id="return-btn" type="submit" >Return</button>              
                    </form>
                </ul>
            </nav>

            <div id="header-title">Order Completed!</div>
            <div id="header-para">
                You will be receiving a confirmation
                <br/>from the seller soon.
            </div>

        </div>
    </div>

    <div id="section"> 
        <div class="section-container">
            <table width="80%" id="table1">
                <thead>
                <tr class="cart-items">
                    <td><b>Product</b></td>
                    <td><b>Price</b></td>
                    <td><b>Quantity</b></td>
                    <td><b>Subtotal</b></td>
                </tr>
                </thead>
                <hr>
                <tbody>
                    <% for(ShoppingCart item: cartList){%>
                    <br><br>
                        </div>
                        <div class="dd1">
                            <tr class="cart-items">
                                <td><%= item.getName()%></td>
                                <td class="price">$<%=item.getPrice()%></td>
                                <td><%= item.getQuantity()%></td>
                                <td>$<%= formatter.format(item.getPrice()*item.getQuantity())%></td>
                                <% total = total + item.getQuantity()*item.getPrice();%>
                            </tr>
                        </div>
                    <%}%>
                </tbody>
            </table>
            <hr>
            <p id="total" style="color: red;"><b>Total:</b> $<%= total %></p>
        </div>
    </div>

    <div id="footer">
        <div class="footer-container">
                <div id="contact-title">Contact Us</div>
                <div id="contact-para">gu0010an@e.ntu.edu.sg<br/>jtham011@e.ntu.edu.sg</div>
                <div id="help-title">Help Centre</div>
                <div id="help-para">Help</div>
        </div>
        <div id="copyright-container"></div>
    </div>

</body>
</html>