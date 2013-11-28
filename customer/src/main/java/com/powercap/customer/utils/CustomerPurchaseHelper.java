package com.powercap.customer.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.powercap.customer.service.CustomerPurchase;
import com.powercap.customer.service.PurchasePayment;

public class CustomerPurchaseHelper {
	
	
	public List<CustomerPurchase> preparePurchase(HttpServletRequest request)
	{
		List<CustomerPurchase> purchases = new ArrayList<CustomerPurchase>();
		CustomerPurchase purchase = null;
		if(request.getParameter("solarcapprod") != null && request.getParameter("solarcapprod").toString().equals("on"))
		{
			purchase = prepareSolarCapPurchase(request);
			purchases.add(purchase);
			
		}
		if(request.getParameter("capitwaterpurpprod") != null && request.getParameter("capitwaterpurpprod").toString().equals("on"))
		{
			purchase = prepareWaterPurifierPurchase(request);
			purchases.add(purchase);
			
		}
		if(request.getParameter("capitledlightpprod") != null && request.getParameter("capitledlightpprod").toString().equals("on"))
		{
			purchase = prepareLEDLightPurchase(request);
			purchases.add(purchase);
			
		}
		if(request.getParameter("capitalupsprod") != null && request.getParameter("capitalupsprod").toString().equals("on"))
		{
			purchase = prepareUPSPurchase(request);
			purchases.add(purchase);
			
		}
		if(request.getParameter("gasgeyserpprod") != null && request.getParameter("gasgeyserpprod").toString().equals("on"))
		{
			purchase = prepareGasGeyserPurchase(request);
			purchases.add(purchase);
			
		}
		if(request.getParameter("solarlightprod") != null && request.getParameter("solarlightprod").toString().equals("on"))
		{
			purchase = prepareSolarLightPurchase(request);
			
		}
		return purchases;
		
	}
	
	private CustomerPurchase prepareSolarLightPurchase(HttpServletRequest request) {
		CustomerPurchase purchase = null;
		purchase = new CustomerPurchase();
		purchase.setCustomerName(request.getParameter("custname"));
		purchase.setDealerName(request.getParameter("dealer"));
		purchase.setCustomerAddress(request.getParameter("custaddress"));
		purchase.setCustomerEmail(request.getParameter("custemail"));
		purchase.setCustomerPhone1(request.getParameter("custphone"));
		purchase.setContactno(request.getParameter("contactno"));
		purchase.setBillno(request.getParameter("billno"));
		purchase.setOrderformno(request.getParameter("orderformno"));
		
		DateFormat df = new SimpleDateFormat();
		purchase.setDateofOrder(request.getParameter("dateoforder").toString());
		purchase.setDateofSupply(request.getParameter("dateofsupply").toString());
		purchase.setDateofInstall(request.getParameter("dateofinstallation").toString());
				
	
	   purchase.setProductType(request.getParameter("capitalsolarlight").toString());
	   purchase.setProdmodel(request.getParameter("capitalsolarlightmodel").toString());
	   purchase.setProdAttribute(request.getParameter("capitalsolarlightbattery").toString());
	   purchase.setProdName("Solar Light");
	   purchase.setWarranty(Integer.parseInt(request.getParameter("solarcapacitywarranty")));
	   purchase.setFreeService(Integer.parseInt(request.getParameter("solarcapacityfreeserv")));
	   
	   purchase.setEstimatedunitRate(request.getParameter("estunitrate")!=null?Double.parseDouble(request.getParameter("estunitrate")):0d);
	   purchase.setEstimatedQuant(request.getParameter("estquantity")!=null?Integer.parseInt(request.getParameter("estquantity")):0);
	   purchase.setEstimatedvat(request.getParameter("estvat")!=null?Double.parseDouble(request.getParameter("estvat")):0d);
	   purchase.setEstimateddiscount((request.getParameter("estdiscount")!=null && !request.getParameter("estdiscount").equals(""))?Double.parseDouble(request.getParameter("estdiscount")):0d);
	   purchase.setEstimatedtotal(request.getParameter("esttotal")!=null?Double.parseDouble(request.getParameter("esttotal")):0d);
	   purchase.setEstbalance(request.getParameter("estbalance")!=null?Double.parseDouble(request.getParameter("estbalance")):0d);
	   
	   purchase.setFinalunitRate(request.getParameter("finalunitrate")!=null?Double.parseDouble(request.getParameter("finalunitrate")):0d);
	   purchase.setFinalQuant(request.getParameter("finalquantity")!=null?Integer.parseInt(request.getParameter("finalquantity")):0);
	   purchase.setFinalvat(request.getParameter("finalvat")!=null?Double.parseDouble(request.getParameter("finalvat")):0d);
	   purchase.setFinaldiscount(request.getParameter("finaldiscount")!=null?Double.parseDouble(request.getParameter("finaldiscount")):0d);
	   purchase.setFinaltotal(request.getParameter("finaltotal")!=null?Double.parseDouble(request.getParameter("finaltotal")):0d);
	   purchase.setFinalbalance(request.getParameter("finalbalance")!=null?Double.parseDouble(request.getParameter("finalbalance")):0d);
	   
	   List<PurchasePayment> payments = new ArrayList<PurchasePayment>();
	   int i = 1;
	   while(true){
		   
		   PurchasePayment payment = new PurchasePayment();
		   if(request.getParameter("lightdateofpayment"+i) == null && 
				   request.getParameter("lightamount"+i) == null &&
				   request.getParameter("lightcashorchek"+i) == null  )
		   {
			   break;
		   }
			payment.setDateofPayment(request.getParameter("lightdateofpayment"+i));
			payment.setAmount(Double.parseDouble(request.getParameter("lightamount"+i)));
			payment.setCashorcheck(request.getParameter("lightcashorchek"+i));
			payments.add(payment);
			i++;
			
	   }
	   	
		purchase.setPayments(payments);
	   
		return purchase;
	}

