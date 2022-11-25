package dao;


import java.sql.DriverManager;

import com.mysql.jdbc.Connection;

public class ConnectDB {
	
	static public Connection getConnection() {
		Connection conn = null;
		try {
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Class.forName("com.mysql.jdbc.Driver");
			//conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=PBL3","dqtai","01206149500");
			conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/pbl3", "root", "");
		} catch (Exception e) {e.printStackTrace();System.out.println("ket noi db that bai!");}
		
		return conn;
	}
	
	static public Connection getConnection(String nameClass, String strConnection) {
		Connection conn = null;
		try {
			Class.forName(nameClass);
			conn = (Connection) DriverManager.getConnection(strConnection);
		} catch (Exception e) {e.printStackTrace();}
		return conn;
	}
}
