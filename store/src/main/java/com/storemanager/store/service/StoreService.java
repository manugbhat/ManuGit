package com.storemanager.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.storemanager.store.dao.StoreDAO;
import com.storemanager.store.model.CheckOut;
import com.storemanager.store.model.CheckinForm;

@Service
public class StoreService {
	
	@Autowired
	StoreDAO dao;
	
	public void checkinToStore(CheckinForm form) {
		
		dao.checkinToStore(form);
	}
	
	public List<CheckinForm> fetchAllFromStore(){
		
		return dao.fetchAllFromStore();
	}

	public void checkoutFromStore(CheckOut form) {
		
		//CheckinForm entry = dao.getFromStore(form);
		 dao.checkOutFromStore(form);
		
	}

}
