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


String id = request.getParameter("id");


  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/motorbike","root","1234");
	  Statement stmt=con.createStatement();
	  stmt.executeUpdate("DELETE FROM user WHERE  id = '"+id+"'; ");
	  
	  
	  Statement check_connection =con.createStatement();
	  ResultSet rs=check_connection.executeQuery("select * from user where id = '"+id+"'");
	  boolean val = rs.next(); //next() returns false if there are no-rows retrieved 
      if(val==false){
    	  response.sendRedirect("peoples");
       }
      else{
    	  response.sendRedirect("profiles");
      }
	  
      con.close();
	  
  }catch(Exception e){ System.out.println(e); response.sendRedirect("profiles");}
	
  

%>