<%@ page import="bean.Products" %>
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
    <title>Cart</title>
    <link rel="stylesheet" href="/craftflow/css/styles.css">
</head>

<body>
    <div id="cart-section">
        <img id="home-img" src="/craftflow/img/home_img.jpg" alt="home_img.jpg"/>
        <div class="header-container">
            <nav>
                <ul id="nav_bar">
                    <li><a href="/craftflow/homepage.html">Home</a></li>
                    <li><a href="/craftflow/about.html">About Us</a></li>
                    <li><a href="/craftflow/purchase.jsp">Purchase</a></li>
                    <li><a href="/craftflow/sell.jsp">Sell</a></li>
                    <li><a href="/craftflow/cart.jsp">Cart</a><li>
                </ul>
            </nav>

            <div id="header-title">Cart</div>
            <div id="header-para">
                Shop now and check out with ease. 
                <br/>What are you waiting for? 
            </div>

        </div>
    </div>

    <div id="section">
        <center>
        <section id="cart" class="section-p1">
            <table width="90%" id="table1">
                <thead>
                <tr>
                    <td>Remove</td>
                    <td>Product</td>
                    <td></td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td>Subtotal</td>
                </tr>
                </thead>

                <tbody>
                <% if (cartList.isEmpty()){%>
                    <div class="empty-title">
                        <p id="empty2"><b>Your cart is empty!</b></p>
                        <div class="empty-btn">
                            <p class="empty5"><a style="text-decoration: none" style="color: red;" href="/craftflow/purchase.jsp"><b>Add Item</b></a></p>
                        </div>
                    <br><br>
                    </div>
                <%}else{%>
                    <% for(ShoppingCart item: cartList){%>
                        <div class="dd1">
                            <tr class="cart-items">
                                <div id="remove-product">
                                    <td class="remove-btn"><a style="text-decoration: none" href="Remove?index=<%=cartList.indexOf(item)%>" style="color: inherit;"><b>X</b></a></td>
                                </div>
                                <td><img src="/craftflow/img/<%= item.getImageFileName() %>" alt=""></td>
                                <td><%= item.getName()%></td>
                                <td class="price">$<%=item.getPrice()%></td>
                                <td>
                                    <a style="text-decoration: none" href="quantity?action=0&index=<%=cartList.indexOf(item)%>" id="qtyminus">-</a>&nbsp
                                    <input type="number" value="<%=item.getQuantity()%>" name="" class="quanity" readonly>&nbsp
                                    <a style="text-decoration: none" href="quantity?action=1&index=<%=cartList.indexOf(item)%>" id="qtyplus">+</a>
                                </td>
                                <td>$<%= formatter.format(item.getPrice()*item.getQuantity())%></td>
                                <% total = total + item.getQuantity()*item.getPrice();%>
                            </tr>
                        </div>
                    <%}
                }%>
                </tbody>
            </table>
            <% if (!cartList.isEmpty()){%>
            <p id="total">Total: $<%= total %></p>
            <form action="checkout" method="post">
                <button class="con-btn" type="submit" >Check Out</button>              
            </form>
            <%}%>
        </section>
        </center>
    </div>
    <div id="footer">
        <div class="footer-container">
                <div id="contact-title">Contact Us</div>
                <div id="contact-para">gu0010an@e.ntu.edu.sg<br/>jtham011@e.ntu.edu.sg</div>
                <div id="help-title">Help Centre</div>
                <div id="help-para">Help</div>
        </div>
        <div id="copyright-container"></div>
            <div id="copyright-title">&copy; 2024, CraftFlow</div>
    </div>
</body>
</html>