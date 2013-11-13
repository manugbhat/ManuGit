package com.powercap.customer.service;

import com.powercap.customer.exceptions.NoDBException;

public interface UserService {
	
	public boolean doLogin(String user,String password) throws NoDBException;
	
	
}
