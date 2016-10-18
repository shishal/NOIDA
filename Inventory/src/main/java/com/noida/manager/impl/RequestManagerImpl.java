package com.noida.manager.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noida.dao.RequestHistoryRepository;
import com.noida.dao.RequestRepository;
import com.noida.manager.RequestManager;
import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;
import com.noida.model.Request;
import com.noida.model.RequestHistory;
import com.noida.model.Users;
import com.noida.util.RequestStatus;
import com.noida.util.RequestType;
import com.noida.util.Util;

@Service
public class RequestManagerImpl implements RequestManager{
	
	@Autowired RequestRepository reqRepo;
	@Autowired RequestHistoryRepository reqHistoryRepo;
	
	@Override
	public Request raiseNewRequest(Long assetTypeNo, Long assetSubTypeNo, String requester, int quantity, String desc){
		
		Date currentDate = new Date();
		String loginUsername = Util.getLoggedInUsername();
		Request request= reqRepo.save(new Request(
				new AssetMainType(assetTypeNo),
				new AssetSubType(assetSubTypeNo),
				new Users(requester),
				new Date(),
				RequestType.NEW,
				quantity,
				desc,
				RequestStatus.PENDING,
				currentDate,
				currentDate));
		reqHistoryRepo.save(new RequestHistory(request.getId(), RequestStatus.PENDING, loginUsername, desc, currentDate, currentDate));
		return request;
	}
	@Override
	public List<Request> getRequestByStatus(RequestStatus status){
		return reqRepo.findByStatus(status);
	}
	@Override
	public void approveRequest(Long requestNumber, int approvedQty, String remark) {
		Date currentDate = new Date();
		String loginUsername = Util.getLoggedInUsername();
		Request request =reqRepo.findOne(requestNumber);
		request.setAssetQuantity(approvedQty);
		request.setDescription(remark);
		request.setStatus(RequestStatus.APPROVED);
		request.setUpdatedTime(currentDate);
		reqRepo.save(request);
		reqHistoryRepo.save(new RequestHistory(requestNumber, RequestStatus.APPROVED, loginUsername, remark, currentDate, currentDate));
	}
	@Override
	public void rejectRequest(Long requestNumber, String remark) {
		Date currentDate = new Date();
		String loginUsername = Util.getLoggedInUsername();
		Request request =reqRepo.findOne(requestNumber);
		request.setDescription(remark);
		request.setStatus(RequestStatus.REJECTED);
		request.setUpdatedTime(currentDate);
		reqRepo.save(request);
		reqHistoryRepo.save(new RequestHistory(requestNumber, RequestStatus.REJECTED, loginUsername, remark, currentDate, currentDate));
	}
}
