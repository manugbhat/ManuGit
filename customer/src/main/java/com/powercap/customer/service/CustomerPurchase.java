package com.powercap.customer.service;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class CustomerPurchase {

	private String dealerName;
	private String customerName;
	private String customerAddress;
	private String customerEmail;
	private String customerPhone1;
	private String customerPhone2;
	private int customerId;
	private String billno;
	private String orderformno;
	private String contactno;
	private String productType;
	private String prodmodel;
	private String prodAttribute;
	private String prodAttribvalue;
	private String prodName;
	private int purchaseid;
	private int warranty;
	private String battery;
	private int freeService;
	private String batteryModel;
	private String ledLight;
	private String backup;
	private double estimatedunitRate;
	private int estimatedQuant;
	private double estimatedvat;
	private double estimateddiscount;
	private double estimatedtotal;
	private double finalunitRate;
	private String dateofOrder;
	private String dateofSupply;
	private String dateofInstall;
	private int finalQuant;
	private double finalvat;
	private double finaldiscount;
	private double finaltotal;
	private double estbalance;
	private double finalbalance;
	private MultipartFile photo;
	
	
	public int getPurchaseid() {
		return purchaseid;
	}
	public void setPurchaseid(int purchaseid) {
		this.purchaseid = purchaseid;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	public String getDateofOrder() {
		return dateofOrder;
	}
	public void setDateofOrder(String date) {
		this.dateofOrder = date;
	}
	public String getDateofSupply() {
		return dateofSupply;
	}
	public void setDateofSupply(String dateofSupply) {
		this.dateofSupply = dateofSupply;
	}
	public String getDateofInstall() {
		return dateofInstall;
	}
	public void setDateofInstall(String dateofInstall) {
		this.dateofInstall = dateofInstall;
	}
	
	
	public double getFinalunitRate() {
		return finalunitRate;
	}
	public void setFinalunitRate(double finalunitRate) {
		this.finalunitRate = finalunitRate;
	}

	
	public double getEstbalance() {
		return estbalance;
	}
	public void setEstbalance(double estbalance) {
		this.estbalance = estbalance;
	}
	public double getFinalbalance() {
		return finalbalance;
	}
	public void setFinalbalance(double finalbalance) {
		this.finalbalance = finalbalance;
	}
	
	public String getProdAttribute() {
		return prodAttribute;
	}
	public void setProdAttribute(String prodAttribute) {
		this.prodAttribute = prodAttribute;
	}
	public String getDealerName() {
		return dealerName;
	}
	public void setDealerName(String dealerName) {
		this.dealerName = dealerName;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerPhone1() {
		return customerPhone1;
	}
	public void setCustomerPhone1(String customerPhone) {
		this.customerPhone1 = customerPhone;
	}
	public String getCustomerPhone2() {
		return customerPhone2;
	}
	public void setCustomerPhone2(String customerPhone) {
		this.customerPhone2 = customerPhone;
	}
	public String getBillno() {
		return billno;
	}
	public void setBillno(String billno) {
		this.billno = billno;
	}
	public String getOrderformno() {
		return orderformno;
	}
	public void setOrderformno(String orderformno) {
		this.orderformno = orderformno;
	}
	public String getContactno() {
		return contactno;
	}
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
	public String getProductType() {
		return productType;
	}
	public void setProductType(String productType) {
		this.productType = productType;
	}
	public String getProdmodel() {
		return prodmodel;
	}
	public void setProdmodel(String prodmodel) {
		this.prodmodel = prodmodel;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodname) {
		this.prodName = prodname;
	}
	public int getWarranty() {
		return warranty;
	}
	public void setWarranty(int warranty) {
		this.warranty = warranty;
	}
	public String getBattery() {
		return battery;
	}
	public void setBattery(String battery) {
		this.battery = battery;
	}
	public int getFreeService() {
		return freeService;
	}
	public void setFreeService(int freeService) {
		this.freeService = freeService;
	}
	public String getBatteryModel() {
		return batteryModel;
	}
	public void setBatteryModel(String batteryModel) {
		this.batteryModel = batteryModel;
	}
	public String getLedLight() {
		return ledLight;
	}
	public void setLedLight(String ledLight) {
		this.ledLight = ledLight;
	}
	public String getBackup() {
		return backup;
	}
	public void setBackup(String backup) {
		this.backup = backup;
	}
	public double getEstimatedunitRate() {
		return estimatedunitRate;
	}
	public void setEstimatedunitRate(double estimatedunitRate) {
		this.estimatedunitRate = estimatedunitRate;
	}
	public int getEstimatedQuant() {
		return estimatedQuant;
	}
	public void setEstimatedQuant(int estimatedQuant) {
		this.estimatedQuant = estimatedQuant;
	}
	public double getEstimatedvat() {
		return estimatedvat;
	}
	public void setEstimatedvat(double estimatedvat) {
		this.estimatedvat = estimatedvat;
	}
	public double getEstimateddiscount() {
		return estimateddiscount;
	}
	public void setEstimateddiscount(double estimateddiscount) {
		this.estimateddiscount = estimateddiscount;
	}
	public double getEstimatedtotal() {
		return estimatedtotal;
	}
	public void setEstimatedtotal(double estimatedtotal) {
		this.estimatedtotal = estimatedtotal;
	}
	public int getFinalQuant() {
		return finalQuant;
	}
	public void setFinalQuant(int finalQuant) {
		this.finalQuant = finalQuant;
	}
	public double getFinalvat() {
		return finalvat;
	}
	public void setFinalvat(double finalvat) {
		this.finalvat = finalvat;
	}
	public double getFinaldiscount() {
		return finaldiscount;
	}
	public void setFinaldiscount(double finaldiscount) {
		this.finaldiscount = finaldiscount;
	}
	public double getFinaltotal() {
		return finaltotal;
	}
	public void setFinaltotal(double finaltotal) {
		this.finaltotal = finaltotal;
	}
	public String getProdAttribvalue() {
		return prodAttribvalue;
	}
	public void setProdAttribvalue(String prodAttribvalue) {
		this.prodAttribvalue = prodAttribvalue;
	}

	
	
	
}
