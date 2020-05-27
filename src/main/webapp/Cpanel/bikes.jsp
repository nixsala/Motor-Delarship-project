<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>

<%
	String username = (String)session.getAttribute("username");
	String password = (String)session.getAttribute("password");
	try {
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/motorbike","root","1234");
		  Statement stmt=con.createStatement();
		  ResultSet rs=stmt.executeQuery("select * from admin where email = '"+username+"' and password = '"+password+"'" );
		  
		  boolean val = rs.next(); //next() returns false if there are no-rows retrieved 
	      if(val==false){
	    	  response.sendRedirect("admin");
	       }
		  
		  con.close();
	  }catch(Exception e){ out.println(e); response.sendRedirect("login");}
%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<%@include file="../header.jsp" %>
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
                    <a href="">login</a>
                    <a href="logout" class="in">logout</a>
                </div>
                <nav class="main-menu mobile-menu">
                    <ul>
                        <li><a class="active" href="./client">Home</a></li>
                        <li><a href="./bikes">Insert Bike</a>
                            
                        </li>
                        <li><a href="peoples">Peoples</a></li>
                         
                        <li><a href="./ridelogs">Ride logs</a></li>
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
                        <h2>Add New Bikes<span>.</span></h2>
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
                                <input type="text" name = "bikename" placeholder="Bike Name" required>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name = "bikebrand" placeholder="Bike Brand" required>
                            </div>
                            <div class="col-lg-12">
                            	<input type="text" name = "biketype" placeholder="Bike Type" required>		
                            	<input type="text" name = "bikenumber" placeholder="Bike Number" required>
                            	<input type="text" name = "bikeplace" placeholder="Bike Place" required>
                            	
                            	
                                <input type="number" name = "availabledays" placeholder="Available Days" required>
                                <input type="number" name = "price" placeholder="Price" required>
								<input type="number" name = "distanceallowed" placeholder="Distance Allowed" required>
								
								<input type="text" name = "description" placeholder="Enter Description " required>
								
								
								
                                
                            </div>
                            <div class="col-lg-12 text-right">
                                <button name = "Submit" type="submit">Register bike</button>
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
<%@include file="../footer.jsp" %>
    <!-- Footer Section End -->
</body>

</html>

<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
if(request.getParameterMap().containsKey("Submit")){ //JSP code starting from here 
	String bikename = request.getParameter("bikename");
	String bikebrand = request.getParameter("bikebrand");
	String biketype = request.getParameter("biketype");
	String bikenumber = request.getParameter("bikenumber");
	String bikeplace = request.getParameter("bikeplace");
	String availabledays = request.getParameter("availabledays");
	String price = request.getParameter("price");
	String distanceallowed = request.getParameter("distanceallowed");
	String description = request.getParameter("description");
	
	      

  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/motorbike","root","1234");
	  Statement stmt=con.createStatement();
	  stmt.executeUpdate("INSERT INTO `bike` (`bikename`,`bikebrand`,`biketype`,`bikenumber`,`bikeplace`,`availabledays`,`price`,`distanceallowed` ,`description`) VALUES ('"+bikename+"', '"+bikebrand+"', '"+biketype+"', '"+bikenumber+"', '"+bikeplace+"' , '"+availabledays+"', '"+price+"', '"+distanceallowed+"' , '"+description+"');");
	  
	  con.close();
	  response.sendRedirect("admins");
  }catch(Exception e){ System.out.println(e); response.sendRedirect("bikes");}
	
  }

%>

