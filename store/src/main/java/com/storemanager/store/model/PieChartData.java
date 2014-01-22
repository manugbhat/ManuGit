package com.storemanager.store.model;

public class PieChartData {
	
	private String producttype;
	
	private Long productbal;
	
	public PieChartData(String type,Long products) {
		producttype = type;
		productbal = products;
	}

	public String getProducttype() {
		return producttype;
	}

	public void setProducttype(String producttype) {
		this.producttype = producttype;
	}

	public Long getProductbal() {
		return productbal;
	}

	public void setProductbal(Long productbal) {
		this.productbal = productbal;
	}
	
	

}
