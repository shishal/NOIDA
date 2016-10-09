package com.noida.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.DepartmentRepository;
import com.noida.manager.DepartmentManager;
import com.noida.model.Department;

@Service
public class DepartmentManagerImpl implements DepartmentManager {
	
	@Autowired
	DepartmentRepository departmentRepository;

	@Override
	public Department createDepartment(String name, String desc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Department> getAllDepartments() {
		return Lists.newArrayList(departmentRepository.findAll());
	}

	@Override
	public void updateDepartment(Long id, String name, String desc) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDepartment(Long id) {
		// TODO Auto-generated method stub
		
	}

}
