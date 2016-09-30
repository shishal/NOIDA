package com.noida.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "myRequest";
	}

	@RequestMapping(value = { "/myRequest" }, method = RequestMethod.GET)
	public String myRequest(ModelMap model) {
		return "myRequest";
	}

	@RequestMapping(value = { "/raiseRequest" }, method = RequestMethod.GET)
	public String raiseRequest(ModelMap model) {
		return "raiseRequest";
	}

	@RequestMapping(value = { "/myAsset" }, method = RequestMethod.GET)
	public String myAssets(ModelMap model) {
		return "myAsset";
	}
}
