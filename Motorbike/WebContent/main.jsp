
<html>
<head><title>Hello world from JSP</title></head>
<body>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
  try {
	  Class.forName("com.mysql.jdbc.Driver");

	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kirupan","root","1234");
	  //here sonoo is the database name, root is the username and root is the password
	  Statement stmt=con.createStatement();

	  ResultSet rs=stmt.executeQuery("select * from user432");

	  while(rs.next())
	  out.println(rs.getString(1)+"  "+rs.getString(2)+"  "+rs.getString(3));

	  con.close();
 {
	 
%>
    <h3>Name: <%= rs.getString("Name") %></h3>
    <h3>Population: <%= rs.getString("Population") %></h3>
<%  
    }
  }catch(Exception e){ System.out.println(e);}
%>

</body>
</html>