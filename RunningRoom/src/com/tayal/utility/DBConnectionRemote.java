package com.tayal.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class DBConnectionRemote {
	
	private Connection conn=null;
	private ResultSet res = null;
	
	public Connection getConnection(String server)
	{
		 

		String url = "jdbc:mysql://" + server + ":3306/";
		  String dbName = "rrclient";
		  String driver = "com.mysql.jdbc.Driver";
		  String userName = "replicator"; 
		  String password = "111";
		  
		  
		  try {
			  
		  System.out.println("URL : " + url);  
		  Class.forName(driver).newInstance();
		  
		  //Properties props = new Properties();
		  //props.put("connectTimeout", "5");
		  //conn = DriverManager.getConnection(url,props);
		  conn = DriverManager.getConnection(url+dbName,userName,password);
		  
		  } catch (Exception e) {
			  e.printStackTrace();
			  }
		
		  return conn;
		
	}
	
	

	public ResultSet executeQuery(String query, String server) 
	{
		 Connection conn = null;
		 
		 
		  
		  try {
			  
			  conn = getConnection(server);
			  Statement st = conn.createStatement();
			  res = st.executeQuery(query);
		  
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		  
		  return res;
		
	}


	public int executeUpdate(String query, String server) 
	{
		 Connection conn = null;
		 
		 int val = 0;
		  
		  try {
			  
			  conn = getConnection(server);
			  Statement st = conn.createStatement();
			  
			  val = st.executeUpdate(query);
			  
			  if(val==1)
				  System.out.print("Successfully inserted value");
		  
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		 
		
		
		  return val;
		
	}
	

	public void closeCon()
	{
		 
		  
		  try {
			  
			 conn.close();
			 res.close();
		  
		  } catch (Exception e) {
			  e.printStackTrace();
		  }
		 
		
	}
	

}