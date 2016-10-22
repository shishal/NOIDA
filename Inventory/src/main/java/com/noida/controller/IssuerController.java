package com.noida.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noida.manager.RequestManager;
import com.noida.manager.UserManager;
import com.noida.model.Users;
import com.noida.util.Constants;
import com.noida.util.RequestStatus;
import com.noida.util.Util;

@Controller
@RequestMapping("issuer")
public class IssuerController {
	
	@Autowired RequestManager reqMgr;
	@Autowired MessageSource messageSource;
	@Autowired UserManager userMgr;

	@RequestMapping(value = { "/", "/home" ,"/approvedRequest"}, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		List<Users> userList = userMgr.getAllUsers();
		model.put("userList", userList);
		model.put("requestList", reqMgr.getRequestByStatus(RequestStatus.APPROVED));
		return "approvedRequest";
	}
	
	@ResponseBody
	@RequestMapping("issueAsset")
	public Map<String,Object> issueAsset(
			@RequestParam Long requestNumber,
			@RequestParam int requestedQty,
			@RequestParam String remark,
			@RequestParam(value="barcodes") String[] barcodes){
		
			for(String barcode :barcodes){
				if(StringUtils.isEmpty(barcode))
					return Util.toMap("status",Constants.FAIL,"msg",messageSource.getMessage("request.issue.fail.barcode.empty",null,null,null));
			}
		return reqMgr.issueAsset(requestNumber,barcodes,remark);
	}
}
