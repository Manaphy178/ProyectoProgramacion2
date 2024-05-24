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
    <link rel="stylesheet" href="./assets/css/cart.css">
    <link rel="stylesheet" href="./assets/css/productCardHorizontal.css">
    <link rel="shortcut icon" href="./assets/img/pcSlotsLogo.ico" type="image/x-icon">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script defer src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script defer src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script defer src="./assets/js/carrousel.js"></script>
    <title>PCSLOTS</title>
</head>
<body>
	<%
	BDController bd = new BDController();
	ArrayList<Product> cart = bd.allCart();
	String mensaje = "";
	if (request.getParameter("mensaje") != null) {
		mensaje = request.getParameter("mensaje");
	}
	
	
	%>
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
    <div class="cartContainer">
        <div class="productsContainer">
            <h3>Products</h3>
            <h4 style="text-align:center; margin-top:3rem;"><%=mensaje %></h4>
            <article class="products">
            
					<%
					ArrayList<Integer> unidades = new ArrayList<>();
					for (Product p : cart){
					if (!unidades.contains(p.getIdProduct())){
						int num = 0;
						if (p.getIdProduct() <= 42){
		            		num = p.getIdProduct();
		            	}
						unidades.add(p.getIdProduct());
					
					%>
					<section class="product">
						<img class="productImg"
							src="./assets/img/products/<%=num%>.png" alt="">
						<div class="productInfo">
							<div class="info">
								<h4 class="brand"><%=p.getBrand()%></h4>
								<p class="name"><%=p.getName()%></p>
								<p class="name"><%=p.getType()%></p>
							</div>
							<div class="priceInfo">
								<div class="unitPrice">
									<h6>Unit price</h6>
									<p><%=p.getValue()%>$
									</p>
								</div>
								<div class="unitsContainer">
									<h6>Units</h6>
									<div class="units">
										<a href="operaciones.jsp?tipo=quitarCarro&producto=<%=p.getIdProduct()%>"><button class="CartButton">-</button></a>
										<p><%=bd.contarUnidadesConcretas(p.getIdProduct()) %></p>
										<a href="operaciones.jsp?tipo=annadirCarro&producto=<%=p.getIdProduct()%>"><button class="CartButton">+</button></a>
									</div>
								</div>
								<div class="totalPrice">
									<h6>Final price</h6>
									<p><%=p.getValue() * bd.contarUnidadesConcretas(p.getIdProduct())%>$
									</p>
								</div>
							</div>
						</div>
						
					</section>
					<%
					}
					}
					%>
				</article>
        </div>
        <div class="resumeContainer">
            <h3>Order resume</h3>
            <div class="resume">
                <div class="subtotalContainer">
                    <p>Subtotal ( <%=bd.contarUnidades() %> products )</p>
                    <p><%=bd.precioTotal() %>$</p>
                </div>
                <div class="shippingContainer">
                    <p>Shipping</p>
                    <p>Free</p>
                </div>
                <div class="totalContainer">
                    <h5>Total</h5>
                    <h5><%=bd.precioTotal() %>$</h5>
                </div>
               <a href="operaciones.jsp?tipo=ventaNueva">	<button class="placeOrder">Place order</button></a>
            </div>
        </div>
    
    </div>
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