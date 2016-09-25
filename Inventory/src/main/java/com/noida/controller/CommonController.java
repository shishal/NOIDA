package com.noida.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
 
 
@Controller
@RequestMapping("/")
public class CommonController {
 
    @RequestMapping(value = { "/login"}, method = RequestMethod.GET)
    public String LoginPage(ModelMap model) {
        return "login";
    }
    @RequestMapping(value = { "/home","/"}, method = RequestMethod.GET)
    public String home(ModelMap model) {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    	for(GrantedAuthority gAuth: auth.getAuthorities())
    	{
    		if("ROLE_USER".equals(gAuth.getAuthority()))
    			return "userHome";
    		else if("ROLE_ISSUER".equals(gAuth.getAuthority()))
    			return "issuerHome";
    		else if("ROLE_APPROVER".equals(gAuth.getAuthority()))
    			return "approverHome";
    		else if("ROLE_ADMIN".equals(gAuth.getAuthority()))
    			return "adminHome";
    		
    	}
    	return "403";
        
    }
}
