package com.noida.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
 
 
@Controller
@RequestMapping("/admin")
public class AdminController {
 
    @RequestMapping(value = { "/","/home"}, method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        return "adminHome";
    }
 
    @RequestMapping(value = { "/setup"}, method = RequestMethod.GET)
    public String contactUsPage(ModelMap model) {
        return "setup";
    }
}
