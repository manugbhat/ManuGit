package com.storemanager.store.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.storemanager.store.dao.StoreDAO;
import com.storemanager.store.model.CheckOut;
import com.storemanager.store.model.CheckinForm;
import com.storemanager.store.model.ClientHistory;
import com.storemanager.store.model.PieChartData;

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

	public List fetchClientHistory() {
		List<Object[]> objArr =  (List<Object[]>) dao.fetchClientHistory();
		List<ClientHistory> history = new ArrayList<ClientHistory>();
		for(Object[] result : objArr ) {
			Long totalIn = (Long)result[0];
			String clientName = (String)result[1];
			ClientHistory client = new ClientHistory();
			client.setClientName(clientName);
			client.setTotalIn(totalIn);
			history.add(client);
		}
		return history;
	}
	
	public List getChartData(){
		List<Object[]> objArr = (List<Object[]>) dao.getChartData();
		List<PieChartData> data = new ArrayList<PieChartData>();
		for(Object[] result : objArr){
			 Long products = (Long)result[0];
			 String type = (String)result[1];
			PieChartData chartData = new PieChartData(type, products);
			data.add(chartData);
		}
		return data;
	}

}
