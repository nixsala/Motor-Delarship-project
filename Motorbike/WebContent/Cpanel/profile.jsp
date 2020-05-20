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
<%@include file="header.jsp" %>
<title>Bike | Profile</title>
</head>

<%

String id = request.getParameter("id");
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/motorbike","root","1234");
	  Statement stmt=con.createStatement();
	  ResultSet rs=stmt.executeQuery("select * from user where id = '"+id+"'");
	  while(rs.next()){
	  
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
                        <h2>Profile<span>.</span></h2>
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
                    <form action="updates" class="contact-form">
                        <div class="row">
						
						
                            <div class="col-lg-6">
                                <input type="text" value="First Name" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("firstname"));  %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" value="Last name" readonly>        
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("lastname"));  %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" value="Phone Number" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("phoneNumber"));  %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" value="Mail" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("email"));  %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" value="License Number" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("LicenseNumber"));  %>" readonly>
                            </div>
							
							<div class="col-lg-6">
                                <input type="text" value="Address" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("CurrentAddress"));  %>" readonly>
                            </div>
                            
                            <div class="col-lg-6">
                                <input type="text" value="Password" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("password"));  %>" readonly>
                            </div>
                            
                            <div class="col-lg-6">
                                <input type="text" value="Admin" readonly>
                            </div>
                            <div class="col-lg-6">
                                <input type="text" value="<% out.print(session.getAttribute("isAdmin"));  %>" readonly>
                            </div>
                            <div class="col-lg-12">
                                
                            </div>
                            <div class="col-lg-12 text-right">
                               <% out.println("<a href='updates?id= "+id+"'> Update/Edit </a>"); %>
                                <% out.println("<a href='delete?id= "+id+"'> Delete </a>"); %>
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