	private CustomerPurchase prepareGasGeyserPurchase(HttpServletRequest request) {
		CustomerPurchase purchase = null;
		purchase = new CustomerPurchase();
		purchase.setCustomerName(request.getParameter("custname"));
		purchase.setDealerName(request.getParameter("dealer"));
		purchase.setCustomerAddress(request.getParameter("custaddress"));
		purchase.setCustomerEmail(request.getParameter("custemail"));
		purchase.setCustomerPhone1(request.getParameter("custphone"));
		purchase.setContactno(request.getParameter("contactno"));
		purchase.setBillno(request.getParameter("billno"));
		purchase.setOrderformno(request.getParameter("orderformno"));
		
		DateFormat df = new SimpleDateFormat();
		purchase.setDateofOrder(request.getParameter("dateoforder").toString());
		purchase.setDateofSupply(request.getParameter("dateofsupply").toString());
		purchase.setDateofInstall(request.getParameter("dateofinstallation").toString());
				
	
	   purchase.setProdmodel(request.getParameter("capitalgasgeyser").toString());
	   purchase.setProdName("Gas Geyser");
	   purchase.setProductType("Gas Geyser");
	   purchase.setWarranty(Integer.parseInt(request.getParameter("capitalgasgeyserwarranty")));
	   purchase.setFreeService(Integer.parseInt(request.getParameter("capitalgasgeyserfreeserv")));
	   
	   purchase.setEstimatedunitRate(request.getParameter("capitalgasgeyserestunitrate")!=null?Double.parseDouble(request.getParameter("capitalgasgeyserestunitrate")):0d);
	   purchase.setEstimatedQuant(request.getParameter("capitalgasgeyserestquantity")!=null?Integer.parseInt(request.getParameter("capitalgasgeyserestquantity")):0);
	   purchase.setEstimatedvat(request.getParameter("capitalgasgeyserestvat")!=null?Double.parseDouble(request.getParameter("capitalgasgeyserestvat")):0d);
	   purchase.setEstimateddiscount((request.getParameter("capitalgasgeyserestdiscount")!=null && !request.getParameter("capitalgasgeyserestdiscount").equals(""))?Double.parseDouble(request.getParameter("capitalgasgeyserestdiscount")):0d);
	   purchase.setEstimatedtotal(request.getParameter("capitalgasgeyseresttotal")!=null?Double.parseDouble(request.getParameter("capitalgasgeyseresttotal")):0d);
	   purchase.setEstbalance(request.getParameter("capitalgasgeyserestbalance")!=null?Double.parseDouble(request.getParameter("capitalgasgeyserestbalance")):0d);
	   
	   purchase.setFinalunitRate(request.getParameter("capitalgasgeyserfinalunitrate")!=null?Double.parseDouble(request.getParameter("capitalgasgeyserfinalunitrate")):0d);
	   purchase.setFinalQuant(request.getParameter("capitalgasgeyserfinalquantity")!=null?Integer.parseInt(request.getParameter("capitalgasgeyserfinalquantity")):0);
	   purchase.setFinalvat(request.getParameter("capitalgasgeyserfinalvat")!=null?Double.parseDouble(request.getParameter("capitalgasgeyserfinalvat")):0d);
	   purchase.setFinaldiscount((request.getParameter("capitalgasgeyserfinaldiscount")!=null && !request.getParameter("capitalgasgeyserfinaldiscount").equals(""))?Double.parseDouble(request.getParameter("capitalgasgeyserfinaldiscount")):0d);
	   purchase.setFinaltotal(request.getParameter("capitalgasgeyserfinaltotal")!=null?Double.parseDouble(request.getParameter("capitalgasgeyserfinaltotal")):0d);
	   purchase.setFinalbalance(request.getParameter("capitalgasgeyserfinalbalance")!=null?Double.parseDouble(request.getParameter("capitalgasgeyserfinalbalance")):0d);
	   
	   List<PurchasePayment> payments = new ArrayList<PurchasePayment>();
	   int i = 1;
	   while(true){
		   
		   PurchasePayment payment = new PurchasePayment();
		   if(request.getParameter("geyserdateofpayment"+i) == null && 
				   request.getParameter("geyseramount"+i) == null &&
				   request.getParameter("geysercashorchek"+i) == null  )
		   {
			   break;
		   }
			payment.setDateofPayment(request.getParameter("geyserdateofpayment"+i));
			payment.setAmount(Double.parseDouble(request.getParameter("geyseramount"+i)));
			payment.setCashorcheck(request.getParameter("geysercashorchek"+i));
			payments.add(payment);
			i++;
			
	   }
	   	
		purchase.setPayments(payments);
	   
		return purchase;
	}

