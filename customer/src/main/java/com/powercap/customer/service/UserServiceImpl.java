package com.powercap.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.powercap.customer.service.UserService;
import com.powercap.customer.dao.*;
import com.powercap.customer.exceptions.NoDBException;


@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDAO user;
	
	@Override
	public boolean doLogin(String username, String password) throws NoDBException {
		return user.doLogin(username,password);
	}

}
