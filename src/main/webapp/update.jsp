<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<%@include file="header.jsp" %>
<title>Bike | Update</title>
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
                        <h2>Update<span>.</span></h2>
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
                                <input type="text" placeholder="First Name" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name="FirstName">		
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" placeholder="Last Name" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name="LastName">
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" placeholder="Phone Number" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="number" name="PhoneNumber">
                            </div>
							
							<div class="col-lg-6">
                                <input type="email" value="Mail" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.println(session.getAttribute("username")); %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" placeholder="License Number" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name="LicenseNumber">
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" placeholder="Address" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name="Address">
                            </div>
                            
                            <div class="col-lg-6">
                                <input type="text" value="Password" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="password" name="Password">
                            </div>
                            
                            <div class="col-lg-6">
                                <input type="text" value="Re Enter Password" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="password" name="REPassword">
                            </div>
							
							
							
                            <div class="col-lg-12">
                                
                            </div>
                            <div class="col-lg-12 text-right">
                                <button type="submit" name = "Submit" >Save/Close</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div>  class="col-lg-3 offset-lg-1">
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


<% 

String username = (String)session.getAttribute("username");
String id="";
try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/motorbike","root","");
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from user where email = '"+username+"'");
	  while(rs.next()){
		  
	  id = rs.getString(1);
	  
	  session.setAttribute("id",rs.getString(1));
	  session.setAttribute("firstname",rs.getString(2));
	  session.setAttribute("lastname",rs.getString(3));
	  session.setAttribute("email",rs.getString(4)); 
	  session.setAttribute("password",rs.getString(5));
	  session.setAttribute("isAdmin",rs.getString(6));
	  session.setAttribute("phoneNumber",rs.getString(7));
	  session.setAttribute("LicenseNumber",rs.getString(8));
	  session.setAttribute("CurrentAddress",rs.getString(9));
	  
	  }

	  con.close();
	  
}catch(Exception e){ System.out.println(e);}



if(request.getParameterMap().containsKey("Submit")){
	String FirstName = request.getParameter("FirstName");
	String LastName = request.getParameter("LastName");
	String PhoneNumber = request.getParameter("PhoneNumber");
	String LicenseNumber = request.getParameter("LicenseNumber");
	String CurrentAddress = request.getParameter("CurrentAddress");
	String Password = request.getParameter("PassWord");
	
	  try {
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/motorbike","root","1234");
		  Statement stmt=con.createStatement();
		  stmt.executeUpdate("UPDATE user SET firstName='"+FirstName+"' ,lastName = '"+LastName+"' ,password = '"+Password+"' ,  isAdmin = 'NO' ,  phoneNumber = '"+PhoneNumber+"' ,  LicenseNumber = '"+LicenseNumber+"' ,  CurrentAddress = '"+CurrentAddress+"'  WHERE id = '"+id+"'");
		   
		  
		  session.setAttribute("firstname",FirstName);  
		  session.setAttribute("lastname",LastName);  
		  session.setAttribute("username",username); 
		  con.close();
		  response.sendRedirect("profile");
	  }catch(Exception e){ System.out.println(e); response.sendRedirect("register");}
	
}
	
	


%>

</html>