	private CustomerPurchase prepareUPSPurchase(HttpServletRequest request) {
		CustomerPurchase purchase = null;
		purchase = new CustomerPurchase();
		purchase.setCustomerName(request.getParameter("custname"));
		purchase.setDealerName(request.getParameter("dealer"));
		purchase.setCustomerAddress(request.getParameter("custaddress"));
		purchase.setCustomerEmail(request.getParameter("custemail"));
		purchase.setCustomerPhone1(request.getParameter("custphone"));
		purchase.setContactno(request.getParameter("contactno"));
		purchase.setBillno(request.getParameter("billno"));
		purchase.setOrderformno(request.getParameter("orderformno"));
		
		DateFormat df = new SimpleDateFormat();
		purchase.setDateofOrder(request.getParameter("dateoforder").toString());
		purchase.setDateofSupply(request.getParameter("dateofsupply").toString());
		purchase.setDateofInstall(request.getParameter("dateofinstallation").toString());
				
	
	   purchase.setProductType(request.getParameter("capitalups").toString());
	   purchase.setProdName("Capital UPS");
	   purchase.setProdmodel(request.getParameter("capitalupsmodel").toString());
	   purchase.setWarranty(Integer.parseInt(request.getParameter("capitalupswarranty")));
	   purchase.setProdAttribute("Battery");
	   purchase.setProdAttribvalue(request.getParameter("capitalupsbattery").toString());
	   purchase.setFreeService(Integer.parseInt(request.getParameter("capitalupsfreeserv")));
	   
	   purchase.setEstimatedunitRate(request.getParameter("capitalupsestunitrate")!=null?Double.parseDouble(request.getParameter("capitalupsestunitrate")):0d);
	   purchase.setEstimatedQuant(request.getParameter("capitalupsestquantity")!=null?Integer.parseInt(request.getParameter("capitalupsestquantity")):0);
	   purchase.setEstimatedvat(request.getParameter("capitalupsestvat")!=null?Double.parseDouble(request.getParameter("capitalupsestvat")):0d);
	   purchase.setEstimateddiscount((request.getParameter("capitalupsestdiscount")!=null && !request.getParameter("capitalupsestdiscount").equals(""))?Double.parseDouble(request.getParameter("capitalupsestdiscount")):0d);
	   purchase.setEstimatedtotal(request.getParameter("capitalupsesttotal")!=null?Double.parseDouble(request.getParameter("capitalupsesttotal")):0d);
	   purchase.setEstbalance(request.getParameter("capitalupsestbalance")!=null?Double.parseDouble(request.getParameter("capitalupsestbalance")):0d);
	   
	   purchase.setFinalunitRate(request.getParameter("capitalupsfinalunitrate")!=null?Double.parseDouble(request.getParameter("capitalupsfinalunitrate")):0d);
	   purchase.setFinalQuant(request.getParameter("capitalupsfinalquantity")!=null?Integer.parseInt(request.getParameter("capitalupsfinalquantity")):0);
	   purchase.setFinalvat(request.getParameter("capitalupsfinalvat")!=null?Double.parseDouble(request.getParameter("capitalupsfinalvat")):0d);
	   purchase.setFinaldiscount((request.getParameter("capitalupsfinaldiscount")!=null && !request.getParameter("capitalupsfinaldiscount").equals(""))?Double.parseDouble(request.getParameter("capitalupsfinaldiscount")):0d);
	   purchase.setFinaltotal(request.getParameter("capitalupsfinaltotal")!=null?Double.parseDouble(request.getParameter("capitalupsfinaltotal")):0d);
	   purchase.setFinalbalance(request.getParameter("capitalupsfinalbalance")!=null?Double.parseDouble(request.getParameter("capitalupsfinalbalance")):0d);
	   
	   List<PurchasePayment> payments = new ArrayList<PurchasePayment>();
	   int i = 1;
	   while(true){
		   
		   PurchasePayment payment = new PurchasePayment();
		   if(request.getParameter("upsdateofpayment"+i) == null && 
				   request.getParameter("upsamount"+i) == null &&
				   request.getParameter("upscashorchek"+i) == null  )
		   {
			   break;
		   }
			payment.setDateofPayment(request.getParameter("upsdateofpayment"+i));
			payment.setAmount(Double.parseDouble(request.getParameter("upsamount"+i)));
			payment.setCashorcheck(request.getParameter("upscashorchek"+i));
			payments.add(payment);
			i++;
			
	   }
	   	
		purchase.setPayments(payments);
	   
		return purchase;
	}

