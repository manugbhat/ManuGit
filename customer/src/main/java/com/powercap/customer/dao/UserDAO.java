package com.powercap.customer.dao;

import com.powercap.customer.exceptions.NoDBException;

public interface UserDAO {
	
	public boolean doLogin(String user,String password) throws NoDBException;
	
}
