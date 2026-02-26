package com.tca.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnectivity  {

	
	
	public static Connection getConnection() {
		
//		final String DB_URL="jdbc:mysql://localhost:3306/javaproject";
//		final String DB_USER="root";
//		final String DB_PWD="ajy8805";
//		final String DB_DRIVER="org.postgresql.Driver";

		final String DB_DRIVER="org.postgresql.Driver";
		
		final String DB_URL="jdbc:postgresql://ep-cool-bonus-a1uc73vp-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require";
		final String DB_USER="neondb_owner";
		final String DB_PWD="npg_4CLguOEH3nrF";
	
		System.out.println("Hey ajay :::"+ org.postgresql.Driver.class);
		
		Connection con=null;
		
		try {
            Class.forName(DB_DRIVER);
			con=DriverManager.getConnection(DB_URL,DB_USER,DB_PWD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
		
	}
	
	public static boolean closeConnection(Connection con)
	{
		if(con==null) 
			return false;
		else
		{
			try {
				con.close();
			} catch (SQLException e) {
					
				e.printStackTrace();
				return false;
			}
			
			return true;
		}
	}
	
}
