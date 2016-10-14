package com.noida.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.noida.manager.AMCManager;
import com.noida.manager.AssetManager;
import com.noida.manager.AssetSubTypeManager;
import com.noida.manager.AssetTypeManager;
import com.noida.manager.DepartmentManager;
import com.noida.manager.POManager;
import com.noida.manager.UserManager;
import com.noida.model.AMC;
import com.noida.model.Asset;
import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;
import com.noida.model.Department;
import com.noida.model.PO;
import com.noida.model.UserRoles;
import com.noida.model.Users;
import com.noida.util.AssetStatus;
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
	@Autowired AMCManager amcMgr;
	@Autowired AssetManager assetMgr;

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
		List<AMC> amcList = amcMgr.getAllAMC();
		model.put("amcList", amcList);
		return "amc";
	}
	
	@ResponseBody
	@RequestMapping(value = { "/createAMC" }, method = RequestMethod.POST)
	public Map<String,Object> createAMC(
			@RequestParam String amcNumber,
			@RequestParam Date startDate,
			@RequestParam Date endDate,
			@RequestParam String vendor,
			@RequestParam String desc) {
		
		AMC amc = null;
		try{
			amc = amcMgr.createAMC(amcNumber,startDate, endDate, vendor,desc);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS,"amc",amc);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/updateAMC" }, method = RequestMethod.POST)
	public Map<String,Object> updateAMC(
			@RequestParam Long id,
			@RequestParam String amcNumber,
			@RequestParam Date startDate,
			@RequestParam Date endDate,
			@RequestParam String vendor,
			@RequestParam String desc 
			) {
		
		try{
			amcMgr.updateAMC(id, amcNumber,startDate,endDate, vendor,desc);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	@ResponseBody
	@RequestMapping(value = { "/deleteAMC" }, method = RequestMethod.POST)
	public Map<String,Object> deleteAMC(@RequestParam Long id) {
		try{
			amcMgr.deleteAMC(id);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
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
		//model.put("assetSubTypeList", assetSubTypeMgr.getAllAssetSubType());
		model.put("assetTypeList", assetTypeMgr.getAllAssetType());
		model.put("amcList", amcMgr.getAllAMC());
		model.put("poList", poMgr.getAllPO());
		model.put("assetList", assetMgr.getAllAssetDetail());
		return "asset";
	}
	
	@ResponseBody
	@RequestMapping(value = { "/createAsset" }, method = RequestMethod.POST)
	public Map<String,Object> createAsset(
			@RequestParam Long assetTypeId,
			@RequestParam Long assetSubTypeId,
			@RequestParam Long amcId, 
			@RequestParam Long poId,
			@RequestParam String serialNumber, 
			@RequestParam String barcode,
			@RequestParam AssetStatus status,
			@RequestParam String desc) {
		
		Asset asset = null;
		try{
			asset = assetMgr.createAsset(assetTypeId, assetSubTypeId, amcId, poId, serialNumber, barcode, status, desc);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS,"asset",asset);
	}
	
	@ResponseBody
	@RequestMapping(value = { "/updateAsset" }, method = RequestMethod.POST)
	public Map<String,Object> updateAsset(
			@RequestParam Long id,
			@RequestParam Long assetTypeId,
			@RequestParam Long assetSubTypeId,
			@RequestParam Long amcId, 
			@RequestParam Long poId,
			@RequestParam String serialNumber, 
			@RequestParam String barcode,
			@RequestParam AssetStatus status,
			@RequestParam String desc
			) {
		
		try{
			assetMgr.updateAsset(id, assetTypeId, assetSubTypeId, amcId, poId, serialNumber, barcode, status, desc);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
	}
	@ResponseBody
	@RequestMapping(value = { "/deleteAsset" }, method = RequestMethod.POST)
	public Map<String,Object> deleteAsset(@RequestParam Long id) {
		try{
			assetMgr.deleteAsset(id);
		}catch(InventoryException e){
			return Util.toMap("status",Constants.FAIL,"message",e.getMessage());
		}
		return Util.toMap("status",Constants.SUCCESS);
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
	@RequestMapping(value = { "/assetSubTypeByAssetType"}, method = RequestMethod.POST)
	public Map<String,Object> assetSubTypeByAssetType(@RequestParam Long assetTypeId) {
		Map assetSubTypeMap = assetSubTypeMgr.getAssetSubTypeByAssetType(assetTypeId);
		return Util.toMap("assetSubTypeMap",assetSubTypeMap);
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
			@RequestParam String userRole,
			@RequestParam boolean enabled) {
		
		Users user = null;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		Set<UserRoles> roleSet = new HashSet<UserRoles>();
		UserRoles role = new UserRoles();
		role.setRole(userRole);
		roleSet.add(role);
		 
		try{
			user = userMgr.createUser(empCode, username, firstName, lastName, contactNo, enabled, encoder.encode(Constants.USER_RESET_PASSWORD), deptId, roleSet);
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
			@RequestParam String userRole,
			@RequestParam boolean enabled) {
		
		try{
			String password = null;
			Set<UserRoles> userRoles = null;
			List<Users> user = userMgr.getUser(username);
			if(user.size() >= 0) {
				password = user.get(0).getPassword();
				userRoles = user.get(0).getUserRoles();
				for(UserRoles role :userRoles) {
					role.setRole(userRole);
				}
			}
			userMgr.updateUser(username, empCode, firstName, lastName, contactNo, enabled, password, deptId, userRoles);
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
