package com.noida.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noida.exception.InventoryException;
import com.noida.manager.AssetSubTypeManager;
import com.noida.manager.AssetTypeManager;
import com.noida.manager.DepartmentManager;
import com.noida.manager.POManager;
import com.noida.manager.UserManager;
import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;
import com.noida.model.Department;
import com.noida.model.PO;
import com.noida.model.Users;
import com.noida.util.Constants;
import com.noida.util.Util;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired UserManager userMgr;
	@Autowired AssetTypeManager assetTypeMgr;
	@Autowired AssetSubTypeManager assetSubTypeMgr;
	@Autowired DepartmentManager departmentMgr;
	@Autowired POManager poMgr;

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "approvePendingRequest";
	}

	@RequestMapping(value = { "/po" }, method = RequestMethod.GET)
	public String purchaseOrder(ModelMap model) {
		List<PO> poList = poMgr.getAllPO();
		model.put("poList", poList);
		return "po";
	}
	@ResponseBody
	@RequestMapping(value = { "/createPO" }, method = RequestMethod.POST)
	public Map<String,Object> createPO(
			@RequestParam String poNumber,
			@RequestParam String company,
			@RequestParam Date poDate,
			@RequestParam String desc) {
		
		PO po = null;
		try{
			po = poMgr.createPO(poNumber, company,poDate, desc);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS,"po",po);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/updatePO" }, method = RequestMethod.POST)
	public Map<String,Object> updatePO(
			@RequestParam Long id,
			@RequestParam String poNumber,
			@RequestParam String company,
			@RequestParam Date poDate,
			@RequestParam String desc 
			) {
		
		try{
			poMgr.updatePO(id,poNumber,company,poDate, desc);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	@ResponseBody
	@RequestMapping(value = { "/deletePO" }, method = RequestMethod.POST)
	public Map<String,Object> deletePO(@RequestParam Long id) {
		try{
			poMgr.deletePO(id);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}

	@RequestMapping(value = { "/amc" }, method = RequestMethod.GET)
	public String amc(ModelMap model) {
		return "amc";
	}

	@RequestMapping(value = { "/user" }, method = RequestMethod.GET)
	public String user(ModelMap model) {
		List<Users> userList = userMgr.getAllUsers();
		model.put("userList", userList);
		List<Department> deptList = departmentMgr.getAllDepartments();
		model.put("deptList", deptList);
		
		return "user";
	}

	@RequestMapping(value = { "/department" }, method = RequestMethod.GET)
	public String department(ModelMap model) {
		List<Department> deptList = departmentMgr.getAllDepartments();
		model.put("deptList", deptList);
		return "department";
	}

	@RequestMapping(value = { "/asset" }, method = RequestMethod.GET)
	public String asset(ModelMap model) {
		return "asset";
	}

	@RequestMapping(value = { "/assetType" }, method = RequestMethod.GET)
	public String assetType(ModelMap model) {
		List<AssetMainType> assetTypeList = assetTypeMgr.getAllAssetType();
		model.put("assetTypeList", assetTypeList);
		return "assetType";
	}
	
	@RequestMapping(value = { "/assetSubType" }, method = RequestMethod.GET)
	public String assetSubType(ModelMap model) {
		List<AssetSubType> assetSubTypeList = assetSubTypeMgr.getAllAssetSubType();
		model.put("assetSubTypeList", assetSubTypeList);
		List<AssetMainType> assetTypeList = assetTypeMgr.getAllAssetType();
		model.put("assetTypeList", assetTypeList);
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
	
	@ResponseBody
	@RequestMapping(value = { "/updateAssetType" }, method = RequestMethod.POST)
	public Map<String,Object> updateAssetType(
			@RequestParam Long id,
			@RequestParam String name, 
			@RequestParam String desc 
			) {
		
		try{
			assetTypeMgr.updateAssetType(id,name, desc);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	@ResponseBody
	@RequestMapping(value = { "/deleteAssetType" }, method = RequestMethod.POST)
	public Map<String,Object> deleteAssetType(@RequestParam Long id) {
		try{
			assetTypeMgr.deleteAssetType(id);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	/* AssetType Tab --- End */
	
	
	/* Users Tab --- Start */
	@ResponseBody
	@RequestMapping(value = { "/createUser" }, method = RequestMethod.POST)
	public Map<String,Object> createUser(
			@RequestParam String empCode,
			@RequestParam String username, 
			@RequestParam String firstName,
			@RequestParam String lastName,
			@RequestParam String contactNo,
			@RequestParam Long deptId,
			@RequestParam boolean enabled) {
		
		Users user = null;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		try{
			user = userMgr.createUser(empCode, username, firstName, lastName, contactNo, enabled, encoder.encode(Constants.USER_RESET_PASSWORD), deptId);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/updateUser" }, method = RequestMethod.POST)
	public Map<String,Object> updateUser(
			@RequestParam String empCode,
			@RequestParam String username, 
			@RequestParam String firstName,
			@RequestParam String lastName,
			@RequestParam String contactNo,
			@RequestParam Long deptId,
			@RequestParam boolean enabled) {
		
		try{
			String password = null;
			List<Users> user = userMgr.getUser(username);
			if(user.size() >= 0)
				password = user.get(0).getPassword();
			userMgr.updateUser(username, empCode, firstName, lastName, contactNo, enabled, password, deptId);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/deleteUser" }, method = RequestMethod.POST)
	public Map<String,Object> deleteUser(@RequestParam String username) {
		try{
			userMgr.deleteUser(username);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	
	/* Users Tab --- End */
	
	/* Asset SubType Tab --- Start */
	@ResponseBody
	@RequestMapping(value = { "/createAssetSubType" }, method = RequestMethod.POST)
	public Map<String,Object> createAssetSubType(
			@RequestParam Long assetTypeId,
			@RequestParam String make,
			@RequestParam String name, 
			@RequestParam String desc) {
		
		AssetSubType assetSubType = null;
		try{
			assetSubType = assetSubTypeMgr.createAssetSubType(assetTypeId, name, make, desc, new Date(), new Date());
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS,"assetType",assetSubType);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/updateAssetSubType" }, method = RequestMethod.POST)
	public Map<String,Object> updateAssetSubType(
			@RequestParam Long id,
			@RequestParam Long assetTypeId,
			@RequestParam String make,
			@RequestParam String name, 
			@RequestParam String desc 
			) {
		
		try{
			assetSubTypeMgr.updateAssetSubType(id, assetTypeId, name, make, desc, new Date());
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/deleteAssetSubType" }, method = RequestMethod.POST)
	public Map<String,Object> deleteAssetSubType(@RequestParam Long id) {
		try{
			assetSubTypeMgr.deleteAssetSubType(id);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	
	/* AssetSubType Tab --- End */
	
	/* Department Tab --- Start */
	@ResponseBody
	@RequestMapping(value = { "/createDepartment" }, method = RequestMethod.POST)
	public Map<String,Object> createDepartment(
			@RequestParam String name,
			@RequestParam String description) {
		
		Department dept = null;
		try{
			dept = departmentMgr.createDepartment(name, description);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/updateDepartment" }, method = RequestMethod.POST)
	public Map<String,Object> updateDepartment(
			@RequestParam Long id,
			@RequestParam String name, 
			@RequestParam String description ) {
		
		try{
			departmentMgr.updateDepartment(id, name, description);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/deleteDepartment" }, method = RequestMethod.POST)
	public Map<String,Object> deleteDepartment(@RequestParam Long id) {
		try{
			departmentMgr.deleteDepartment(id);;
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	
	/* Department Tab --- End */
	@InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
     SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
     dateFormat.setLenient(false);
     webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
     }
}
