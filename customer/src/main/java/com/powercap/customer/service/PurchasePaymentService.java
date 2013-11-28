package com.powercap.customer.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.stereotype.Service;

import com.powercap.customer.dao.DBConnector;

@Service
public class PurchasePaymentService {
	
	public void createPayment(PurchasePayment payment) throws SQLException, ParseException
	{
		String serviceSQL = "insert into payments(purchaseid,dateofpayment,amount,cashorchek,datenextpay) values (?,?,?,?,?)";
		Connection conn = DBConnector.getConnection();
		PreparedStatement stmt = conn.prepareStatement(serviceSQL, Statement.RETURN_GENERATED_KEYS);
		
		stmt.setInt(1, payment.getPurchaseId());
		
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date pdate=null;
		if(payment.getDateofPayment() == null)
		{
			stmt.setNull(2, java.sql.Types.DATE);
		}
		
		else
		{
			pdate = df.parse(payment.getDateofPayment().toString());
			java.sql.Date payDate = new Date(pdate.getTime());
			stmt.setDate(2, payDate);
		}
		stmt.setDouble(3, payment.getAmount());
		if(payment.getCashorcheck() == null || "".equals(payment.getCashorcheck()))
		{
			stmt.setNull(4,java.sql.Types.VARCHAR );
		} 
		else stmt.setString(4, payment.getCashorcheck());
		
		if(pdate != null)
		{
			GregorianCalendar cal = (GregorianCalendar) GregorianCalendar.getInstance();
			cal.setTime(pdate);
			cal.add(GregorianCalendar.DAY_OF_MONTH, 22);
			java.sql.Date nextpaydate = new Date(cal.getTime().getTime());
			stmt.setDate(5, nextpaydate);
		}
		else
			stmt.setNull(5, java.sql.Types.DATE);
		
		/*if(payment.getChecqueNo() == null || "".equals(payment.getChecqueNo()))
		{
			stmt.setNull(5, java.sql.Types.VARCHAR );
		}
		else stmt.setString(5, payment.getChecqueNo());*/
		stmt.executeUpdate();
		conn.close();
	}
	public List<PurchasePayment> getPayments(int purchaseId) throws SQLException
	{
		String purchaseSQL = "select dateofpayment,amount,cashorchek from payments where purchaseid = ?";
		Connection conn = DBConnector.getConnection();
		PreparedStatement stmt = conn.prepareStatement(purchaseSQL, Statement.RETURN_GENERATED_KEYS);
		List<PurchasePayment> payments = new ArrayList<PurchasePayment>();
		PurchasePayment payment = new PurchasePayment();
		stmt.setInt(1,purchaseId);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next())
		{
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			payment.setPurchaseId(purchaseId);
			payment.setDateofPayment(df.format(rs.getDate("dateofpayment")));
			payment.setAmount(rs.getDouble("amount"));
			payment.setCashorcheck(rs.getString("cashorchek"));
			//payment.setChecqueNo(rs.getString("checqueno"));
			payments.add(payment);
		}
			
		conn.close();
		return payments;
		
		
	}
	
	public List<CustomerPurchase> getPaymentReminders() throws SQLException
	{
		String duePaySql="select cust.customerid,cust.name from customer cust,purchases pch,payments pay where " +
						 "cust.customerid=pch.customerid and pch.purchaseid = pay.purchaseid and current_date <= pay.datenextpay";
		Connection conn = DBConnector.getConnection();
		PreparedStatement stmt = conn.prepareStatement(duePaySql);
		List<CustomerPurchase> duecustomers = new ArrayList<CustomerPurchase>();
		ResultSet rs = stmt.executeQuery();
		while (rs.next())
		{
			CustomerPurchase customer = new CustomerPurchase();
			customer.setCustomerId(rs.getInt(1));
			customer.setCustomerName(rs.getString(2));
			duecustomers.add(customer);
		}
		conn.close();
		return duecustomers;
	}
	

}
