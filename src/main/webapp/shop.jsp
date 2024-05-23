<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="pcSlots.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <link rel="shortcut icon" href="./assets/img/pcSlotsLogo.ico" type="image/x-icon">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script defer src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script defer src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="./assets/css/shop.css">
    <link rel="stylesheet" href="./assets/css/productCard.css">
    <title>Products shop</title>
</head>
<% BDController bd = new BDController();
ArrayList<Product> cart = bd.allCart();
ArrayList<Product> pro = bd.allProduct();%>
<body>
	<header class="header">
    <a href="./index.jsp" class="logo"><img src="./assets/img/pcSlotsLogo.png" alt=""></a>
    <div class="userThings">
      <a href="./registerUser.jsp" class="userInfo"><img src="./assets/img/usuario.png" alt=""></a>
       <a href="./cart.jsp" class="shopCart"><img src="./assets/img/carrito-de-compras.png" alt=""><span class="cartObjects"><%=Util.carritoNum(cart) %></span></a>
    </div>
    <input class="menu-btn" type="checkbox" id="menu-btn" />
    <label class="menu-icon" for="menu-btn"><span class="navicon"></span></label>
    <ul class="menu">
      <li><a href="./shop.jsp">Products</a></li>
      <li><a href="./clients.jsp">Clients</a></li>
      <li><a href="./sell-line.jsp">Sales line</a></li>
      <li class="dropdown">
        <a href="#more">More</a>
        <ul class="dropdown-content">
          <li><a href="./registerProduct.jsp">Register product</a></li>
          <li><a href="./deleteProduct.jsp">Delete product</a></li>
        </ul>
      </li>
    </ul>
  </header>
      <aside class="aside">
        <div class="asideContent">
            <h2>Categories</h2>
            <ul class="categories">
            <%ArrayList<String> s = new ArrayList<String>();
    		for(Product p : pro){%>
    			<%if (!s.contains(p.getType())){ 
    			s.add(p.getType());%>
               	 <li><a href="#"><%=p.getType() %></a></li>
            	 <%} %>   
             <%} %>
            </ul>
        </div>
      </aside>
      <main>
        <section class="ShopContent">
            <div class="topbar">
                <h3>Products</h3>
                <div class="sortBy">
                  <h4>Sort by: </h4>
                  <ul class="sortByList">
                    <li><a href="#">Relevance</a></li>
                    <li><a href="#">Price Low</a></li>
                    <li><a href="#">Price High</a></li>
                  </ul>
                </div>
            </div>
            <div class="productContainer">
            <% for (Product p : pro){ %>
                <div class="productCard">
                    <img class="imagenProducto" src="./assets/img/products/<%=p.getIdProduct() %>.png" alt="">
                    <p class="nombre"><%=p.getName() %></p>
                    <h3 class="precio"><%=p.getValue() %>$</h3>
                    <p class="envio">Envio gratis</p>
                    <a href="./shop-single.jsp?codP=<%=p.getIdProduct() %>" style="width:100%"><button class="addCartButton">View product</button></a>
                </div>
                <%} %>
            </div>
        </section>
      </main>
      <footer>
        <!-- Footer -->
          <section id="footer">
            <div class="container">
              <div class="move row text-center text-xs-center text-sm-left text-md-left">
                <div class="col-xs-12 col-sm-4 col-md-4">
                  <h5>Products</h5>
                  <ul class="list-unstyled quick-links">
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Mobile Phones</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Tablets</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Laptops</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Desktop</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Other</a></li>
                  </ul>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                  <h5>For gambling</h5>
                  <ul class="list-unstyled quick-links">
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Produts</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>LootBoxes</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Promotions</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About us</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>This is a scam?</a></li>
                  </ul>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-4">
                  <h5>Other things</h5>
                  <ul class="list-unstyled quick-links">
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Sells</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Sells lines</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Users</a></li>
                    <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Products</a></li>
                    <li><a href="javascript:void(); title="Design and developed by"><i class="fa fa-angle-double-right"></i>Imprint</a></li>
                  </ul>
                </div>
              </div>
              <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
                  <ul class="list-unstyled list-inline social text-center">
                    <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-facebook"></i></a></li>
                    <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-twitter"></i></a></li>
                    <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-instagram"></i></a></li>
                    <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-google-plus"></i></a></li>
                    <li class="list-inline-item"><a href="javascript:void();" target="_blank"><i class="fa fa-envelope"></i></a></li>
                  </ul>
                </div>
                </hr>
              </div>  
              <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center">
                  <p><u><a href=javascript:void();>PCSLOTS Corporation</a></u> is a Registered MSP/ISO of Ludopathy, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]</p>
                  <p class="h6">&copy All right Reversed.<a class="text-green ml-2" href="javascript:void();" target="_blank">PCSLOTS</a></p>
                </div>
                </hr>
              </div>  
            </div>
          </section>
          <!-- ./Footer -->
    </footer>
</body>
</html>