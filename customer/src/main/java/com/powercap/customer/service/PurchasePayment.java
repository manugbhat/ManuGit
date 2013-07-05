package com.powercap.customer.service;

public class PurchasePayment {
	
	private int purchaseId;
	private String dateofPayment;
	private double amount;
	private String cashorcheck;
	private String checqueNo;
	public int getPurchaseId() {
		return purchaseId;
	}
	public void setPurchaseId(int purchaseId) {
		this.purchaseId = purchaseId;
	}
	public String getDateofPayment() {
		return dateofPayment;
	}
	public void setDateofPayment(String dateofPayment) {
		this.dateofPayment = dateofPayment;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getCashorcheck() {
		return cashorcheck;
	}
	public void setCashorcheck(String cashorcheck) {
		this.cashorcheck = cashorcheck;
	}
	public String getChecqueNo() {
		return checqueNo;
	}
	public void setChecqueNo(String checqueNo) {
		this.checqueNo = checqueNo;
	}
	

}
