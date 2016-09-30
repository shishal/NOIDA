package com.noida.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/approver")
public class ApproverController {

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "approvePendingRequest";
	}

	@RequestMapping(value = { "/pendingRequest" }, method = RequestMethod.GET)
	public String pendingRequest(ModelMap model) {
		return "approvePendingRequest";
	}

	@RequestMapping(value = { "/requests" }, method = RequestMethod.GET)
	public String requestsPage(ModelMap model) {
		return "requests";
	}
}
