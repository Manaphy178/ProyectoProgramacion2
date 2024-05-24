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
    <link rel="stylesheet" href="./assets/css/editProducts.css">
    <link rel="shortcut icon" href="./assets/img/pcSlotsLogo.ico" type="image/x-icon">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script defer src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script defer src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	int codP = Integer.parseInt(request.getParameter("codP"));
	Product p = bd.giveProductCod(codP);
	%>
	<header class="header">
    <a href="./index.jsp" class="logo"><img src="./assets/img/pcSlotsLogo.png" alt=""></a>
    <div class="userThings">
      <a href="./registerUser.jsp" class="userInfo"><img src="./assets/img/usuario.png" alt=""></a>
       <a href="" class="shopCart"><img src="./assets/img/carrito-de-compras.png" alt=""><span class="cartObjects"><%=Util.carritoNum(cart) %></span></a>
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
    <div class="formContainer">
     <h1>Edit Product</h1>
        <form class="form" action="operaciones.jsp?tipo=editProduct&modificar=<%=p.getIdProduct() %>" method="post">
            <input type="text" id="name" name="name" placeholder="Product name" value="<%=p.getName()%>">
            <input type="number" id="price" name="price" placeholder="Price" value="<%=p.getValue()%>">
            <input type="text" id="brand" name="brand" placeholder="Brand" value="<%=p.getBrand()%>">
            <select id="productType" name="productType">
                 <%ArrayList<String> s = new ArrayList<String>();
    		for(Product pr : bd.allProduct()){ %>
    			<%if (!s.contains(pr.getType())){ 
    			s.add(pr.getType());%>
                <option value="<%=pr.getType()%>" <%if (pr.getType().equalsIgnoreCase(p.getType())){ %>selected<%} %>><%=pr.getType()%></option>
                      	 <%} %>   
             <%} %>
              </select>
            <div class="textareas">
                <textarea id="description" name="description" placeholder="Description"><%=p.getDescription()%></textarea>
                <textarea id="characteristics" name="characteristics" placeholder="Characteristics" ><%=p.getCaract()%></textarea>
            </div>
            <button type="submit" class="submitButton">Register Product</button>
          </form>
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