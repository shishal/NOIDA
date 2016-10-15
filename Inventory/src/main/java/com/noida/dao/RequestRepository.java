package com.noida.dao;

import org.springframework.data.repository.CrudRepository;

import com.noida.model.Request;


public interface RequestRepository extends CrudRepository<Request, Long>{
	
	}
