<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<%@include file="header.jsp" %>
<title>Bike | Register</title>
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
                    <a href="./index"><img src="img/logo.jpg" alt=""></a>
                </div>
                <div class="header-right">
                    <img src="img/icons/search.png" alt="" class="search-trigger">
                    
                    <a href="login">
						<img src="img/icons/man.png" alt="">
                        <img src="img/icons/bag.png" alt="">
                        <span>2</span>
                    </a>
                </div>
                <div class="user-access">
                    <a href="register">Register</a>
                    <a href="login" class="in">Sign in</a>
                </div>
                <nav class="main-menu mobile-menu">
                    <ul>
                        <li><a class="active" href="./index">Home</a></li>
                        <li><a href="./bike">Bike</a>
                            
                        </li>
                        <li><a href="index">About</a></li>
                         
                        <li><a  href="./feedback">Review</a></li>
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
                        <h2>REGISTER<span>.</span></h2>
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
                    <form action="#" class="contact-form">
                        <div class="row">
                            <div class="col-lg-6">
                                <input type="text" name = "FirstName" placeholder="First Name" required>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name = "LastName" placeholder="Last Name" required>
                            </div>
                            <div class="col-lg-12">
                                <input type="email" name = "Email" placeholder="E-mail" required>
                                <input type="text" name = "PhoneNumber" placeholder="Phone Number" required>
								<input type="text" name = "LicenseNumber" placeholder="License Number" required>
								<input type="text" name = "CurrentAddress" placeholder="Current Address" required>
								<input type="text" name = "PassWord" placeholder="Enter Password " required>
								<input type="text" name = "C_PassWord" placeholder="Re - Password" required>
                                
                            </div>
                            <div class="col-lg-12 text-right">
                                <button name = "Submit" type="submit">Register</button>
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

<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
if(request.getParameterMap().containsKey("Submit")){ //JSP code starting from here 
	String FirstName = request.getParameter("FirstName");
	String LastName = request.getParameter("LastName");
	String Email = request.getParameter("Email");
	String PhoneNumber = request.getParameter("PhoneNumber");
	String LicenseNumber = request.getParameter("LicenseNumber");
	String CurrentAddress = request.getParameter("CurrentAddress");
	String Password = request.getParameter("PassWord");

  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/motorbike","root","");
	  Statement stmt=con.createStatement();
	  stmt.executeUpdate("INSERT INTO user (`firstName`,`lastName`,`email`,`password`,`isAdmin`,`phoneNumber`,`LicenseNumber`,`CurrentAddress`) VALUES ('"+FirstName+"', '"+LastName+"', '"+Email+"', '"+Password+"', 'NO', '"+PhoneNumber+"', '"+LicenseNumber+"', '"+CurrentAddress+"');");
	  session.setAttribute("firstname",FirstName);  
	  session.setAttribute("lastname",LastName);  
	  session.setAttribute("username",Email); 
	  con.close();
	  response.sendRedirect("client");
  }catch(Exception e){ out.println(e); response.sendRedirect("register");}
	
  }

%>

