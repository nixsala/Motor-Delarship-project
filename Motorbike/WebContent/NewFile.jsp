<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	try {
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection con=DriverManager.getConnection("jdbc:mysql://localhost/motorbike","root","1234");
		  
		  }catch(Exception e){ out.println(e);}
		  
 %>