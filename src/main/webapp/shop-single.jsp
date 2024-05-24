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
    <link rel="stylesheet" href="./assets/css/shop-single.css">
    <link rel="stylesheet" href="./assets/css/productCard.css"> 
	<link rel="stylesheet" href="./assets/css/tables.css">
    <title>View product</title>
</head>
<%
BDController bd = new BDController();
int codP = Integer.parseInt(request.getParameter("codP"));
int num = Integer.parseInt(request.getParameter("foto"));
Product p = bd.giveProductCod(codP);
ArrayList<Product> cart = bd.allCart();
%>
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
      <main>
        <article class="product">
            <section class="productImages">
                <div>
                  <img src="./assets/img/products/<%=num %>.png" alt="">
                </div>
            </section>
            <section class="productInformation">
                <article class="info">
                    <h2 class="productName"><%=p.getName() %></h2>
                    <h3 class="productPrice">
                    <%=p.getValue() %>$
                    </h3>
                    <div class="productBrand">
                    Brand: <%=p.getBrand() %>
                    </div>
                    <div class="productDescription">
                      <h4>Description</h4>
                      <p class="description">
                     <%=p.getDescription() %>
                      </p>
                    </div>
                    <div class="especifications">
                        <h4>Especifications</h4>
                        <%for (String c : Util.espec(p.getCaract())){ %>
                        <p><%=c %></p>
                        <%} %>
                    
                    </div>
                </article>
                <div class="buttons">
                    <a href="editProduct.jsp?codP=<%=p.getIdProduct()%>"><button class="shopButton" style="width: 100%;">Edit Product</button></a>
					<a href="./operaciones.jsp?tipo=annadir&producto=<%=p.getIdProduct()%>"><button class="shopButton" style="width: 100%;">Add to cart</button></a>
                </div>
            </section>
        </article>
        <article class="productSalesLine">
          <h2 style="text-align:center;">Sales line</h2>
          <table border="1">
              <tr>
                  <th>ID Line</th>
                  <th>ID Sale</th>
                  <th>Product</th>
                  <th>Units</th>
                  <th>Unit price</th>
              </tr>
             <%for (SaleLine sl : bd.saleLineProduct(p.getIdProduct())){ %>
              <tr>
                  <td><%=sl.getIdLine()%></td>
                  <td><%=sl.getIdSale()%></td>
                  <td><%=sl.getProduct()%></td>
                  <td><%=sl.getUnits()%></td>
                  <td><%=sl.getUnit_price()%></td>
              </tr>
              <%} %>
          </table>
        </article>
      </main>
  <footer>
    <!-- Footer -->
      <section id="footer">
        <div class="container">
          <div class="move row text-center text-xs-center text-sm-left text-md-left">
            <div class="col-xs-12 col-sm-4 col-md-4">
              <h5>Products</h5>
              <ul class="list-unstyled quick-links">
                <li><a href="shop.jsp"><i class="fa fa-angle-double-right"></i>Mobile Phones</a></li>
                <li><a href="shop.jsp"><i class="fa fa-angle-double-right"></i>Tablets</a></li>
                <li><a href="shop.jsp"><i class="fa fa-angle-double-right"></i>Laptops</a></li>
                <li><a href="shop.jsp"><i class="fa fa-angle-double-right"></i>Desktop</a></li>
                <li><a href="shop.jsp"><i class="fa fa-angle-double-right"></i>Other</a></li>
              </ul>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
              <h5>For gambling</h5>
              <ul class="list-unstyled quick-links">
                <li><a href="shop.jsp"><i class="fa fa-angle-double-right"></i>Products</a></li>
                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>LootBoxes</a></li>
                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Promotions</a></li>
                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About us</a></li>
                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>This is a scam?</a></li>
              </ul>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
              <h5>Other things</h5>
              <ul class="list-unstyled quick-links">
                <li><a href="clients.jsp"><i class="fa fa-angle-double-right"></i>Clients</a></li>
                <li><a href="./sell-line.jsp"><i class="fa fa-angle-double-right"></i>Sells line</a></li>
                <li><a href="./registerProduct.jsp"><i class="fa fa-angle-double-right"></i>Register product</a></li>
                <li><a href="deleteProduct.jsp"><i class="fa fa-angle-double-right"></i>Deregister product</a></li>
                <li><a href="./shop.jsp" title="Our products"><i class="fa fa-angle-double-right"></i>Products</a></li>
              </ul>
            </div>
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