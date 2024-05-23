<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*" %>
    <%@ page import="pcSlots.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <link rel="stylesheet" href="./assets/css/carrousel.css">
    <link rel="stylesheet" href="./assets/css/gallery.css">
    <link rel="stylesheet" href="./assets/css/information.css">
    <link rel="shortcut icon" href="./assets/img/pcSlotsLogo.ico" type="image/x-icon">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script defer src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script defer src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script defer src="./assets/js/carrousel.js"></script>
    <title>PCSLOTS</title>
</head>
<body>
	<%
	String origen = request.getParameter("tipo");

	BDController bd = new BDController();
	if (origen.equalsIgnoreCase("annadir")) {
		int codP = Integer.parseInt(request.getParameter("producto"));
		bd.insertCart(codP);
		response.sendRedirect("shop.jsp");
	}
	if (origen.equalsIgnoreCase("altaproducto")) {
		int codP = bd.giveLastProCod();
		String name = request.getParameter("name");
		Float value = Float.valueOf(request.getParameter("price"));
		String brand = request.getParameter("brand");
		String type = request.getParameter("productType");
		String description = request.getParameter("description");
		String caract = request.getParameter("characteristics");
		bd.insertProduct(codP,value, brand, type, description, name, caract);
		response.sendRedirect("registerProduct.jsp?mensaje=El producto se ha registrado perfectamente");
	} else if (origen.equalsIgnoreCase("bajaproducto")) {
		String name = "";
		if (request.getParameter("name") != null) {
			name = request.getParameter("name");
		}
		int codP = 0;
		String productIDParam = request.getParameter("productID");

		if (productIDParam != null && !productIDParam.isEmpty()) {
		  
		        int productID = Integer.parseInt(productIDParam);
		        if (productID != 0) {
		            codP = productID;
		        }
		 
		}
		if (bd.productExistsName(name) || bd.productExistsNum(codP)) {
			bd.deleteProduct(name, codP);
			response.sendRedirect("deleteProduct.jsp?mensaje=El producto se ha borrado exitosamente");
		} else {
			response.sendRedirect("deleteProduct.jsp?mensaje=El producto introducido no existe");
		}
	}
	%>

	<header class="header">
    <a href="./index.jsp" class="logo"><img src="./assets/img/pcSlotsLogo.png" alt=""></a>
    <div class="userThings">
      <a href="./registerUser.jsp" class="userInfo"><img src="./assets/img/usuario.png" alt=""></a>
       <a href="" class="shopCart"><img src="./assets/img/carrito-de-compras.png" alt=""><span class="cartObjects">0</span></a>
    </div>
    <input class="menu-btn" type="checkbox" id="menu-btn" />
    <label class="menu-icon" for="menu-btn"><span class="navicon"></span></label>
    <ul class="menu">
      <li><a href="./shop.jsp">Products</a></li>
      <li><a href="./clients.jsp">Clients</a></li>
      <li><a href="./sell-line.jsp">Sells</a></li>
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
    <article>
      <section class="carrousel">
        <div class="container-carousel">
          <div class="carruseles" id="slider">
              <section class="slider-section">
                  <img src="https://dummyimage.com/500x200">
              </section>
              <section class="slider-section">
                <img src="https://dummyimage.com/500x200">
              </section>
              <section class="slider-section">
                <img src="https://dummyimage.com/500x200">
              </section>
              <section class="slider-section">
                <img src="https://dummyimage.com/500x200">
              </section>
          </div>
          <div class="btn-left"><i class='bx bx-chevron-left'></i></div>
          <div class="btn-right"><i class='bx bx-chevron-right'></i></div>
        </div>
      </section>
      <section class="gallery">
        <div class="infoGallery">
          <h2>Lorem ipsum dolor sit amet</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet ex fringilla, aliquam massa at, sollicitudin nibh. Pellentesque porta neque a varius fermentum. Donec eleifend nunc nec rutrum faucibus. Nunc sem lorem, luctus nec dui in, viverra ultrices ipsum. Vivamus dictum quam augue, non porttitor odio auctor sed. Curabitur finibus mi consectetur laoreet porttitor. Vestibulum vel ullamcorper neque, convallis dictum arcu. Aenean congue ultricies faucibus.</p>
        </div>
        <div class="galleryContainer">
          <div class="item-1">
            <img src="https://dummyimage.com/200x300&text=1" />
          </div>
          <div class="item-2">
            <img src="https://dummyimage.com/200x300&text=2" />
          </div>
          <div class="item-3">
            <img src="https://dummyimage.com/200x300&text=3" />
          </div>
          <div class="item-4">
            <img src="https://dummyimage.com/200x300&text=4" />
          </div>
        </div>
      </section>
      <section class="information">
        <div class="informationText">
          <h2>Lorem ipsum dolor sit amet</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet ex fringilla, aliquam massa at, sollicitudin nibh. Pellentesque porta neque a varius fermentum. Donec eleifend nunc nec rutrum faucibus. Nunc sem lorem, luctus nec dui in, viverra ultrices ipsum. Vivamus dictum quam augue, non porttitor odio auctor sed. Curabitur finibus mi consectetur laoreet porttitor. Vestibulum vel ullamcorper neque, convallis dictum arcu. Aenean congue ultricies faucibus.</p>
        </div>
        <div class="informationImg">
          <img src="https://dummyimage.com/600x700" />
        </div>
      </section>
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