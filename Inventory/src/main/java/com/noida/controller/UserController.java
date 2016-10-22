package com.noida.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
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
import com.noida.manager.AssetManager;
import com.noida.manager.AssetTypeManager;
import com.noida.manager.RequestManager;
import com.noida.manager.UserManager;
import com.noida.model.Request;
import com.noida.model.Users;
import com.noida.util.Constants;
import com.noida.util.Util;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired UserManager userMgr;
	@Autowired AssetTypeManager assetTypeMgr;
	@Autowired RequestManager reqMrg;
	@Autowired MessageSource messageSource;
	@Autowired AssetManager assetMgr;

	@RequestMapping(value = { "/", "home","/myRequest" }, method = RequestMethod.GET)
	public String myRequest(ModelMap model) {
		String loginUsername = Util.getLoggedInUsername();
		model.put("requestList", reqMrg.getUserRequest(new Users(loginUsername)));
		return "myRequest";
	}

	@RequestMapping(value = { "/raiseRequest" }, method = RequestMethod.GET)
	public String loadRaiseRequest(ModelMap model) {
		model.put("assetTypeList", assetTypeMgr.getAllAssetType());
		return "raiseRequest";
	}
	@ResponseBody
	@RequestMapping(value = { "/raiseRequest" }, method = RequestMethod.POST)
	public Map<String,Object> raiseRequest(
			@RequestParam Long  assetTypeId,
			@RequestParam Long  assetSubTypeId,
			@RequestParam int  qty,
			@RequestParam String  desc,
			Principal principal) {
		
		Request reqDetail = reqMrg.raiseNewRequest(assetTypeId, assetSubTypeId, principal.getName(), qty, desc);
		return Util.toMap("status",Constants.SUCCESS,"msg",
				messageSource.getMessage("request.create.success",
				Util.toAttay(reqDetail.getId().toString()), null,null));
	}
	
	@RequestMapping(value = { "/raiseRepairRequest" }, method = RequestMethod.GET)
	public String raiseRepairRequest(ModelMap model) {
		return "raiseRepairRequest";
	}

	@RequestMapping(value = { "/myAsset" }, method = RequestMethod.GET)
	public String myAssets(ModelMap model) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		User loggedUser = (User)auth.getPrincipal();
		String username = loggedUser.getUsername();
		model.put("assetList", assetMgr.getAssetByUsername(username));
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
			
			userMgr.updateUser(username, user.get(0).getEmpCode(), user.get(0).getFirstName(), user.get(0).getLastName(), user.get(0).getContactNo(), user.get(0).isEnabled(), encoder.encode(newPassword), user.get(0).getDepartment().getId(), user.get(0).getUserRoles());
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
}
