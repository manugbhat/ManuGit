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
import java.util.List;

import org.springframework.stereotype.Service;

import com.powercap.customer.dao.DBConnector;

@Service
public class CustomerServiceService {
	
	public void createCustomerService(CustomerService service) throws SQLException, ParseException
	{
		String serviceSQL = "insert into service(servicename,dateofservice,servicecharge,datenextservice,customerid) values (?,?,?,?,?)";
		Connection conn = DBConnector.getConnection();
		PreparedStatement stmt = conn.prepareStatement(serviceSQL, Statement.RETURN_GENERATED_KEYS);
		
		if(service.getServiceName() == null || "".equals(service.getServiceName()))
		{
			stmt.setNull(1, java.sql.Types.VARCHAR);
		}
		else
		{
			stmt.setString(1, service.getServiceName());
		}
		/*if(service.getServiceDescription() == null || "".equals(service.getServiceDescription()))
		{
			stmt.setNull(2, java.sql.Types.VARCHAR);
		}
		else stmt.setString(2, service.getServiceDescription());*/
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		if(service.getDateofService() == null )
		{
			stmt.setNull(2, java.sql.Types.DATE);
		}
		else 
		{
			java.util.Date servicedate = df.parse(service.getDateofService().toString());
			java.sql.Date servDate = new Date(servicedate.getTime());
			stmt.setDate(2, servDate);
		}
		stmt.setDouble(3, service.getServiceCharge());
		if(service.getDateofNextService() == null)
		{
			stmt.setNull(4, java.sql.Types.DATE);
		}
		else 
		{
			java.util.Date duedate = df.parse(service.getDateofNextService().toString());
			java.sql.Date nxtdueDate = new Date(duedate.getTime());
			stmt.setDate(4, nxtdueDate);
		}
		stmt.setInt(5, service.getCustomerId());
		stmt.executeUpdate();
		conn.close();
	}
	
	public List<CustomerService> getCustomerServices(String customerId) throws SQLException
	{
		List<CustomerService> services = new ArrayList<CustomerService>();
		String serviceSQL = "select servicename,dateofservice,servicecharge,datenextservice from service where customerid = ?";
		CustomerService service = new CustomerService();
		Connection conn = DBConnector.getConnection();
		PreparedStatement stmt = conn.prepareStatement(serviceSQL);
		stmt.setInt(1, Integer.parseInt(customerId));
		
		ResultSet rs = stmt.executeQuery();
		while(rs.next())
		{
			service.setServiceName(rs.getString("servicename"));
			//service.setServiceDescription(rs.getString("servicedescription"));
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			service.setDateofService(df.format(rs.getDate("dateofservice")));
			service.setServiceCharge(rs.getDouble("servicecharge"));
			service.setDateofNextService(df.format(rs.getDate("datenextservice")));
			service.setCustomerId(Integer.parseInt(customerId));
			services.add(service);
		}
		conn.close();
		return services;
		
	}
	
	public List getDueCustomers() throws SQLException
	{
		String duecustSQL = "select customerid from service where current_date <= datenextservice";
		List duecustomers = new ArrayList();
		Connection conn=DBConnector.getConnection();
		PreparedStatement stmt = conn.prepareStatement(duecustSQL);
		ResultSet rs = stmt.executeQuery();
		while(rs.next())
		{
			duecustomers.add(rs.getInt(1));
		}
		conn.close();
		return duecustomers;
	}

}
