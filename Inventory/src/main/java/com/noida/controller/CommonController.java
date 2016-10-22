package com.noida.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noida.manager.AssetSubTypeManager;
import com.noida.util.Util;

@Controller
@RequestMapping("/")
public class CommonController {
	
	@Autowired AssetSubTypeManager assetSubTypeMgr;

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String LoginPage(ModelMap model) {
		return "login";
	}

	@RequestMapping(value = { "/home", "/" }, method = RequestMethod.GET)
	public String home(ModelMap model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		for (GrantedAuthority gAuth : auth.getAuthorities()) {
			if ("ROLE_USER".equals(gAuth.getAuthority()))
				return "redirect:user/myRequest";
			else if ("ROLE_ISSUER".equals(gAuth.getAuthority()))
				return "redirect:issuer/approvedRequest";
			else if ("ROLE_APPROVER".equals(gAuth.getAuthority()))
				return "redirect:approver/pendingRequest";
			else if ("ROLE_ADMIN".equals(gAuth.getAuthority()))
				return "redirect:approver/pendingRequest";

		}
		return "403";

	}
	
	@RequestMapping(value = { "/403" }, method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		return "403";
	}
	
	@ResponseBody
	@RequestMapping(value = { "/assetSubTypeByAssetType"}, method = RequestMethod.POST)
	public Map<String,Object> assetSubTypeByAssetType(@RequestParam Long assetTypeId) {
		Map assetSubTypeMap = assetSubTypeMgr.getAssetSubTypeByAssetType(assetTypeId);
		return Util.toMap("assetSubTypeMap",assetSubTypeMap);
	}
}
