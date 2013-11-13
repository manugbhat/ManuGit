package com.powercap.customer.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.apache.derby.iapi.services.property.PropertyUtil;

public class DBConnector {

	static String driver = "org.apache.derby.jdbc.ClientDriver";
	static String dbName="";
	static String url="";
	static Properties prop = new Properties();
	static{
		try {
			System.out.println("loading database properties......");
			prop.load(DBConnector.class.getClassLoader().getResourceAsStream("database.properties"));
			dbName=prop.getProperty("Name");
			url=prop.getProperty("Url");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	static String connectionURL = url + dbName ; 
	private static Connection conn = null;
   
	public static synchronized Connection getConnection(){
		try{
		    Class.forName(driver); 
		    conn = DriverManager.getConnection(connectionURL); 
		    return conn;
		} catch(Exception e) {
		    e.printStackTrace();
		}
		return conn;
	}
	public static void main(String args[]) throws SQLException
	{
		if(getConnection() !=null)System.out.println("connection est.");

		try {
		  /*  conn = DriverManager.getConnection(connectionURL); 

		    //body of code to go herez`
		    Statement st=conn.createStatement();
		   
		    
		    ResultSet rs=st.executeQuery("SELECT * FROM USERS");
		    while (rs.next()){
		        String first=rs.getString("FIRST_NAME");		        String last=rs.getString("LAST_NAME");
		        System.out.println("Name: " + first + " " + last);
		    }
		    rs.close();*/
		    
		    
		}  catch (Throwable e)  {   
		    e.printStackTrace();
		} finally {
		  //  conn.close();
		}


	}
}
