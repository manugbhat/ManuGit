package com.powercap.model;

import org.springframework.web.multipart.MultipartFile;

public class UploadFile {
	
	private MultipartFile customerphoto;

	public MultipartFile getCustomerphoto() {
		return customerphoto;
	}

	public void setCustomerphoto(MultipartFile customerphoto) {
		this.customerphoto = customerphoto;
	}

	
	

}
