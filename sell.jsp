<%@ page import="bean.Products" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="utf-8"/>
    <title>Sell</title>
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
            <div id="header-title">Sell Now!</div>
            <div id="header-para">
                List your item instantly and start selling your handmade creations today.
                <br/>Fill up a simple form and let us do the rest!
            </div>
        </div>
    </div>
    <div id="section"> 
        <div class="info-container">
            <form action="sell" method="post" enctype="multipart/form-data">
                <label for="seller-input">Seller Name:</label>
                <input type="text" id="seller-input" name="seller" placeholder="Type here" maxlength=50 required="required">
                <label for="productName-input">Product Name:</label>
                <input type="text" id="productName-input" name="name" placeholder="Type here" maxlength="50" required="required">
                <label for="cate-input">Product Category:</label>
                <select id="cate-input" required name="category">
                    <option value="" disabled selected hidden>Select Category</option>
                    <option value="Accessories">Accessories</option>
                    <option value="Floral Arrangement">Floral Arrangement</option>
                    <option value="Art Pieces">Art Pieces</option>
                    <option value="Others">Others</option>
                </select>
                <label for="img">Select image:</label><br>
                <input type="file" id="img-input" name="imageFileName" accept=".jpg" required="required">
                <label for="description-input">Product Description:</label>
                <input type="text" id="description-input" name="description" placeholder="Type here" maxlength=120 required="required">
                <label for="price-input">Unit Price:</label>
                <input type="number" id="price-input" name="price" placeholder="Type here" maxlength=50 required="required" step="0.01">
                <label for="qty-input">Available Quantity:</label>
                <input type="number" id="qty-input" name="availableQty" placeholder="Type here" maxlength=50 required="required">
                <div class="listBtn-container">
                    <button type="submit" id="list-btn">List</button>
                </div>
            </form>
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
        <div id="copyright-title">&copy; 2024, CraftFlow</div>
    </div> 
</body>
</html>