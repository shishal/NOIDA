package com.noida.dao;

import org.springframework.data.repository.CrudRepository;

import com.noida.model.RequestHistory;


public interface RequestHistoryRepository extends CrudRepository<RequestHistory, Long>{
	
}
