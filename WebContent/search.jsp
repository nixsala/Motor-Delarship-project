<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>

<!DOCTYPE html>
<html lang="zxx">


<%
String search = request.getParameter("search");
if(search!= null && request.getParameterMap().containsKey("send")){
									switch(search) {
										
										case "Honda CBR250R":
										case "honda cbr250r":
										case "honda cbr250":
										case "honda cbr 250r":
										response.sendRedirect("product.jsp?id=1");
								    // code block
								    	break;
								    	
										case "Honda Dio":
										case "Dio":
										case "dio ":
										case "honda dio":
											response.sendRedirect("product.jsp?id=2");
									    // code block
									    	break;
									    
										case "KTM Duke 200":
										case "ktm duke 200":
										case "duke200 ":
										case "duke 200":
											response.sendRedirect("product.jsp?id=3");
									    // code block
									    	break;
									
										case "NS 200":
										case "ns200":
										case "pulser ns200":
										case "pulser ns 200":
											response.sendRedirect("product.jsp?id=4");
									    // code block
									    	break;
										case "RS 200":
										case "rs200":
										case "pulser rs200":
										case "pulser rs 200":
											response.sendRedirect("product.jsp?id=5");
									    // code block
									    	break;
										case "royal enfield classic 350":
										case "Royal Enfield":
										case "royal enfield":
										case "Royal enfeild":
											response.sendRedirect("product.jsp?id=6");
										    // code block
										    break;
										   
										case "Yamaha R15":
										case "R15":
										case "r15":
										case "yamaha r15":
											response.sendRedirect("product.jsp?id=7");
									    // code block
									    	break;										
									    
										case "Yamaha Fasino":
										case "fasino":
										case "yamaha fasino":
										case "fasino yamaha":
											response.sendRedirect("product.jsp?id=8");
									    // code block
									    	break;
									    
										
									  default:
									    // code block
									}
	
}

%>
<head>
<%@include file="header.jsp" %>
<title>Bike | Ride log</title>
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
			<form action = "search" method = "POST" class="search-model-form">
				<input type="text" name = "search" id="search-input" placeholder="Enter the bike name">
				<input type="submit" name = "send" id="search-input" value = "Search here...">
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
                        <h2>Ride log<span>.</span></h2>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    <!-- Page Add Section End -->

    <!-- Contact Section Begin -->
    <div class="contact-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <form action="index" method = "POST" class="contact-form">
                        <div class="row">
						<p><b> Invalid bike name you entered </b></p>
                            
                            <div class="col-lg-12">
                                
                            </div>
                            <div class="col-lg-12 text-right"> 
                                <button type="submit" name = "" > Go to home</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="contact-widget">
                        <div class="cw-item">
                            <h5>Location</h5>
                            <ul>
                                <li>1525 Awesome Lane, </li>
                                <li>Los Angeles, CA</li>
                            </ul>
                        </div>
                        <div class="cw-item">
                            <h5>Phone</h5>
                            <ul>
                                <li>+1 (603)535-4592</li>
                                <li>+1 (603)535-4556</li>
                            </ul>
                        </div>
                        <div class="cw-item">
                            <h5>E-mail</h5>
                            <ul>
                                <li>contact@violetstore.com</li>
                                <li>www.violetstore.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="map">
                <div class="row">
                    <div class="col-lg-12">
                        
                </div>
            </div>
        </div>
    </div>
 </div>
    <!-- Contact Section End -->

    <!-- Footer Section Begin -->
<%@include file="footer.jsp" %>
    <!-- Footer Section End -->
</body>
</html>