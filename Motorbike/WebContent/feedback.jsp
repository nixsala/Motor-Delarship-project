<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<%@include file="header.jsp" %>>
<title>Bike | feedback</title>
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
                        <h2>feedback ! <span>.</span></h2>
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
                    <form action="" method = "POST" class="contact-form">
                        <div class="row">
                            <div class="col-lg-6">
                                <input type="text" name = "FirstName" placeholder="First Name">
                            </div>
                            <div class="col-lg-6">
                                <input type="text" name = "LastName" placeholder="Last Name">
                            </div>
                            <div class="col-lg-12">
                                <input type="email" name = "Email" placeholder="E-mail">
                                <input type="text" name = "Subject"  placeholder="Subject">
                                <textarea name = "Message" placeholder="Message"></textarea>
                            </div>
                            <div class="col-lg-12 text-right">
                                <button type="submit" name = "Submit" type = "Submit" >Send message</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-3 offset-lg-1">
                    <div class="contact-widget">
                        <div class="cw-item">
                            <h5>Location</h5>
                            <ul>
                                <li>KKS Road Lane, </li>
                                <li>Jaffna , Srilanka</li>
                            </ul>
                        </div>
                        <div class="cw-item">
                            <h5>Phone</h5>
                            <ul>
                                <li>+94 (077)022-1046</li>
                                <li>+94 (077)332-4655</li>
                            </ul>
                        </div>
                        <div class="cw-item">
                            <h5>E-mail</h5>
                            <ul>
                                <li>nixie27@gmail.com</li>
                                <li>www.Motorbikeride.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="map">
                <div class="row">
                    <div class="col-lg-12">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26440.72384129847!2d-118.24906619231132!3d34.06719475913053!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c659f50c318d%3A0xe2ffb80a9d3820ae!2sChinatown%2C%20Los%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1570213740685!5m2!1sen!2sbd"
                            height="560" style="border:0;" ></iframe>
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
	String FirstName = request.getParameter("FirstName");
	String LastName = request.getParameter("LastName");
	String Email = request.getParameter("Email");
	String Subject = request.getParameter("Subject");
	String Message = request.getParameter("Message");
	out.println(LastName);
	String MailAddress = request.getParameter("MailAddress");
	

  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/motorbike","root","");
	  Statement stmt=con.createStatement();
	  stmt.executeUpdate("INSERT INTO feedback (`FirstName`,`LastName`,`Email`,`Subject`,`Message`) VALUES ('"+FirstName+"', '"+LastName+"', '"+Email+"', '"+Subject+"', '"+Message+"');");
	  response.sendRedirect("");
  }catch(Exception e){ out.println(e); System.err.println("Got an exception!");
  System.err.println(e.getMessage());response.sendRedirect("feedback");}
	
  }

%>

</html>