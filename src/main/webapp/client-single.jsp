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
<link rel="stylesheet" href="./assets/css/client-single.css">
    <link rel="stylesheet" href="./assets/css/productCard.css">
    <link rel="stylesheet" href="./assets/css/tables.css">
    <title>Single client</title>
</head>
<body>
	<%
	BDController bd = new BDController();
	ArrayList<Product> cart = bd.allCart();
	String mensaje = "";
	if (request.getParameter("mensaje") != null) {
		mensaje = request.getParameter("mensaje");
	}

	int idClient = Integer.parseInt(request.getParameter("codC"));
	Client c = bd.giveClient(idClient);
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
        <div class="mainContainer">
          <article class="client">
          <%int num = 0;
    		if (c.getIdCliente() <=11){
    			num = c.getIdCliente();
    		}%>
            <img src="./assets/img/client/<%=num %>.png" alt="">
            <div class="info">
              <div class="clientInfo">
                <h2 class="username"><%=c.getUsername() %></h2>
                <p>Name: <%=c.getName() %></p>
                <p>Last name: <%=c.getLastName()%></p>
              </div>
              <div class="addressInfo">
                  <p>Address: <%=c.getAddress() %></p>
                  <p>Province: <%=c.getProvince() %></p>
                  <p>CP: <%=c.getCp() %></p>
              </div>
              <h5 class="dni"><%=c.getDni()%></h5>
            </div>
        </article>
        </div>
   		<div class="buttons" style=" display: flex;justify-content: center;align-items: center;width: 50%;gap: 1rem;margin: 1rem auto;">
         <a href="./editUser.jsp?codC=<%=c.getIdCliente() %>" class="linkButton"><button class="editButton">Edit user</button></a>
          <a href="./operaciones.jsp?tipo=userDelete&codC=<%=c.getIdCliente() %>" class="linkButton"><button class="editButton">Delete user</button></a>
        </div>
        <article class="productSalesLine">
          <h2 class="tableTittle">User Sales</h2>
          <table border="1">
              <tr>
                  <th>ID Sale</th>
                  <th>Username</th>
                  <th>Sale Date</th>
                  <th>Units</th>
                  <th>Total</th>
              </tr>
              <%for (Sale s : bd.saleClient(c.getIdCliente())){ %>
              <tr>
                  <td><a style="text-decoration: none; color: black;" href="sell-line-single.jsp?codSale=<%=s.getIdSales()%>"><%=s.getIdSales()%></a></td>
                  <td><a style="text-decoration: none; color: black;" href="sell-line-single.jsp?codSale=<%=s.getIdSales()%>"><%=c.getUsername()%></a></td>
                  <td><a style="text-decoration: none; color: black;" href="sell-line-single.jsp?codSale=<%=s.getIdSales()%>"><%=s.getSaleDate()%></a></td>
                  <td><a style="text-decoration: none; color: black;" href="sell-line-single.jsp?codSale=<%=s.getIdSales()%>"><%=bd.unitsSale(s.getIdSales())%></a></td>
                  <td><a style="text-decoration: none; color: black;" href="sell-line-single.jsp?codSale=<%=s.getIdSales()%>"><%=s.getTotal()%></a></td>
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