	private CustomerPurchase prepareLEDLightPurchase(HttpServletRequest request) {
		CustomerPurchase purchase = null;
		purchase = new CustomerPurchase();
		purchase.setCustomerName(request.getParameter("custname"));
		purchase.setDealerName(request.getParameter("dealer"));
		purchase.setCustomerAddress(request.getParameter("custaddress"));
		purchase.setCustomerEmail(request.getParameter("custemail"));
		purchase.setCustomerPhone1(request.getParameter("custphone"));
		purchase.setContactno(request.getParameter("contactno"));
		purchase.setBillno(request.getParameter("billno"));
		purchase.setOrderformno(request.getParameter("orderformno"));
		
		DateFormat df = new SimpleDateFormat();
		purchase.setDateofOrder(request.getParameter("dateoforder").toString());
		purchase.setDateofSupply(request.getParameter("dateofsupply").toString());
		purchase.setDateofInstall(request.getParameter("dateofinstallation").toString());
		
		Map <String,String>typequantmap = prepareTypeQuantMap(request);
		for(Map.Entry<String, String> entry: typequantmap.entrySet()) {
			purchase.setProductType(entry.getKey()+"#"+entry.getValue());
		}
	   purchase.setProdName("Capital LED Light");
	   purchase.setProdmodel(request.getParameter("capitalledmodel").toString());
	   purchase.setWarranty(request.getParameter("capitalledwarranty")!=null?Integer.parseInt(request.getParameter("capitalledwarranty")):0);
	   purchase.setFreeService(request.getParameter("capitalledfreeserv")!=null?Integer.parseInt(request.getParameter("capitalledfreeserv")):0);
	   
	   purchase.setEstimatedunitRate(request.getParameter("capitalledestunitrate")!=null?Double.parseDouble(request.getParameter("capitalledestunitrate")):0d);
	   purchase.setEstimatedQuant(request.getParameter("capitalledestquantity")!=null?Integer.parseInt(request.getParameter("capitalledestquantity")):0);
	   purchase.setEstimatedvat(request.getParameter("capitalledestvat")!=null?Double.parseDouble(request.getParameter("capitalledestvat")):0d);
	   purchase.setEstimateddiscount((request.getParameter("capitalledestdiscount")!=null && !request.getParameter("capitalledestdiscount").equals(""))?Double.parseDouble(request.getParameter("capitalledestdiscount")):0d);
	   purchase.setEstimatedtotal(request.getParameter("capitalledesttotal")!=null?Double.parseDouble(request.getParameter("capitalledesttotal")):0d);
	   purchase.setEstbalance(request.getParameter("capitalledestbalance")!=null?Double.parseDouble(request.getParameter("capitalledestbalance")):0d);
	   
	   purchase.setFinalunitRate(request.getParameter("capitalledfinalunitrate")!=null?Double.parseDouble(request.getParameter("capitalledfinalunitrate")):0d);
	   purchase.setFinalQuant(request.getParameter("capitalledfinalquantity")!=null?Integer.parseInt(request.getParameter("capitalledfinalquantity")):0);
	   purchase.setFinalvat(request.getParameter("capitalledfinalvat")!=null?Double.parseDouble(request.getParameter("capitalledfinalvat")):0d);
	   purchase.setFinaldiscount((request.getParameter("capitalledfinaldiscount")!=null && !request.getParameter("capitalledfinaldiscount").equals(""))?Double.parseDouble(request.getParameter("capitalledfinaldiscount")):0d);
	   purchase.setFinaltotal(request.getParameter("capitalledfinaltotal")!=null?Double.parseDouble(request.getParameter("capitalledfinaltotal")):0d);
	   purchase.setFinalbalance(request.getParameter("capitalledfinalbalance")!=null?Double.parseDouble(request.getParameter("capitalledfinalbalance")):0d);
	   
	   List<PurchasePayment> payments = new ArrayList<PurchasePayment>();
	   int i = 1;
	   while(true){
		   
		   PurchasePayment payment = new PurchasePayment();
		   if(request.getParameter("leddateofpayment"+i) == null && 
				   request.getParameter("ledamount"+i) == null &&
				   request.getParameter("ledcashorchek"+i) == null  )
		   {
			   break;
		   }
			payment.setDateofPayment(request.getParameter("leddateofpayment"+i));
			payment.setAmount(Double.parseDouble(request.getParameter("ledamount"+i)));
			payment.setCashorcheck(request.getParameter("ledcashorchek"+i));
			payments.add(payment);
			i++;
			
	   }
	   	
		purchase.setPayments(payments);
	   
	   
		return purchase;
	}

