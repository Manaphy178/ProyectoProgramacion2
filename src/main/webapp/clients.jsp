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
    <link rel="stylesheet" href="./assets/css/tables.css">
    <title>Clients</title>
</head>
<body>
  <%
	BDController bd = new BDController();
	ArrayList<Product> cart = bd.allCart();
	ArrayList<Client> client = bd.allClient();
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
   <h2 class="tableTittle">Clients list</h2>
    <table border="1">
        <tr>
            <th>ID Client</th>
            <th>Username</th>
            <th>Name</th>
            <th>Last name</th>
            <th>DNI</th>
            <th>Province</th>
            <th>CP</th>
            <th>Address</th>
        </tr>
        <%for (Client c : client){ %>
        <tr>
            <td><a style="text-decoration: none; color: black;" href="client-single.jsp?codC=<%=c.getIdCliente() %>"><%=c.getIdCliente() %></a></td>
            <td><a style="text-decoration: none; color: black;" href="client-single.jsp?codC=<%=c.getIdCliente() %>"><%=c.getUsername() %></a></td>
            <td><a style="text-decoration: none; color: black;" href="client-single.jsp?codC=<%=c.getIdCliente() %>"><%=c.getName() %></a></td>
            <td><a style="text-decoration: none; color: black;" href="client-single.jsp?codC=<%=c.getIdCliente() %>"><%=c.getLastName() %></a></td>
            <td><a style="text-decoration: none; color: black;" href="client-single.jsp?codC=<%=c.getIdCliente() %>"><%=c.getDni() %></a></td>
            <td><a style="text-decoration: none; color: black;" href="client-single.jsp?codC=<%=c.getIdCliente() %>"><%=c.getProvince() %></a></td>
            <td><a style="text-decoration: none; color: black;" href="client-single.jsp?codC=<%=c.getIdCliente() %>"><%=c.getCp() %></a></td>
            <td><a style="text-decoration: none; color: black;" href="client-single.jsp?codC=<%=c.getIdCliente() %>"><%=c.getAddress() %></a></td>
        </tr>
        <%} %>
    </table>
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
                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Products</a></li>
                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>LootBoxes</a></li>
                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Promotions</a></li>
                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About us</a></li>
                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>This is a scam?</a></li>
              </ul>
            </div>
            <div class="col-xs-12 col-sm-4 col-md-4">
              <h5>Other things</h5>
              <ul class="list-unstyled quick-links">
                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Clients</a></li>
                <li><a href="./sell-line.jsp"><i class="fa fa-angle-double-right"></i>Sells line</a></li>
                <li><a href="./register.jsp"><i class="fa fa-angle-double-right"></i>Register product</a></li>
                <li><a href="./deregister"><i class="fa fa-angle-double-right"></i>Deregister product</a></li>
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