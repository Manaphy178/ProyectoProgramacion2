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
    <link rel="stylesheet" href="./assets/css/carrousel.css">
    <link rel="stylesheet" href="./assets/css/gallery.css">
    <link rel="stylesheet" href="./assets/css/information.css">
    <link rel="stylesheet" href="./assets/css/productCard.css">
    <link rel="stylesheet" href="./assets/css/productsCarrousel.css">
    <link rel="shortcut icon" href="./assets/img/pcSlotsLogo.ico" type="image/x-icon">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script defer src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script defer src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script defer src="./assets/js/carrousel.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <title>PCSLOTS</title>
</head>
<body>
  <%BDController bd = new BDController();
	ArrayList<Product> cart = bd.allCart();
	ArrayList<Product> pro = bd.allProduct();
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
    <article>
      <section class="carrousel">
        <div class="container-carousel">
          <div class="carruseles" id="slider">
              <section class="slider-section">
                  <img src="./assets/img/index/movilesApple.png">
              </section>
              <section class="slider-section">
                <img src="./assets/img/index/movilSamsung.jpg">
              </section>
              <section class="slider-section">
                <img src="./assets/img/index/movilHuawei.jpg">
              </section>
              <section class="slider-section">
                <img src="./assets/img/index/movilXiaomi.jpg">
              </section>
          </div>
          <div class="btn-left"><i class='bx bx-chevron-left'></i></div>
          <div class="btn-right"><i class='bx bx-chevron-right'></i></div>
        </div>
      </section>
      <section class="gallery">
        <div class="infoGallery">
          <h2>Best brands</h2>
          <p>At our store, you will find an exceptional selection of the best brands for your laptops. We pride ourselves on offering top-quality products that cater to all your computing needs. Whether you're a student, a professional, or a casual user, we have the perfect laptop for you. Our inventory includes the latest models from renowned brands known for their reliability, performance, and innovative features.

            In addition to our diverse range of laptops, we also provide comprehensive customer support to help you make an informed decision. Our knowledgeable staff is always available to answer your questions, provide recommendations, and ensure that you find a laptop that meets your specific requirements.</p>
        </div>
        <div class="galleryContainer">
          <div class="item-1">
            <img src="./assets/img/index/logoMSI.jpg" />
          </div>
          <div class="item-2">
            <img src="./assets/img/index/logoApple.jpg" />
          </div>
          <div class="item-3">
            <img src="./assets/img/index/logoASUS.jpg" />
          </div>
          <div class="item-4">
            <img src="./assets/img/index/logoLenovo.jpg" />
          </div>
        </div>
      </section>
      <section class="topProducts">
      <h2>Top 5 products of the month</h2>
      <!-- Slider main container -->
      <div class="containerProductsCarrousel">
        <div class="swiper mySwiper">
          <!-- Additional required wrapper -->
          <div class="swiper-wrapper">
            <!-- Slides -->
							<%
							Random rand = new Random();
							ArrayList<Product>comprobaciones = new ArrayList<>();
							// Generar y mostrar números aleatorios del ArrayList
							for (int i = 0; i < 8; i++) {
								int randomIndex = rand.nextInt(pro.size());
								Product p = pro.get(randomIndex);
								if(!comprobaciones.contains(p)){
									comprobaciones.add(p);
							%>

							<div class="swiper-slide">
              <div class="productContainer">
                <div class="productCard">
                    <img class="imagenProducto" src="./assets/img/products/<%=p.getIdProduct() %>.png" alt="">
                    <p class="nombre"><%=p.getName() %></p>
                    <h3 class="precio"><%=p.getValue() %>$</h3>
                    <p class="envio">Envio gratis</p>
                   <a href="./shop-single.jsp?codP=<%=p.getIdProduct() %>" style="width:100%"><button class="addCartButton">View product</button></a>
                </div>
            </div>
            </div>
            <%} else{
            	i--;
            }
								} %>
            </div>
          </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script type="module">
          import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs'
          const swiper = new Swiper(".mySwiper", {
              effect: "coverflow",
              grabCursor: false,
              centeredSlides: true,
              autoplay: {
                delay: 3000,
              },
              slidesPerView: "5",
              loop: true,
              coverflowEffect: {
                  depth:500,
                  modifer:1,
                  slidesShadows:true,
                  // rotate:0,
                  // stretch:0
              }
          })
        </script>
      </section>
      <section class="information">
        <div class="informationText">
          <h2>Our computers</h2>
          <p>Our computers are assembled by the best experts in the industry, ensuring that every component works seamlessly for top-notch performance and reliability. Each system undergoes meticulous assembly and rigorous testing, guaranteeing optimal functionality. Additionally, we offer the option to optimize the operating system, enhancing speed and efficiency to meet your specific needs. Whether you’re a gamer, creative professional, or business user, our experts provide personalized recommendations and customization options, such as upgrading memory and storage, to take your computing experience to the next level. Trust us to deliver a perfectly tailored machine that performs at its peak.</p>
        </div>
        <div class="informationImg">
          <img src="./assets/img/index/desktop.webp" />
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