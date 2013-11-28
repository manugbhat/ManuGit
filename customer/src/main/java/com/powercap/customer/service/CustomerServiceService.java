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
import java.util.List;

import org.springframework.stereotype.Service;

import com.powercap.customer.dao.DBConnector;

@Service
public class CustomerServiceService {
	
	public void createCustomerService(CustomerService service) throws SQLException, ParseException
	{
		String serviceSQL = "insert into service(servicename,dateofservice,servicecharge,dueinmonths,datenextservice,customerid) values (?,?,?,?,?,?)";
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
		if(service.getDueinmonths() == null)
		{
			stmt.setNull(4, java.sql.Types.INTEGER);
		}
		else 
		{
			stmt.setInt(4, service.getDueinmonths());
		}
		if(service.getDateofNextService() == null)
		{
			stmt.setNull(5, java.sql.Types.DATE);
		}
		else 
		{
			java.util.Date duedate = df.parse(service.getDateofNextService().toString());
			java.sql.Date nxtdueDate = new Date(duedate.getTime());
			stmt.setDate(5, nxtdueDate);
		}
		stmt.setInt(6, service.getCustomerId());
		stmt.executeUpdate();
		conn.close();
	}
	
	public List<CustomerService> getCustomerServices(String customerId) throws SQLException
	{
		List<CustomerService> services = new ArrayList<CustomerService>();
		String serviceSQL = "select servicename,dateofservice,servicecharge,dueinmonths,datenextservice from service where customerid = ?";
		
		Connection conn = DBConnector.getConnection();
		PreparedStatement stmt = conn.prepareStatement(serviceSQL);
		stmt.setInt(1, Integer.parseInt(customerId));
		
		ResultSet rs = stmt.executeQuery();
		while(rs.next())
		{
			CustomerService service = new CustomerService();
			service.setServiceName(rs.getString("servicename"));
			//service.setServiceDescription(rs.getString("servicedescription"));
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			service.setDateofService(df.format(rs.getDate("dateofservice")));
			service.setServiceCharge(rs.getDouble("servicecharge"));
			service.setDueinmonths(rs.getInt("dueinmonths"));
			service.setDateofNextService(df.format(rs.getDate("datenextservice")));
			service.setCustomerId(Integer.parseInt(customerId));
			services.add(service);
		}
		conn.close();
		return services;
		
	}
	
	public List getDueCustomers() throws SQLException
	{
		String duecustSQL = "select customerid,dateofservice from service";
		List duecustomers = new ArrayList();
		Connection conn=DBConnector.getConnection();
		PreparedStatement stmt = conn.prepareStatement(duecustSQL);
		ResultSet rs = stmt.executeQuery();
		while(rs.next())
		{
			java.util.Date dateOfService = rs.getTimestamp("dateofservice");
			Calendar cal = Calendar.getInstance();
			cal.setTime(dateOfService);
			cal.add(Calendar.MONTH, 3);
			
			if(dateOfService != null) {
				Calendar calNow = Calendar.getInstance();
				if(calNow.equals(cal) || calNow.after(cal) ){
					duecustomers.add(rs.getInt("customerid"));
				}
			}
			
		}
		conn.close();
		return duecustomers;
	}
	
	public Integer getCustomersCount() throws SQLException
	{
		String custCountSQL = "select count(customerid) from customer";
		Connection conn=DBConnector.getConnection();
		PreparedStatement stmt = conn.prepareStatement(custCountSQL);
		ResultSet rs = stmt.executeQuery();
		int countOfCustomers = 0;
		while(rs.next())
		{
			countOfCustomers = rs.getInt(1);
		}
		conn.close();
		return countOfCustomers;
	}

}
