<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
<%@include file="header.jsp" %>
<title>Bike | Ride log</title>
</head>
<%

String username = (String)session.getAttribute("username");
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/motorbike","root","");
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from bikerent where rentermail = '"+username+"' ORDER BY rentid DESC LIMIT 1;");
	  boolean val = rs.next(); //next() returns false if there are no-rows retrieved 
      if(val==false){
    	  response.sendRedirect("ride");
       }
	  while(rs.next()){
	  	  
	  session.setAttribute("rentid",rs.getInt(1));
	  session.setAttribute("fullname",rs.getString(2));
	  session.setAttribute("currentnaddress",rs.getString(3));
	  session.setAttribute("nicnumber",rs.getString(4)); 
	  session.setAttribute("numofdays",rs.getString(5));
	  session.setAttribute("rentdate",rs.getTimestamp(6));
	  session.setAttribute("rentermail",rs.getString(7));
	  session.setAttribute("renterlisence",rs.getString(8));
	  session.setAttribute("bikename",rs.getString(9));
	  session.setAttribute("bikeid",rs.getInt(10));
	  session.setAttribute("rentcost",rs.getString(11));
	  session.setAttribute("bikenumber",rs.getString(12));
	  session.setAttribute("phonenumber",rs.getString(13));
	  
	  }

	  con.close();
	  
  }catch(Exception e){ System.out.println(e);}
%>

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
                    <form action="update.html" class="contact-form">
                        <div class="row">
						
                            <div class="col-lg-6">
                                <input type="text" value="Full Name" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("fullname"));  %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" value="Current Address" readonly>        
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("currentnaddress"));  %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" value="NIC Number" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("nicnumber"));  %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" value="Number Of Days" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("numofdays"));  %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" value="Date" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("rentdate"));  %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" value="Name Of Bike" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("bikename"));  %>" readonly>
                            </div>
                            
                            <div class="col-lg-6">
                                <input type="text" value="Bike Number" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("bikenumber"));  %>" readonly>
                            </div>
                            
                            <div class="col-lg-6">
                                <input type="text" value="Cost" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("rentcost"));  %>" readonly>
                            </div>
                            
                            
                            <div class="col-lg-6">
                                <input type="text" value="Phone Number" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("phonenumber"));  %>" readonly>
                            </div>
                            <div class="col-lg-12">
                                
                            </div>
                            <div class="col-lg-12 text-right">
                                <button type="submit" name = "Submit" formaction="">Cancel book / Delete</button>
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


  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/motorbike","root","");
	  Statement stmt=con.createStatement();
	  stmt.executeUpdate("DELETE FROM bikerent WHERE  rentermail = '"+username+"' order by rentid DESC LIMIT 1;");
	  
	  
	  Statement check_connection =con.createStatement();
	  ResultSet rs=check_connection.executeQuery("select * from bikerent where rentermail = '"+username+"' ORDER BY rentid DESC LIMIT 1;");
	  boolean val = rs.next(); //next() returns false if there are no-rows retrieved 
      if(val==false){
    	  response.sendRedirect("ride");
       }
      else{
    	  response.sendRedirect("ridelog");
      }
	  
      con.close();
	  
  }catch(Exception e){ System.out.println(e); response.sendRedirect("ridelog");}
	
  }

%>

</html>