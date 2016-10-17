package com.noida.manager.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noida.dao.RequestRepository;
import com.noida.manager.RequestManager;
import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;
import com.noida.model.Request;
import com.noida.model.Users;
import com.noida.util.RequestStatus;
import com.noida.util.RequestType;

@Service
public class RequestManagerImpl implements RequestManager{
	
	@Autowired
	RequestRepository reqRepo;
	
	public Request raiseNewRequest(Long assetTypeNo, Long assetSubTypeNo, String requester, int quantity, String desc){
		
		return reqRepo.save(new Request(
				new AssetMainType(assetTypeNo),
				new AssetSubType(assetSubTypeNo),
				new Users(requester),
				new Date(),
				RequestType.NEW,
				quantity,
				desc,
				RequestStatus.PENDING,
				new Date(),
				new Date()));
	}
}
