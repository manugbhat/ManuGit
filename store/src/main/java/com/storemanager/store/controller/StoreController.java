package com.storemanager.store.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.storemanager.store.model.CheckOut;
import com.storemanager.store.model.CheckinForm;
import com.storemanager.store.model.ClientHistory;
import com.storemanager.store.model.PieChartData;
import com.storemanager.store.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	StoreService store;
	
	@RequestMapping(value="/")
	public ModelAndView getDashboard(HttpServletResponse response) throws IOException{
		return new ModelAndView("home");
	}
	
	@RequestMapping(value="/home")
	public ModelAndView goHome(HttpServletResponse response) throws IOException{
		return new ModelAndView("home");
	}
	
	@RequestMapping(value="/store")
	public ModelAndView getHome(HttpServletResponse response) throws IOException{
		return new ModelAndView("home");
	}
	
	@RequestMapping(value="/data/dashboard")
	public ModelAndView goDashboard(HttpServletResponse response) throws IOException{
		//List<CheckinForm> storeItems = store.fetchAllFromStore();
		return new ModelAndView("dashboard");
	}

	
	@RequestMapping(value="/data/charts")
	public @ResponseBody List getChart(HttpServletResponse response) throws IOException{
		List<PieChartData> storeItems = store.getChartData();
		return storeItems;
	}

	@RequestMapping(value="/data/checkin")
	public ModelAndView getCheckin(HttpServletResponse response) throws IOException{
		return new ModelAndView("checkin","form" , new CheckinForm());
	}
	
	@RequestMapping(value="/checkinaction",method = RequestMethod.POST)
	public ModelAndView doCheckin(@ModelAttribute("form")CheckinForm form , BindingResult result) throws IOException{
		System.out.println("Form is "+form);
		System.out.println("Form is "+form.getDate());
		System.out.println("Form is "+form.getOrdernumber());
		store.checkinToStore(form);
		return new ModelAndView("redirect:store");
	}
	
	@RequestMapping(value="/checkoutaction",method = RequestMethod.POST)
	public ModelAndView doCheckout(@ModelAttribute("form")CheckOut form , BindingResult result) throws IOException{
		
		store.checkoutFromStore(form);
		return new ModelAndView("redirect:home");
	}
	
	@RequestMapping(value="/data/store")
	public ModelAndView getStore(HttpServletResponse response) throws IOException{
		List<CheckinForm> items = store.fetchAllFromStore();
		return new ModelAndView("store","storeitems",items);
	}
	
	@RequestMapping(value="/data/checkout")
	public ModelAndView getCheckout(HttpServletResponse response) throws IOException{
		return new ModelAndView("checkout","form" , new CheckOut());
	}
	
	@RequestMapping(value="/data/clienthistory")
	public ModelAndView getHistory(HttpServletResponse response) throws IOException{
		List<ClientHistory> history = store.fetchClientHistory();
		System.out.println("got results for client history --"+history.size());
		return new ModelAndView("history","historyItems",history);
	}
}
