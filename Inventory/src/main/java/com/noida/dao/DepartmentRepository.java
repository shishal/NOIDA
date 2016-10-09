package com.noida.dao;

import org.springframework.data.repository.CrudRepository;

import com.noida.model.Department;

public interface DepartmentRepository extends CrudRepository<Department, Long> {

}