	private Map<String,String> prepareTypeQuantMap(HttpServletRequest request) {
		String[] types = request.getParameterValues(("capitalled"));
		Map<String,String> typeQuantMap = new HashMap<String,String>();
		if(types == null || types.length == 0) 
		{
			return Collections.EMPTY_MAP;
		}
		StringBuilder quantParams = new StringBuilder();
		for(int i = 0 ; i < types.length ; i++) 
		{
			String param = request.getParameter(getParam(types[i]));
			quantParams.append(param).append(",");
			
		}
		typeQuantMap.put(StringUtils.join(types, ","), quantParams.toString());
		return typeQuantMap;
		
	}
	
	private String getParam(String type)
	{
		StringBuilder param = new StringBuilder();
		param.append("ledquant");
		param.append(type);
		return param.toString();
	}

	private CustomerPurchase prepareWaterPurifierPurchase(HttpServletRequest request) {
		CustomerPurchase purchase = null;
		purchase = new CustomerPurchase();
		purchase.setCustomerName(request.getParameter("custname"));
		purchase.setDealerName(request.getParameter("dealer"));
		purchase.setCustomerAddress(request.getParameter("custaddress"));
		purchase.setCustomerEmail(request.getParameter("custemail"));
		purchase.setCustomerPhone1(request.getParameter("custphone"));
		purchase.setContactno(request.getParameter("contactno"));
		purchase.setBillno(request.getParameter("billno"));
		purchase.setOrderformno(request.getParameter("orderformno"));
		
		DateFormat df = new SimpleDateFormat();
		purchase.setDateofOrder(request.getParameter("dateoforder").toString());
		purchase.setDateofSupply(request.getParameter("dateofsupply").toString());
		purchase.setDateofInstall(request.getParameter("dateofinstallation").toString());
				
	
	   purchase.setProdmodel(request.getParameter("capitalwaterpure").toString());
	   purchase.setProdName("Capital Water Purifier");
	   purchase.setProductType("Capital Water Purifier");
	  /* purchase.setProdmodel(request.getParameter("solarcapacitymodel").toString());
	   purchase.setProdAttribute(request.getParameter("solarcapacitycladding").toString());*/
	   purchase.setWarranty(request.getParameter("capitalwaterpurewarranty")!=null ? Integer.parseInt(request.getParameter("capitalwaterpurewarranty")):0);
	   purchase.setFreeService(request.getParameter("capitalwaterpurefreeserv")!=null? Integer.parseInt(request.getParameter("capitalwaterpurefreeserv")):0);
	   
	   purchase.setEstimatedunitRate(request.getParameter("waterpurestunitrate")!=null ? Double.parseDouble(request.getParameter("waterpurestunitrate")):0d);
	   purchase.setEstimatedQuant(request.getParameter("waterpurestquantity")!=null ? Integer.parseInt(request.getParameter("waterpurestquantity")):0);
	   purchase.setEstimatedvat(request.getParameter("waterpurestvat")!=null?Double.parseDouble(request.getParameter("waterpurestvat")):0d);
	   purchase.setEstimateddiscount((request.getParameter("waterpurestdiscount")!=null && !request.getParameter("waterpurestdiscount").equals(""))?Double.parseDouble(request.getParameter("waterpurestdiscount")):0d);
	   purchase.setEstimatedtotal(request.getParameter("waterpuresttotal")!=null?Double.parseDouble(request.getParameter("waterpuresttotal")):0d);
	   purchase.setEstbalance(request.getParameter("waterpurestbalance")!=null?Double.parseDouble(request.getParameter("waterpurestbalance")):0d);
	   
	   purchase.setFinalunitRate(request.getParameter("waterpurfinalunitrate")!=null?Double.parseDouble(request.getParameter("waterpurfinalunitrate")):0d);
	   purchase.setFinalQuant(request.getParameter("waterpurfinalquantity")!=null?Integer.parseInt(request.getParameter("waterpurfinalquantity")):0);
	   purchase.setFinalvat(request.getParameter("waterpurfinalvat")!=null?Double.parseDouble(request.getParameter("waterpurfinalvat")):0d);
	   purchase.setFinaldiscount((request.getParameter("waterpurfinaldiscount")!=null && !request.getParameter("waterpurfinaldiscount").equals(""))?Double.parseDouble(request.getParameter("waterpurfinaldiscount")):0d);
	   purchase.setFinaltotal(request.getParameter("waterpurfinaltotal")!=null?Double.parseDouble(request.getParameter("waterpurfinaltotal")):0d);
	   purchase.setFinalbalance(request.getParameter("waterpurfinalbalance")!=null?Double.parseDouble(request.getParameter("waterpurfinalbalance")):0d);
	   
	   List<PurchasePayment> payments = new ArrayList<PurchasePayment>();
	   int i = 1;
	   while(true){
		   
		   PurchasePayment payment = new PurchasePayment();
		   if(request.getParameter("waterdateofpayment"+i) == null && 
				   request.getParameter("wateramount"+i) == null &&
				   request.getParameter("watercashorchek"+i) == null  )
		   {
			   break;
		   }
			payment.setDateofPayment(request.getParameter("waterdateofpayment"+i));
			payment.setAmount(Double.parseDouble(request.getParameter("wateramount"+i)));
			payment.setCashorcheck(request.getParameter("watercashorchek"+i));
			payments.add(payment);
			i++;
			
	   }
	   	
		purchase.setPayments(payments);
	   
		return purchase;
	}

