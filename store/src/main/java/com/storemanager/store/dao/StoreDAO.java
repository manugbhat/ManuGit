package com.storemanager.store.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.storemanager.store.model.CheckOut;
import com.storemanager.store.model.CheckinForm;

@Repository
public class StoreDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Transactional
	public void checkinToStore(CheckinForm form) {
		
		
		if( sessionFactory.getCurrentSession() != null) {
			sessionFactory.getCurrentSession().save(form);
		}
		
	}
	
	@Transactional
	public List<CheckinForm> fetchAllFromStore() {
		
		Query query = sessionFactory.getCurrentSession().createQuery("FROM CheckinForm");
		List store = query.list();
		return store;
		
	}
	
	@Transactional
	public CheckinForm getFromStore(CheckOut form) {
		
		Query query = sessionFactory.getCurrentSession().createQuery("FROM CheckinForm store WHERE store.producttype = :prodtype " +
																	 "AND store.consigneename = :consignee AND store.ordernumber = :orderno");
		//query.setParameter("date", form.getDate());
		query.setParameter("prodtype", form.getProducttype());
		query.setParameter("consignee", form.getConsigneename());
		//query.setParameter("orderno", form.getPonumber());
		
		return (CheckinForm) query.uniqueResult();
	}
	
	@Transactional
	public void checkOutFromStore(CheckOut form) {
		Session session = sessionFactory.getCurrentSession(); 
		session.save(form);
		CheckinForm storeEntry = getFromStore(form);
		if(storeEntry == null ){
			return;
		}
		Long prodBalance = storeEntry.getProductbalance() - form.getProductout();
		String updateHql = "UPDATE CheckinForm set productbalance = :balance WHERE id=:id";
		Query query = session.createQuery(updateHql);
		query.setParameter("balance", prodBalance);
		query.setParameter("id", storeEntry.getId());
		query.executeUpdate();
	}
	
	@Transactional
	public List<?> fetchClientHistory() {
		Query query = sessionFactory.getCurrentSession().createQuery("SELECT count(store.productbalance), store.consigneename FROM CheckinForm store GROUP BY store.consigneename");
		List results = query.list();
		return results;
	}
	
	@Transactional
	public List<Object[]> getChartData() {
		
		Query query = sessionFactory.getCurrentSession().createQuery("SELECT count(store.productbalance), store.producttype FROM CheckinForm store GROUP BY store.producttype");
		List results = query.list();
		return results;
	}

}
