package com.noida.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noida.exception.InventoryException;
import com.noida.manager.UserManager;
import com.noida.model.PO;
import com.noida.model.Users;
import com.noida.util.Constants;
import com.noida.util.Util;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired UserManager userMgr;

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
	
	@RequestMapping(value = { "/raiseRepairRequest" }, method = RequestMethod.GET)
	public String raiseRepairRequest(ModelMap model) {
		return "raiseRepairRequest";
	}

	@RequestMapping(value = { "/myAsset" }, method = RequestMethod.GET)
	public String myAssets(ModelMap model) {
		return "myAsset";
	}
	
	@RequestMapping(value = { "/changePassword" }, method = RequestMethod.GET)
	public String changePassword(ModelMap model) {
		return "changePassword";
	}
	
	@ResponseBody
	@RequestMapping(value = { "/updatePassword" }, method = RequestMethod.POST)
	public Map<String,Object> updatePassword(
			@RequestParam String currentPassword,
			@RequestParam String newPassword,
			@RequestParam String repeatPassword) {
			
		try{
			if(currentPassword == null ||
					newPassword == null ||
					repeatPassword == null)
				return Util.toMap("status",Constants.FAIL,"message","No fields can be empty.");
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			Authentication auth = SecurityContextHolder.getContext()
					.getAuthentication();
			User loggedUser = (User)auth.getPrincipal();
			String username = loggedUser.getUsername();
			String password = null;
			List<Users> user = userMgr.getUser(username);
			if(user.size() >= 0)
				password = user.get(0).getPassword();
			
			if(!newPassword.equals(repeatPassword))
				return Util.toMap("status",Constants.FAIL,"message","Mismatch in New and Confirm New password.");
			if(!encoder.matches(currentPassword,password))
				return Util.toMap("status",Constants.FAIL,"message","Current Password is wrong.");
			
			userMgr.updateUser(username, user.get(0).getEmpCode(), user.get(0).getFirstName(), user.get(0).getLastName(), user.get(0).getContactNo(), user.get(0).isEnabled(), encoder.encode(newPassword), user.get(0).getDepartment().getId());
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
}
