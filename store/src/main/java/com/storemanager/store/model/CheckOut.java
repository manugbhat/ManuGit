package com.storemanager.store.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CHECKOUT")
public class CheckOut {
	
	

	@Id
	@Column(name="ID")
	@GeneratedValue( strategy = GenerationType.AUTO )
	private Long Id;
	
	@Column(name="DATEOFCHECKOUT")
	private String date;
	
	@Column(name="PRODTYPE")
	private String producttype;
	
	@Column(name="CONSIGNEE")
	private String consigneename;
	
	@Column(name="PONUMBER")
	private String ponumber;
	
	@Column(name="PRODUCTIN")
	private Long productin;
	
	@Column(name="PRODUCTOUT")
	private Long productout;
	
	@Column(name="PRODUCTBAL")
	private Long productbalance;
	
	@Column(name="CARRIER")
	private String carriername;
	
	@Column(name="SKIDWRAPPING")
	private Long skidwrapping;
	
	@Column(name="SKIDCHARGE")
	private Long skidcharge;
	
	@Column(name="SKIDIN")
	private String skidin;
	
	@Column(name="SKIDOUT")
	private String skidout;
	
	@Column(name="STORAGECHARGE")
	private Long storagecharge;
	
	@Column(name="MISCCHARGE")
	private Long misccharge;
	
	@Column(name="TOTALCHARGE")
	private Long totalcharge;
	
	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public String getDate() {
		return date;
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

	public String getPonumber() {
		return ponumber;
	}

	public void setPonumber(String ponumber) {
		this.ponumber = ponumber;
	}

	public Long getProductin() {
		return productin;
	}

	public void setProductin(Long productin) {
		this.productin = productin;
	}

	public Long getProductout() {
		return productout;
	}

	public void setProductout(Long productout) {
		this.productout = productout;
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

	public void setCarriername(String carriername) {
		this.carriername = carriername;
	}

	public Long getSkidwrapping() {
		return skidwrapping;
	}

	public void setSkidwrapping(Long skidwrapping) {
		this.skidwrapping = skidwrapping;
	}

	public Long getSkidcharge() {
		return skidcharge;
	}

	public void setSkidcharge(Long skidcharge) {
		this.skidcharge = skidcharge;
	}

	public String getSkidin() {
		return skidin;
	}

	public void setSkidin(String skidin) {
		this.skidin = skidin;
	}

	public String getSkidout() {
		return skidout;
	}

	public void setSkidout(String skidout) {
		this.skidout = skidout;
	}

	public Long getStoragecharge() {
		return storagecharge;
	}

	public void setStoragecharge(Long storagecharge) {
		this.storagecharge = storagecharge;
	}

	public Long getMisccharge() {
		return misccharge;
	}

	public void setMisccharge(Long misccharge) {
		this.misccharge = misccharge;
	}

	public Long getTotalcharge() {
		return totalcharge;
	}

	public void setTotalcharge(Long totalcharge) {
		this.totalcharge = totalcharge;
	}
	

}
