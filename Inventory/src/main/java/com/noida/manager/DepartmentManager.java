package com.noida.manager;

import java.util.List;

import com.noida.model.Department;

public interface DepartmentManager {
	public Department createDepartment(String name, String desc);

			public List<Department> getAllDepartments();

			public void updateDepartment(Long id, String name, String desc);

			public void deleteDepartment(Long id);
}
