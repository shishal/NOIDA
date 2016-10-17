package com.noida.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noida.manager.AssetManager;
import com.noida.manager.RequestManager;
import com.noida.util.Constants;
import com.noida.util.RequestStatus;
import com.noida.util.Util;

@Controller
@RequestMapping("/approver")
public class ApproverController {
	@Autowired RequestManager reqMgr;
	@Autowired AssetManager assetMgr;

	@RequestMapping(value = { "/", "/home" ,"/pendingRequest"}, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		model.put("requestList", reqMgr.getRequestByStatus(RequestStatus.PENDING));
		return "approvePendingRequest";
	}

	@RequestMapping("getAssetAvailability")
	@ResponseBody
	public Map<String,Object> getAssetAvailability(Long assetSubTypeId){
		Integer qty = assetMgr.getAssetAvailability(assetSubTypeId);
		return Util.toMap("status",Constants.SUCCESS,"availableQty",qty);
	}
	
	@RequestMapping(value = { "/requests" }, method = RequestMethod.GET)
	public String requestsPage(ModelMap model) {
		return "requests";
	}
}
