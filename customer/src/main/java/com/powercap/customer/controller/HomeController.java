package com.powercap.customer.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping(value="/")
	public ModelAndView test(HttpServletResponse response) throws IOException{
		return new ModelAndView("home");
	}
	@RequestMapping(value="/customercreate")
	public ModelAndView createCustomer(HttpServletResponse response) throws IOException{
		return new ModelAndView("customercreate");
	}
	@RequestMapping(value="/customeredit")
	public ModelAndView editCustomer(HttpServletRequest request) throws IOException{
		System.out.println(request.getParameter("customerId").toString());
		return new ModelAndView("customercreate");
	}
}
