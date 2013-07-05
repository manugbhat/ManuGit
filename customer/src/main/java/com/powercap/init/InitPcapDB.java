package com.powercap.init;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.powercap.customer.dao.DBConnector;

public class InitPcapDB {

	private static final String createUserQuery = "CREATE TABLE USERS (" +
											"EMP_NO INTEGER," +
											"FIRST_NAME VARCHAR(50)," +
											"LAST_NAME VARCHAR(100)," +
											"USER_NAME VARCHAR(30)," +
											"PASSWORD VARCHAR(10))";
	
	private static final String createcustomerQuery = "CREATE TABLE CUSTOMER"+
														"("+ 
														 "NAME VARCHAR(50),"+
														 "CUSTOMERID VARCHAR(50),"+
														 "DEALERNAME VARCHAR(50),"+
														 "ADDRESS VARCHAR(500),"+
														 "EMAILID VARCHAR(70),"+
														 "PHONENUM1 VARCHAR(20),"+
														 "PHONENUM2 VARCHAR(20),"+
														 "PHOTOGRAPH BLOB"+
														 ")";
	private static final String createPurchasesQuery = "CREATE TABLE PURCHASES" +
														"(" +
														"PURCHASEID BIGINT," +
														"ESTUNITRATE DOUBLE PRECISION," +
														"ESTQUANTITY INT," +
														"ESTVAT DOUBLE PRECISION," +
														"ESTDISCOUNT DOUBLE PRECISION," +
														"ESTTOTAL DOUBLE PRECISION," +
														"FINALUNITRATE DOUBLE PRECISION," +
														"FINALQUANTITY INT," +
														"FINALVAT DOUBLE PRECISION," +
														"FINALDISCOUNT DOUBLE PRECISION," +
														"FINALTOTAL DOUBLE PRECISION," +
														"CUSTOMERID VARCHAR(50)," +
														"PRODUCTID VARCHAR(50)," +
														"AMOUNT DOUBLE PRECISION," +
														"BALANCE DOUBLE PRECISION" +
														")";
	public static void main(String args[])
	{
		java.sql.Connection conn = DBConnector.getConnection();
		try{
		//createUserTable(conn);
		//createCustomerTable(conn);
		//createPurchaseTable(conn);
			insertRows(conn);
		
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
	}
	private static void insertRows(Connection conn) throws SQLException {
		conn.createStatement().execute("Insert into USERS values (1,'admin','admin','admin','admin')");
		ResultSet rs = conn.createStatement().executeQuery("select * from USERS");
		while(rs.next())
		{
			System.out.println("Emp no : "+rs.getString(1)+"First name :  "+rs.getString(2));
		}
		
		
	}
	private static void createPurchaseTable(Connection conn) throws SQLException {
		Statement stmt = conn.createStatement();
		stmt.execute(createPurchasesQuery);
		System.out.println("Purchase table created successfully");
		stmt.close();
	}
	private static void createCustomerTable(Connection conn) throws SQLException {
		Statement stmt = conn.createStatement();
		stmt.execute(createcustomerQuery);
		System.out.println("Customer table created successfully");
		stmt.close();
	}
	private static void createUserTable(Connection conn) throws SQLException
	{
		Statement stmt = conn.createStatement();
		stmt.execute(createUserQuery);
		System.out.println("Users table created successfully");
		stmt.close();
	}
	
}
