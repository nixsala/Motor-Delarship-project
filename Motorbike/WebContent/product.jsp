<!DOCTYPE html>
<html lang="zxx">
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>

<%
String bikeNumber = request.getParameter("id");
//out.println(bikeNumber);
String username = (String)session.getAttribute("username");
//out.println(username);
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:127.0.0.1/motorbike","root","1234");
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from bike where bikeid = '"+bikeNumber+"'");
	  while(rs.next()){
	  
	session.setAttribute("bikeid",rs.getString(1));
	  session.setAttribute("availabledays",rs.getString(2));
	  session.setAttribute("price",rs.getString(3));
	  session.setAttribute("bikenumber",rs.getString(4)); 
	  session.setAttribute("biketype",rs.getString(5));
	  session.setAttribute("bikename",rs.getString(6));
	  session.setAttribute("bikebrand",rs.getString(7));
	  session.setAttribute("bikeplace",rs.getString(8));
	  session.setAttribute("description",rs.getString(9));
	  session.setAttribute("distanceallowed",rs.getString(10));
	  
	  }

	  con.close();
	  
	  
  }catch(Exception e){ System.out.println(e); response.sendRedirect("product");}
%>

<head>
<%@include file="header.jsp" %>
<title>Bike | Product</title>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
    <!-- Search model -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search model end -->

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="container-fluid">
            <div class="inner-header">
                <div class="logo">
                    <a href="./client"><img src="img/logo.jpg" alt=""></a>
                </div>
                <div class="header-right">
                    <img src="img/icons/search.png" alt="" class="search-trigger">
                    
                    <a href="profile.jsp">
						<img src="img/icons/man.png" alt="">
                        <img src="img/icons/bag.png" alt="">
                        <span>2</span>
                    </a>
                </div>
                <div class="user-access">
                    <a href="register">login</a>
                    <a href="logout" class="in">logout</a>
                </div>
                <nav class="main-menu mobile-menu">
                    <ul>
                        <li><a class="active" href="./client">Home</a></li>
                        <li><a href="./bookbike">Bike</a>
                            
                        </li>
                        <li><a href="profile">Profile</a></li>
                         
                        <li><a href="./ridelog">Ride logs</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </header>
    <!-- Header Info Begin -->
    <!-- Header Info End -->
    <!-- Header End -->

    <!-- Page Add Section Begin -->
    <section class="page-add">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="page-breadcrumb">
                        <h2>Sport Bike<span>.</span></h2>
                        <a href="#">Home</a>
                        <a href="#">Bike</a>
                        <a class="active" href="#">Available</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Page Add Section End -->

    <!-- Product Page Section Beign -->
    <section class="product-page">
        <div class="container">
            <div class="product-control">
                <a href="#">Previous</a>
                <a href="#">Next</a>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="product-slider owl-carousel">
                        <div class="product-img">
                            <figure>
                                <img src="img/product/product-1.jpg" alt="">
                                <div class="p-status">new</div>
                            </figure>
                        </div>
                        <div class="product-img">
                            <figure>
                                <img src="img/product/product-1.jpg" alt="">
                                <div class="p-status">new</div>
                            </figure>
                        </div>
                    </div>
                    
                </div>
                <div class="col-lg-6">
                    <div class="product-content">
                        <h2><% out.println(session.getAttribute("bikename")); %></h2>
                        <div class="pc-meta">
                            <h5>Cost <% out.println(session.getAttribute("price")); %>.00</h5>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                        </div>
                        <p><% out.println(session.getAttribute("description")); %>.</p>
                        <ul class="tags">
                            <li><span>Category :</span> Sport bike</li>
                            <li><span>Tags :</span> Bike, naked, scopper, off road, adventure</li>
                        </ul>
                        <div class="product-quantity">
                            <div class="pro-qty">
                                <input type="text" name = "days" value="1">
                            </div>
                        </div>
                        <a href="tourbook.jsp" class="primary-btn pc-btn">available</a>
                        <ul class="p-info">
                            <li>Bike Information</li>
                            <li>Reviews</li>
                            <li>Bike Care</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Page Section End -->

    <!-- Related Product Section Begin -->
    <section class="related-product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <h2>Related Products</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="single-product-item">
                        <figure>
                            <a href="#"><img src="img/products/img-1.jpg" alt=""></a>
                            <div class="p-status">new</div>
                        </figure>
                        <div class="product-text">
                            <h6>Honda CBR 250R</h6>
                            <p>2300.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-product-item">
                        <figure>
                            <a href="#"><img src="img/products/img-2.jpg" alt=""></a>
                            <div class="p-status sale">sale</div>
                        </figure>
                        <div class="product-text">
                            <h6>Honda Dio XR</h6>
                            <p>800.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-product-item">
                        <figure>
                            <a href="#"><img src="img/products/img-3.jpg" alt=""></a>
                            <div class="p-status">new</div>
                        </figure>
                        <div class="product-text">
                            <h6>KTM Duke 200</h6>
                            <p>2400.00</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-product-item">
                        <figure>
                            <a href="#"><img src="img/products/img-4.jpg" alt=""></a>
                            <div class="p-status popular">popular</div>
                        </figure>
                        <div class="product-text">
                            <h6>Royal Enfield Classic 350</h6>
                            <p>2500.00</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Related Product Section End -->

    <!-- Footer Section Begin -->
<%@include file="footer.jsp" %>
    <!-- Footer Section End -->
</body>

</html>