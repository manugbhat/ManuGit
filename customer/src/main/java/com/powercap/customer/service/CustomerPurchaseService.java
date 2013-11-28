package com.powercap.customer.service;

import java.io.IOException;
import java.sql.Blob;
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

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.powercap.customer.dao.DBConnector;

@Service
public class CustomerPurchaseService {
	@Autowired
	PurchasePaymentService paymentService;
	//public void createCustomerPurchase(List<CustomerPurchase> custPurchases, CommonsMultipartFile photo) throws SQLException, ParseException, IOException{
	public void createCustomerPurchase(List<CustomerPurchase> custPurchases) throws SQLException, ParseException, IOException{
		int customerId = 0 ;
		for (CustomerPurchase custPurchase : custPurchases)
		{
			if(customerId == 0) //If customer is not created , i.e first execution of loop
			{
				//String custSQL = "insert into customer(name,dealername,address,emailid,phonenum1,phonenum2,photograh) values (?,?,?,?,?,?)";
				String custSQL = "insert into customer(name,dealername,address,emailid,phonenum1,phonenum2) values (?,?,?,?,?,?)";
				Connection conn = DBConnector.getConnection();
				PreparedStatement stmt = conn.prepareStatement(custSQL, Statement.RETURN_GENERATED_KEYS);
				if(custPurchase.getCustomerName() == null || "".equals(custPurchase.getCustomerName()))
				{
					stmt.setNull(1, java.sql.Types.VARCHAR);
				}
				else
				{
					stmt.setString(1, custPurchase.getCustomerName());
				}
				if(custPurchase.getDealerName() == null || "".equals(custPurchase.getDealerName()))
				{
					stmt.setNull(2, java.sql.Types.VARCHAR);
				}
				else
				{
					stmt.setString(2, custPurchase.getDealerName());
				}
				if(custPurchase.getCustomerAddress() == null || "".equals(custPurchase.getCustomerAddress()))
				{
					stmt.setNull(3, java.sql.Types.VARCHAR);
				}
				else
				{
					stmt.setString(3, custPurchase.getCustomerAddress());
				}
				if(custPurchase.getCustomerEmail() == null || "".equals(custPurchase.getCustomerEmail()))
				{
					stmt.setNull(4, java.sql.Types.VARCHAR);
				}
				else
				{
					stmt.setString(4, custPurchase.getCustomerEmail());
				}
				if(custPurchase.getCustomerPhone1() == null || "".equals(custPurchase.getCustomerPhone1()))
				{
					stmt.setNull(5, java.sql.Types.VARCHAR);
				}
				
				else
				{
					stmt.setString(5,custPurchase.getCustomerPhone1());
				}
				if(custPurchase.getCustomerPhone2() == null || "".equals(custPurchase.getCustomerPhone2()))
				{
					stmt.setNull(6, java.sql.Types.VARCHAR);
				}
				else
				{
					stmt.setString(6, custPurchase.getCustomerPhone2());
				}
								
				//stmt.setBlob(7, photo.getInputStream());
				stmt.executeUpdate();
				ResultSet rgen = stmt.getGeneratedKeys();
				
				while (rgen.next())
				{
					customerId = rgen.getInt(1);
					System.out.println("Customer Id "+customerId);
					custPurchase.setCustomerId(customerId);
				}
				conn.close();
			}
			String productSQL = "insert into PURCHASED_PRODUCT (NAME,MODEL,PRODTYPE,ATTRIBNAME,ATTRIBVALUE) values (?,?,?,?,?)";
			Connection conn1 = DBConnector.getConnection();
			PreparedStatement pstmt1 = conn1.prepareStatement(productSQL,Statement.RETURN_GENERATED_KEYS);
			pstmt1.setString(1, custPurchase.getProdName());
			pstmt1.setString(2, custPurchase.getProdmodel());
			pstmt1.setString(3, custPurchase.getProductType());
			pstmt1.setString(4, custPurchase.getProdAttribute());
			pstmt1.setString(5, custPurchase.getProdAttribvalue());
			pstmt1.executeUpdate();
			ResultSet rs=pstmt1.getGeneratedKeys();
			int productId = 0;
			while(rs.next())
			{
				productId = rs.getInt(1);
				System.out.println("Product Id "+productId);
			}
			conn1.close();
			
			String purchaseSQL = "insert into purchases(estunitrate,estquantity,estvat,estdiscount,esttotal,finalunitrate,finalquantity,finalvat,finaldiscount,finaltotal,customerid,productid," +
					"amount,balance,warranty,freeservice,dateoforder,dateofsupply,dateofinstallation,billno,orderformno,contactno,estbalance) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Connection conn2 = DBConnector.getConnection();
			PreparedStatement pstmt = conn2.prepareStatement(purchaseSQL,Statement.RETURN_GENERATED_KEYS);
			if(custPurchase.getEstimatedunitRate() == 0d)
			{
				pstmt.setNull(1, java.sql.Types.DOUBLE);
			}
			else
			{
				pstmt.setDouble(1, custPurchase.getEstimatedunitRate());
			}
			if(custPurchase.getEstimatedQuant() == 0)
			{
				pstmt.setNull(2, java.sql.Types.INTEGER);
			}
			else
			{
				pstmt.setInt(2, custPurchase.getEstimatedQuant());
			}
			if(custPurchase.getEstimatedvat() == 0d)
			{
				pstmt.setNull(3, java.sql.Types.DOUBLE);
			}
			else
			{
				pstmt.setDouble(3, custPurchase.getEstimatedvat());
			}
			if(custPurchase.getEstimateddiscount() == 0d)
			{
				pstmt.setNull(4, java.sql.Types.DOUBLE);
			}
			else
			{
				pstmt.setDouble(4,custPurchase.getEstimateddiscount());
			}
			
			if(custPurchase.getEstimatedtotal() == 0d)
			{
				pstmt.setNull(5, java.sql.Types.DOUBLE);
			}
			else
			{
				pstmt.setDouble(5, custPurchase.getEstimatedtotal());
			}
			
			if(custPurchase.getFinalunitRate() == 0d)
			{
				pstmt.setNull(6, java.sql.Types.DOUBLE);
			}
			else
			{
				pstmt.setDouble(6, custPurchase.getFinalunitRate());
			}
			
			if(custPurchase.getFinalQuant() == 0d)
			{
				pstmt.setNull(7, java.sql.Types.DOUBLE);
			}
			else
			{
				pstmt.setDouble(7, custPurchase.getFinalQuant());
			}
			
			if(custPurchase.getFinalvat() == 0d)
			{
				pstmt.setNull(8, java.sql.Types.DOUBLE);
			}
			else
			{
				pstmt.setDouble(8, custPurchase.getFinalvat());
			}
			
			if(custPurchase.getFinaldiscount() == 0d)
			{
				pstmt.setNull(9, java.sql.Types.DOUBLE);
			}
			else
			{
				pstmt.setDouble(9,custPurchase.getFinaldiscount());
			}
			
			if(custPurchase.getFinaltotal() == 0d)
			{
				pstmt.setNull(10, java.sql.Types.DOUBLE);
			}
			else
			{
				pstmt.setDouble(10,custPurchase.getFinaltotal());
			}
			
			pstmt.setInt(11,customerId);
			pstmt.setInt(12,productId);
			pstmt.setDouble(13, custPurchase.getFinaltotal());
			pstmt.setDouble(14, custPurchase.getFinalbalance());
			if(custPurchase.getWarranty() == 0)
			{
				pstmt.setNull(15, java.sql.Types.INTEGER);
			}
			else
			{
				pstmt.setInt(15, custPurchase.getWarranty());
			}
			
			if(custPurchase.getFreeService() == 0)
			{
				pstmt.setNull(16, java.sql.Types.INTEGER);
			}
			else
			{
				pstmt.setInt(16, custPurchase.getFreeService());
			}
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			if(custPurchase.getDateofOrder() == null)
			{
				pstmt.setNull(17, java.sql.Types.DATE);
			}
			else
			{
				java.util.Date orderdate = df.parse(custPurchase.getDateofOrder().toString());
				java.sql.Date ordDate = new Date(orderdate.getTime());
				pstmt.setDate(17, ordDate);
			}
			if(custPurchase.getDateofSupply() == null)
			{
				pstmt.setNull(18, java.sql.Types.DATE);
			}
			else
			{
				java.util.Date supdate = df.parse(custPurchase.getDateofSupply());
				java.sql.Date supDate = new Date(supdate.getTime());
				pstmt.setDate(18, supDate);
			}
			
			if(custPurchase.getDateofInstall() == null)
			{
				pstmt.setNull(19, java.sql.Types.DATE);
			}
			else
			{
				java.util.Date instdate = df.parse(custPurchase.getDateofInstall());
				java.sql.Date installDate = new Date(instdate.getTime());
				pstmt.setDate(19, installDate);
				
			}
			if(custPurchase.getBillno() == null)
			{
				pstmt.setNull(20, java.sql.Types.VARCHAR);
			}
			else
			{
				pstmt.setString(20, custPurchase.getBillno());
				
			}
			if(custPurchase.getOrderformno() == null)
			{
				pstmt.setNull(21, java.sql.Types.VARCHAR);
			}
			else
			{
				pstmt.setString(21, custPurchase.getOrderformno());
				
			}
			if(custPurchase.getContactno() == null)
			{
				pstmt.setNull(22, java.sql.Types.VARCHAR);
			}
			else
			{
				pstmt.setString(22, custPurchase.getContactno());
				
			}
			pstmt.setDouble(23, custPurchase.getEstbalance());
			pstmt.executeUpdate();
			ResultSet rs2 = pstmt.getGeneratedKeys();
			int purchaseId = 0;
			while(rs2.next()) {
				purchaseId = rs2.getInt(1);
				System.out.println("Purchase Id "+purchaseId);
			}
			conn2.close();
			List<PurchasePayment> payments = custPurchase.getPayments();
			for(PurchasePayment payment : payments) {
				payment.setPurchaseId(purchaseId);
				paymentService.createPayment(payment);
			}
		}
		
	}

