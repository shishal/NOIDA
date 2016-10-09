package com.noida.manager.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.DepartmentRepository;
import com.noida.exception.InventoryException;
import com.noida.manager.DepartmentManager;
import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;
import com.noida.model.Department;
import com.noida.util.Message;

@Service
public class DepartmentManagerImpl implements DepartmentManager {
	
	@Autowired
	DepartmentRepository departmentRepo;

	@Override
	public Department createDepartment(String name, String desc) {
		try{
			return  departmentRepo.save(new Department(name, desc, new Date(), new Date()));
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_MAIN_TYPE,e);
	    }
	}

	@Override
	public List<Department> getAllDepartments() {
		return Lists.newArrayList(departmentRepo.findAll());
	}

	@Override
	public void updateDepartment(Long id, String name, String desc) {
		try{
			departmentRepo.save(new Department(id, name, desc, new Date()));
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_MAIN_TYPE,e);
	    }
	}

	@Override
	public void deleteDepartment(Long id) {
		try{
			departmentRepo.delete(id);
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.UNKNOW_ERROR,e);
	    }
		
	}

}
