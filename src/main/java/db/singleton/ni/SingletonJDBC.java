package db.singleton.ni;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SingletonJDBC {

	private static SingletonJDBC instance;
	private Connection con;
	private String url = "jdbc:mysql://localhost:3308/motorbike/";
	private String username = "root";
	private String password = "";

	private SingletonJDBC() throws SQLException {
		try {
			Class.forName("");
			this.con = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException ex) {
			System.out.println("Database Connection Creation Failed : " + ex.getMessage());
		}
	}

	public Connection getConnection() {
		return con;
	}

	public static SingletonJDBC getInstance() throws SQLException {
		if (instance == null) {
			instance = new SingletonJDBC();
		} else if (instance.getConnection().isClosed()) {
			instance = new SingletonJDBC();
		}

		return instance;
	}
}
