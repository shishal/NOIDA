package com.noida.controller;

import java.util.Map;

import org.apache.commons.collections.map.MultiValueMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noida.exception.InventoryException;
import com.noida.manager.AssetTypeManager;
import com.noida.model.AssetMainType;
import com.noida.util.Constants;
import com.noida.util.Util;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired AssetTypeManager assetTypeMgr;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "approvePendingRequest";
	}

	@RequestMapping(value = { "/po" }, method = RequestMethod.GET)
	public String purchaseOrder(ModelMap model) {
		return "po";
	}

	@RequestMapping(value = { "/amc" }, method = RequestMethod.GET)
	public String amc(ModelMap model) {
		return "amc";
	}

	@RequestMapping(value = { "/user" }, method = RequestMethod.GET)
	public String user(ModelMap model) {
		return "user";
	}

	@RequestMapping(value = { "/department" }, method = RequestMethod.GET)
	public String department(ModelMap model) {
		return "department";
	}

	@RequestMapping(value = { "/asset" }, method = RequestMethod.GET)
	public String asset(ModelMap model) {
		return "asset";
	}

	@RequestMapping(value = { "/assetType" }, method = RequestMethod.GET)
	public String assetType(ModelMap model) {
		return "assetType";
	}

	@RequestMapping(value = { "/assetSubType" }, method = RequestMethod.GET)
	public String assetSubType(ModelMap model) {
		return "assetSubType";
	}
	@ResponseBody
	@RequestMapping(value = { "/createAssetType" }, method = RequestMethod.POST)
	public Map<String,Object> createAssetType(
			@RequestParam String name, 
			@RequestParam String desc) {
		
		AssetMainType assetType = null;
		try{
			assetType = assetTypeMgr.createAssetType(name, desc);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS,"assetType",assetType);
	}
}
