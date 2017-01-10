package com.noida.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.noida.model.AssetSubType;
import com.noida.model.Request;
import com.noida.model.Users;
import com.noida.util.RequestStatus;


public interface RequestRepository extends CrudRepository<Request, Long>{
	
	List<Request> findByStatus(RequestStatus status);
	List<Request> findAll();
	List<Request> findByRequester(Users requester);
	List<Request> findByAssetSubTypeAndStatus(AssetSubType assetSubType, RequestStatus Status);
}
