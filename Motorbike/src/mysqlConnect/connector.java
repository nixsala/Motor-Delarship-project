package mysqlConnect;
import java.sql.*; 
public class connector {
	public static void MysqlQuery() {
		try{
		Class.forName("com.mysql.jdbc.Driver");

		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/motorbike","root","1234");
		//here sonoo is the database name, root is the username and root is the password
		Statement stmt=con.createStatement();

		//ResultSet rs=stmt.executeQuery(Query);

		//while(rs.next())
		//System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3));

		//con.close();
		

		}catch(Exception e){ System.out.println(e);}
		
		//return Query.toLowerCase();

		}

}



