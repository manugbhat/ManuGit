package com.storemanager.store.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="STORE")
public class CheckinForm {
	
	@Id
	@Column(name="ID")
	@GeneratedValue( strategy = GenerationType.AUTO )
	private Long Id;
	
	@Column(name="DATE")
	private String date;
	
	@Column(name="PRODTYPE")
	private String producttype;
	
	@Column(name="CONSIGNEE")
	private String consigneename;
	
	@Column(name="ORDERNO")
	private String ordernumber;
	
	@Column(name="PRODUCT")
	private String productin;
	
	@Column(name="PRODUCTBAL")
	private Long productbalance;
	
	@Column(name="CARRIER")
	private String carriername;
	
	public String getDate() {
		return date;
	}
	public Long getId() {
		return Id;
	}
	public void setId(Long id) {
		Id = id;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getProducttype() {
		return producttype;
	}
	public void setProducttype(String producttype) {
		this.producttype = producttype;
	}
	public String getConsigneename() {
		return consigneename;
	}
	public void setConsigneename(String consigneename) {
		this.consigneename = consigneename;
	}
	public String getOrdernumber() {
		return ordernumber;
	}
	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
	public String getProductin() {
		return productin;
	}
	public void setProductin(String productin) {
		this.productin = productin;
	}
	public Long getProductbalance() {
		return productbalance;
	}
	public void setProductbalance(Long productbalance) {
		this.productbalance = productbalance;
	}
	public String getCarriername() {
		return carriername;
	}
	public void setCarriername(String carrierbame) {
		this.carriername = carrierbame;
	}
	
	
	

}
