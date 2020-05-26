<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="zxx">


<head>
<%@include file="header.jsp" %>
<title>Bike | Booking</title>
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
                        <h2>Bike | Booking form<span>.</span></h2>
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
                                <input type="text" name = "fullname" placeholder="Full name ">
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name = "currentaaddress" placeholder="Current Address">
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name = "arrivaldesination" placeholder="Arrival Desination">
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name = "departuredesination" placeholder="Departure Desination">
                            </div>
							<div class="col-lg-6">
                                <input type="text" name = "nicnumber" placeholder="NIC Number">
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name = "numofdays" placeholder="Now Of Days">
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name = "phonenumber" placeholder="Phone Number">
                            </div>
                            <div class="col-lg-12 text-right">
                                <button type="submit" name = "Submit" >Book Now !</button>
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




<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>

<% 
if(request.getParameterMap().containsKey("Submit")){ //JSP code starting from here
	String fullname = request.getParameter("fullname");
	String currentnaddress = request.getParameter("currentaaddress");
	String nicnumber = request.getParameter("nicnumber");
	String numofdays = request.getParameter("numofdays");
	String phonenumber = request.getParameter("phonenumber");
	
	String arrivaldesination = request.getParameter("arrivaldesination");
	String departuredesination = request.getParameter("departuredesination");
	
	
	String bikename = (String)session.getAttribute("bikename");
	String bikeid = (String) session.getAttribute("bikeid");
	String rentermail = (String) session.getAttribute("username");
	String renterlisence = (String) session.getAttribute("LicenseNumber");
	String bikenumber = (String) session.getAttribute("bikenumber");
	String rentcost = (String) session.getAttribute("price");
	session.setAttribute("numofdays",numofdays);

  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/motorbike","root","");
	  Statement stmt=con.createStatement();
	  stmt.executeUpdate("INSERT INTO bikerent (`fullname`,`currentnaddress`,`nicnumber`,`numofdays`,`rentdate`,`rentermail`, `renterlisence`,`bikename`,`bikeid`,`rentcost`,`bikenumber`,`phonenumber`,`arrivaldesination`,`departuredesination`) VALUES  ('"+fullname+"', '"+currentnaddress+"', '"+nicnumber+"', '"+numofdays+"',CURRENT_TIMESTAMP, '"+rentermail+"', '"+renterlisence+"', '"+bikename+"', '"+rentcost+"', '"+bikeid+"' , '"+bikenumber+"','"+phonenumber+"',,'"+arrivaldesination+"',,'"+departuredesination+"');");
	  con.close();
	  response.sendRedirect("payment");
  }catch(Exception e){
	  System.out.println("You have an error"+e); response.sendRedirect("tourbook");} 
  }

%>

</html>