	public CustomerPurchase prepareSolarCapPurchase(HttpServletRequest request)
	{
		CustomerPurchase purchase = null;
		purchase = new CustomerPurchase();
		purchase.setCustomerName(request.getParameter("custname"));
		purchase.setDealerName(request.getParameter("dealer"));
		purchase.setCustomerAddress(request.getParameter("custaddress"));
		purchase.setCustomerEmail(request.getParameter("custemail"));
		purchase.setCustomerPhone1(request.getParameter("custphone"));
		purchase.setContactno(request.getParameter("contactno"));
		purchase.setBillno(request.getParameter("billno"));
		purchase.setOrderformno(request.getParameter("orderformno"));
		
		DateFormat df = new SimpleDateFormat();
		purchase.setDateofOrder(request.getParameter("dateoforder").toString());
		purchase.setDateofSupply(request.getParameter("dateofsupply").toString());
		purchase.setDateofInstall(request.getParameter("dateofinstallation").toString());
				
	
	   purchase.setProductType(request.getParameter("solarcapacity").toString());
	   purchase.setProdmodel(request.getParameter("solarcapacitymodel").toString());
	   purchase.setProdAttribute("O Cladding");
	   purchase.setProdName("Solar Capacity");
	   purchase.setProdAttribvalue(request.getParameter("solarcapacitycladding").toString());
	   
	   purchase.setWarranty(request.getParameter("solarcapacitywarranty")!=null?Integer.parseInt(request.getParameter("solarcapacitywarranty")):0);
	   purchase.setFreeService(request.getParameter("solarcapacityfreeserv")!=null?Integer.parseInt(request.getParameter("solarcapacityfreeserv")):0);
	   
	   purchase.setEstimatedunitRate((request.getParameter("solarestunitrate")!=null && !request.getParameter("solarestunitrate").equals(""))?Double.parseDouble(request.getParameter("solarestunitrate")):0d);
	   purchase.setEstimatedQuant((request.getParameter("solarestquantity")!=null && !request.getParameter("solarestquantity").equals(""))?Integer.parseInt(request.getParameter("solarestquantity")):0);
	   purchase.setEstimatedvat((request.getParameter("solarestvat")!=null && !request.getParameter("solarestvat").equals(""))?Double.parseDouble(request.getParameter("solarestvat")):0d);
	   purchase.setEstimateddiscount((request.getParameter("solarestdiscount")!=null && !request.getParameter("solarestdiscount").equals(""))?Double.parseDouble(request.getParameter("solarestdiscount")):0d);
	   purchase.setEstimatedtotal((request.getParameter("solaresttotal")!=null && !request.getParameter("solaresttotal").equals(""))?Double.parseDouble(request.getParameter("solaresttotal")):0d);
	   purchase.setEstbalance((request.getParameter("solarestbalance")!=null && !request.getParameter("solarestbalance").equals(""))?Double.parseDouble(request.getParameter("solarestbalance")):0d);
	   
	   purchase.setFinalunitRate((request.getParameter("solarfinalunitrate")!=null && !request.getParameter("solarfinalunitrate").equals(""))?Double.parseDouble(request.getParameter("solarfinalunitrate")):0d);
	   purchase.setFinalQuant((request.getParameter("solarfinalquantity")!=null && !request.getParameter("solarfinalquantity").equals(""))?Integer.parseInt(request.getParameter("solarfinalquantity")):0);
	   purchase.setFinalvat((request.getParameter("solarfinalvat")!=null && !request.getParameter("solarfinalvat").equals(""))?Double.parseDouble(request.getParameter("solarfinalvat")):0d);
	   purchase.setFinaldiscount((request.getParameter("solarfinaldiscount")!=null && !request.getParameter("solarfinaldiscount").equals(""))?Double.parseDouble(request.getParameter("solarfinaldiscount")):0d);
	   purchase.setFinaltotal(request.getParameter("solarfinaltotal")!=null?Double.parseDouble(request.getParameter("solarfinaltotal")):0d);
	   purchase.setFinalbalance(request.getParameter("solarfinalbalance")!=null?Double.parseDouble(request.getParameter("solarfinalbalance")):0d);
	   
	   System.out.println(request.getParameter("solardateofpayment1"));
	   List<PurchasePayment> payments = new ArrayList<PurchasePayment>();
	   int i = 1;
	   while(true){
		   
		   PurchasePayment payment = new PurchasePayment();
		   if(request.getParameter("solardateofpayment"+i) == null && 
				   request.getParameter("solaramount"+i) == null &&
				   request.getParameter("solarcashorchek"+i) == null  )
		   {
			   break;
		   }
			payment.setDateofPayment(request.getParameter("solardateofpayment"+i));
			payment.setAmount(Double.parseDouble(request.getParameter("solaramount"+i)));
			payment.setCashorcheck(request.getParameter("solarcashorchek"+i));
			payments.add(payment);
			i++;
			
	   }
	   	
		purchase.setPayments(payments);
		return purchase;
	}

}
