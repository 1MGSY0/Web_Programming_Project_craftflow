<%@ page import="bean.Products" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%
    HashMap<Integer, Products> products = (HashMap<Integer, Products>) request.getAttribute("products");
    if (products == null) products = new HashMap<>();
%>

<head>
    <meta charset="utf-8"/>
    <title>Purchase</title>
    <link rel="stylesheet" href="/craftflow/css/styles.css">
</head>

<body>
    <div id="section">
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

            <div id="header-title">Purchase Now!</div>
            <div id="header-para">
                Browse our catalogue of exquisite handmade treasures. 
                <br/>Purchase now and add a touch of artistry!
            </div>
            <div id="search-buttonholder"> 
                <form action="products" method="post">
                    <input name="name" id="name-input" placeholder="Search by Name"/>
                    <select id="cate-input" name="category">
                        <option value="" disabled selected hidden>Search by Category</option>
                        <option value="">All</option>
                        <option value="Accessories">Accessories</option>
                        <option value="Floral Arrangement">Floral Arrangement</option>
                        <option value="Art Pieces">Art Pieces</option>
                        <option value="Others">Others</option>
                    </select>
                    <button type="submit" id="search-btn">Search</button>
                </form>
            </div>  
        </div>            
    </div>

    <% if(products.size() == 0){ %>
    <div id="purchase-nilsection">
    </div>
    <% } %>

    <div id="purchase-section">
        <% for (Map.Entry<Integer, Products> product : products.entrySet()) { %> 
            <div class="product-container" >
                <img class="product-img" src="/craftflow/img/<%= product.getValue().getImageFileName() %>" alt="product of <%= product.getValue().getImageFileName() %>">
                <div class="productHeader-container">
                    <div class="product-cate"><%= product.getValue().getCategory() %></div>
                    <div class="product-name"><%= product.getValue().getName() %></div>
                </div>
                <div class="productDescription-container">
                    <div class="product-description"><%= product.getValue().getDescription() %></div>
                    <div class="product-qty"><%= product.getValue().getAvailableQty() %> left</div>
                    <div class="product-price">$ <%= product.getValue().getPrice() %></div>
                </div>
                <div class="addBtn-container">
                    <form >
                        <p>
                            <a href="cart?id=<%=product.getValue().getId()%>" id="add-btn" style="text-decoration: none;"><b>Add to cart</b></a>
                        </p>
                    </form>
                </div>
            </div>
        <% } %>
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