package com.powercap.customer.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.powercap.customer.exceptions.NoDBException;
import com.powercap.customer.service.CustomerPurchase;
import com.powercap.customer.service.CustomerPurchaseService;
import com.powercap.customer.service.CustomerService;
import com.powercap.customer.service.CustomerServiceService;
import com.powercap.customer.service.PurchasePayment;
import com.powercap.customer.service.PurchasePaymentService;
import com.powercap.customer.service.UserService;
import com.powercap.customer.utils.CustomerPurchaseHelper;
import com.powercap.model.UploadFile;

@Controller
public class HomeController {
	
	@Autowired
	UserService userServ;
	
	@Autowired
	CustomerPurchaseService purchaseService;
	
	@Autowired
	PurchasePaymentService paymentService;
	
	@Autowired
	CustomerServiceService custService;
	
	@RequestMapping(value="/")
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="/home")
	public ModelAndView goHome(HttpServletRequest request) throws SQLException
	{
		if(request.getSession(false) != null )
		{
			
			List dueCustomers = paymentService.getPaymentReminders();
			List dueServices = custService.getDueCustomers();
			Integer customerCount = custService.getCustomersCount();
			Map duemap = new HashMap();
			//duemap.put("duepayments", dueCustomers);
			duemap.put("dueservices", dueServices);
			ModelAndView homeView = new ModelAndView("home","dues",duemap);
			homeView.addObject("duepayments", dueCustomers);
			homeView.addObject("customerCount", customerCount);
				return homeView;
		}
		else return new ModelAndView("login");
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(HttpServletRequest request) throws SQLException
	{
		String loginId = request.getParameter("username");
		String password = request.getParameter("password");
		if((loginId == null && password == null) || (loginId.equals("") && password.equals(""))) 
		{
			return new ModelAndView("login");
		}
		try{
			boolean valid = userServ.doLogin(loginId, password);
			
			if(valid)
			{
				List dueCustomers = paymentService.getPaymentReminders();
				List dueServices = custService.getDueCustomers();
				Integer customerCount = custService.getCustomersCount();
				Map duemap = new HashMap();
				//duemap.put("duepayments", dueCustomers);
				duemap.put("dueservices", dueServices);
				ModelAndView homeView = new ModelAndView("home","dues",duemap);
				homeView.addObject("duepayments", dueCustomers);
				homeView.addObject("customerCount", customerCount);
					return homeView;
			}
			else
			{
				ModelAndView error = new ModelAndView("login");
				error.addObject("error", "InvalidLogin");
				return error;
			}
		}
		catch(NoDBException nodbe) {
			nodbe.printStackTrace();
			ModelAndView error = new ModelAndView("login");
			error.addObject("error", "NoDB");
			return error;
		}
		
	}
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request)
	{
		request.getSession().invalidate();
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="/customercreate")
	public ModelAndView createCustomer(HttpServletRequest request) throws IOException{
		
		/*if(request.getSession(false) != null )
			return new ModelAndView("customercreate");
		else return new ModelAndView("login");*/
		
		return new ModelAndView("/customercreate");
	}
	
	@RequestMapping(value="/createcustomerpurchase")
	//public ModelAndView customerPurchase(@RequestParam(value = "customerphoto") CommonsMultipartFile photo,HttpServletRequest request) throws IOException, SQLException, java.text.ParseException
	public String customerPurchase(@ModelAttribute(value="uploadedFile")UploadFile file,HttpServletRequest request) throws IOException, SQLException, java.text.ParseException
	{
		//CustomerPurchaseService purchaseService = new CustomerPurchaseService();
		List<CustomerPurchase> purchases = preparePurchase(request,file);
		if(purchases!=null && !purchases.isEmpty() )
			{
				purchaseService.createCustomerPurchase(purchases);
			}
		
		return "redirect:/customeredit?customerId="+purchases.get(0).getCustomerId()+"";
	}
	private List<CustomerPurchase> preparePurchase(HttpServletRequest request,UploadFile file) {
		
		List<CustomerPurchase> purchases = new ArrayList<CustomerPurchase>();
		CustomerPurchaseHelper pHelper = new CustomerPurchaseHelper();
		
				purchases = pHelper.preparePurchase(request,file);
		
		return purchases ;
	}

	@RequestMapping(value="/customeredit")
	
	public ModelAndView editCustomer(@RequestParam String customerId) throws IOException, SQLException, java.text.ParseException{
		System.out.println("Details for customer Id " + customerId);
		List <CustomerPurchase>purchases = purchaseService.getCustomerPurchases(customerId);
		if(!StringUtils.isNumeric(customerId)) {
			return new ModelAndView("customerpick","customerpurchases",purchases);
		}
		return new ModelAndView("customeredit","customerpurchases",purchases);
	}
	
	@RequestMapping(value="/getImage")
	
	public ResponseEntity<byte[]> getImage(@PathVariable(value="id") String customerId) throws IOException, SQLException, java.text.ParseException{
		System.out.println("Details for customer Id " + customerId);
		List <CustomerPurchase>purchases = purchaseService.getCustomerPurchases(customerId);
		final HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.IMAGE_PNG);
	    
		return new ResponseEntity<byte[]>(IOUtils.toByteArray(purchases.get(0).getPhoto()),headers,HttpStatus.CREATED);
	}
	
	
		
	@RequestMapping(value="/updatepayment")
	
	public ModelAndView updatePayment(@RequestParam int purchaseId) throws NumberFormatException, SQLException {
		List<PurchasePayment> payments = paymentService.getPayments(purchaseId);
		if(payments.size() == 0)
		{
			PurchasePayment payment = new PurchasePayment();
			payment.setPurchaseId(purchaseId);
			payments.add(payment);
		}
		return new ModelAndView("updatepayment","payments",payments); 
	}
	
	@RequestMapping(value="/updatepayments")
	
	public String updatePayments(HttpServletRequest request) throws SQLException, java.text.ParseException {
		System.out.println("updating paytm");
		//return new ModelAndView("updatepayment");
		PurchasePayment payment = new PurchasePayment();
		payment.setPurchaseId(Integer.parseInt(request.getParameter("purchaseid")));
		payment.setDateofPayment(request.getParameter("dateofpayment"));
		payment.setAmount(Double.parseDouble(request.getParameter("amount")));
		payment.setCashorcheck(request.getParameter("cashorchek"));
		//payment.setChecqueNo(request.getParameter("checqueno"));
		paymentService.createPayment(payment);
		return "redirect:/updatepayment?purchaseId="+payment.getPurchaseId()+"";
		
	}
	
	@RequestMapping(value="/updateservice")
	
	public ModelAndView updateService(@RequestParam String customerId) throws NumberFormatException, SQLException {
		
		List<CustomerService> services = custService.getCustomerServices(customerId);
		if(services.size()==0)
		{
			CustomerService service = new CustomerService();
			service.setCustomerId(Integer.parseInt(customerId));
			services.add(service);
		}
		return new ModelAndView("updateServices","services",services);
	}
	
	@RequestMapping(value="/updateservices")
	
	public String updateServices(HttpServletRequest request) throws SQLException, java.text.ParseException {
		System.out.println("updating services");
		//return new ModelAndView("updatepayment");
		CustomerService service = new CustomerService();
		service.setCustomerId(Integer.parseInt(request.getParameter("customerid")));
		service.setServiceName(request.getParameter("servicename"));
		service.setDateofService(request.getParameter("servicedate"));
		service.setServiceCharge(Double.parseDouble(request.getParameter("servicecharge")));
		service.setDueinmonths(Integer.parseInt(request.getParameter("dueinmonths")));
		service.setDateofNextService(request.getParameter("nextservicedate"));
		custService.createCustomerService(service);
		return "redirect:/updateservice?customerId="+service.getCustomerId()+"";
	}
}
