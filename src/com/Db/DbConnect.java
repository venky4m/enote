package com.Db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {
	private static Connection conn;
	public static Connection getConn() throws SQLException 
	{
		if(conn==null)
		{
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn= DriverManager.getConnection(  
						"jdbc:oracle:thin:@localhost:1521:xe","college","1");  
				
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			}
			
		}
		return conn;
		
	}
}
