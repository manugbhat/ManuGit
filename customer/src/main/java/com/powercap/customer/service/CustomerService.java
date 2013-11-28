package com.powercap.customer.service;

public class CustomerService {

	private String serviceName;
	private String serviceDescription;
	private String dateofService;
	private double serviceCharge;
	private Integer dueinmonths;
	private String dateofNextService;
	private int customerId;
	
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getServiceDescription() {
		return serviceDescription;
	}
	public void setServiceDescription(String serviceDescription) {
		this.serviceDescription = serviceDescription;
	}
	public String getDateofService() {
		return dateofService;
	}
	public void setDateofService(String dateofService) {
		this.dateofService = dateofService;
	}
	public double getServiceCharge() {
		return serviceCharge;
	}
	public void setServiceCharge(double serviceCharge) {
		this.serviceCharge = serviceCharge;
	}
	public String getDateofNextService() {
		return dateofNextService;
	}
	public void setDateofNextService(String dateofNextService) {
		this.dateofNextService = dateofNextService;
	}
	public Integer getDueinmonths() {
		return dueinmonths;
	}
	public void setDueinmonths(Integer dueinmonths) {
		this.dueinmonths = dueinmonths;
	}
	
	
}
