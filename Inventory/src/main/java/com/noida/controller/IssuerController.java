package com.noida.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
 
 
@Controller
@RequestMapping("issuer")
public class IssuerController {
 
    @RequestMapping(value = { "/","/home"}, method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        return "approvedRequest";
    }
 
    @RequestMapping(value = { "/approvedRequest"}, method = RequestMethod.GET)
    public String productsPage(ModelMap model) {
        return "approvedRequest";
    }
}
