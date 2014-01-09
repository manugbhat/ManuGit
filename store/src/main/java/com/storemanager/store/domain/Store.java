package com.storemanager.store.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="STORE")
public class Store {
	
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

}