	public List<CustomerPurchase> getCustomerPurchases(String customerId) throws SQLException, ParseException {
			String custSQL = "";
			if(StringUtils.isNumeric(customerId)) {
				 custSQL = "select name,customerid,dealername,address,emailid,phonenum1,phonenum2 from customer where customerid = ?";
			}
			else {
				custSQL = "select name,customerid,dealername,address,emailid,phonenum1,phonenum2 from customer where name like ?";
			}
			
			String purchaseSQL = "select purchaseid,billno,orderformno,contactno,estunitrate,estquantity,estvat,estdiscount,esttotal,finalunitrate,finalquantity,finalvat,finaldiscount,finaltotal,productid," +
								 "amount,balance,warranty,freeservice,dateoforder,dateofsupply,dateofinstallation,estbalance from purchases where customerid = ?";
			boolean customerFilled = false;
			List <CustomerPurchase>customerPurchases = new ArrayList<CustomerPurchase>();
			CustomerPurchase customerPurchase = new CustomerPurchase();
			if(!customerFilled)
			{
				Connection conn = DBConnector.getConnection();
				PreparedStatement stmt = conn.prepareStatement(custSQL);
				if(StringUtils.isNumeric(customerId)) {
				stmt.setInt(1, Integer.parseInt(customerId));
				}
				else {
				stmt.setString(1,customerId+"%");
				}
				ResultSet rs = stmt.executeQuery();
				while(rs.next())
				{
					customerPurchase.setCustomerName(rs.getString("name"));
					customerPurchase.setDealerName(rs.getString("dealername"));
					customerPurchase.setCustomerAddress(rs.getString("address"));
					customerPurchase.setCustomerEmail(rs.getString("emailid"));
					customerPurchase.setCustomerPhone1(rs.getString("phonenum1"));
					customerPurchase.setCustomerPhone2(rs.getString("phonenum2"));
					
					customerPurchase.setDealerName(rs.getString("dealername"));
					customerPurchase.setCustomerId(rs.getInt("customerid"));
					
				}
			
				conn.close();
				if(!StringUtils.isNumeric(customerId)) {
					customerPurchases.add(customerPurchase);
					return customerPurchases;
				}
				
			}
			Connection conn1 = DBConnector.getConnection();
			PreparedStatement stmt1 = conn1.prepareStatement(purchaseSQL);
			stmt1.setInt(1, Integer.parseInt(customerId));
			ResultSet rs1 = stmt1.executeQuery();
			
			String productSQL = "select NAME,MODEL,PRODTYPE,ATTRIBNAME,ATTRIBVALUE from PURCHASED_PRODUCT where PRODUCTID = ?";
			
			while(rs1.next())
			{
				if(customerPurchase == null ) customerPurchase = new CustomerPurchase();
				Integer purchaseId = rs1.getInt("purchaseid");
				customerPurchase.setPurchaseid(rs1.getInt("purchaseid"));
				customerPurchase.setEstimatedunitRate(rs1.getDouble("estunitrate"));
				customerPurchase.setEstimatedQuant(rs1.getInt("estquantity"));
				customerPurchase.setEstimatedvat(rs1.getDouble("estvat"));
				customerPurchase.setEstimateddiscount(rs1.getDouble("estdiscount"));
				customerPurchase.setEstimatedtotal(rs1.getDouble("esttotal"));
				customerPurchase.setEstbalance(rs1.getDouble("estbalance"));
				customerPurchase.setFinalunitRate(rs1.getDouble("finalunitrate"));
				customerPurchase.setFinalQuant(rs1.getInt("finalquantity"));
				customerPurchase.setFinalvat(rs1.getDouble("finalvat"));
				customerPurchase.setFinaldiscount(rs1.getDouble("finaldiscount"));
				customerPurchase.setFinaltotal(rs1.getDouble("finaltotal"));
				customerPurchase.setFinalbalance(rs1.getDouble("balance"));
				customerPurchase.setWarranty(rs1.getInt("warranty"));
				customerPurchase.setFreeService(rs1.getInt("freeservice"));
				SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
				customerPurchase.setDateofOrder(df.format(rs1.getDate("dateoforder")));
				customerPurchase.setDateofSupply(df.format(rs1.getDate("dateofsupply")));
				customerPurchase.setDateofInstall(df.format(rs1.getDate("dateofinstallation")));
				customerPurchase.setBillno(rs1.getString("billno"));
				customerPurchase.setOrderformno(rs1.getString("orderformno"));
				customerPurchase.setContactno(rs1.getString("contactno"));
				
				PreparedStatement stmt2 = DBConnector.getConnection().prepareStatement(productSQL);
				stmt2.setInt(1, rs1.getInt("productid"));
				ResultSet rs2 = stmt2.executeQuery();
				while(rs2.next())
				{
					customerPurchase.setProdName(rs2.getString("name"));
					customerPurchase.setProdmodel(rs2.getString("model"));
					customerPurchase.setProductType(rs2.getString("prodtype"));
					customerPurchase.setProdAttribute(rs2.getString("attribname"));
					customerPurchase.setProdAttribvalue(rs2.getString("attribvalue"));
				}
				List<PurchasePayment> payments = paymentService.getPayments(purchaseId);
				customerPurchase.setPayments(payments);
				customerPurchases.add(customerPurchase);
			}
			conn1.close();
			
			
		    	
		
		return customerPurchases;
	}
}
