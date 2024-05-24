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
    <link rel="stylesheet" href="./assets/css/editUsers.css">
    <link rel="shortcut icon" href="./assets/img/pcSlotsLogo.ico" type="image/x-icon">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script defer src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script defer src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Register User</title>
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
    <div class="formContainer">
      <h2>Edit user</h2>
        <form class="form" action="./operaciones.jsp?tipo=userEdit&codC=<%=c.getIdCliente() %>" method="post">
            <input type="text" id="username" name="username" placeholder="Username" required value="<%=c.getUsername()%>">
            <input type="text" id="name" name="name" placeholder="Name" required value="<%=c.getName()%>">
            <input type="text" id="lastname" name="lastname" placeholder="Last name" required value="<%=c.getLastName()%>">
            <input type="text" id="dni" name="dni" placeholder="DNI" required value="<%=c.getDni()%>">
            <input type="text" id="address" name="address" placeholder="Address" required value="<%=c.getAddress()%>">
            <input type="number" id="cp" name="cp" placeholder="CP" required value="<%=c.getCp()%>">
            <select id="province" name="province">
                <option value="alava">Álava</option>
                <option value="albacete">Albacete</option>
                <option value="alicante">Alicante</option>
                <option value="almeria">Almería</option>
                <option value="asturias">Asturias</option>
                <option value="avila">Ávila</option>
                <option value="badajoz">Badajoz</option>
                <option value="barcelona">Barcelona</option>
                <option value="burgos">Burgos</option>
                <option value="caceres">Cáceres</option>
                <option value="cadiz">Cádiz</option>
                <option value="cantabria">Cantabria</option>
                <option value="castellon">Castellón</option>
                <option value="ciudad_real">Ciudad Real</option>
                <option value="cordoba">Córdoba</option>
                <option value="cuenca">Cuenca</option>
                <option value="girona">Girona</option>
                <option value="granada">Granada</option>
                <option value="guadalajara">Guadalajara</option>
                <option value="guipuzcoa">Guipúzcoa</option>
                <option value="huelva">Huelva</option>
                <option value="huesca">Huesca</option>
                <option value="illes_balears">Illes Balears</option>
                <option value="jaen">Jaén</option>
                <option value="a_coruna">A Coruña</option>
                <option value="la_rioja">La Rioja</option>
                <option value="las_palmas">Las Palmas</option>
                <option value="leon">León</option>
                <option value="lleida">Lleida</option>
                <option value="lugo">Lugo</option>
                <option value="madrid">Madrid</option>
                <option value="malaga">Málaga</option>
                <option value="murcia">Murcia</option>
                <option value="navarra">Navarra</option>
                <option value="ourense">Ourense</option>
                <option value="palencia">Palencia</option>
                <option value="pontevedra">Pontevedra</option>
                <option value="salamanca">Salamanca</option>
                <option value="segovia">Segovia</option>
                <option value="sevilla">Sevilla</option>
                <option value="soria">Soria</option>
                <option value="tarragona">Tarragona</option>
                <option value="santa_cruz_de_tenerife">Santa Cruz de Tenerife</option>
                <option value="teruel">Teruel</option>
                <option value="toledo">Toledo</option>
                <option value="valencia">Valencia</option>
                <option value="valladolid">Valladolid</option>
                <option value="vizcaya">Vizcaya</option>
                <option value="zamora">Zamora</option>
                <option value="zaragoza">Zaragoza</option>
            </select>
            <button type="submit" class="submitButton">Register</button>
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