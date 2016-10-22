package com.noida.manager.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.noida.dao.AssetIssueRepository;
import com.noida.dao.AssetRepository;
import com.noida.dao.RequestHistoryRepository;
import com.noida.dao.RequestRepository;
import com.noida.manager.RequestManager;
import com.noida.model.Asset;
import com.noida.model.AssetIssue;
import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;
import com.noida.model.Request;
import com.noida.model.RequestHistory;
import com.noida.model.Users;
import com.noida.util.Constants;
import com.noida.util.RequestStatus;
import com.noida.util.RequestType;
import com.noida.util.Util;

@Service
public class RequestManagerImpl implements RequestManager{
	
	@Autowired RequestRepository reqRepo;
	@Autowired RequestHistoryRepository reqHistoryRepo;
	@Autowired AssetIssueRepository assetIssueRepo;
	@Autowired AssetRepository assetRepo;
	@Autowired MessageSource msgSource;
	
	@Transactional
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
	
	@Transactional
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
	
	@Transactional
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
	@Override
	@Transactional
	public Map<String,Object> issueAsset(Long requestNumber, String[] barcodes, String remark) {
		Date currentDate = new Date();
		String loginUsername = Util.getLoggedInUsername();
		Request request =reqRepo.findOne(requestNumber);
		for(String barcode:barcodes){
			List<Asset> assetList = assetRepo.findByBarcode(barcode);
			if(assetList.isEmpty()){
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return Util.toMap("status", Constants.FAIL,"msg",msgSource.getMessage("request.issue.fail.wrong.barcode", Util.toAttay(barcode), null));
			}
			Asset asset = null;
			if(!assetList.isEmpty()){
				asset = assetList.get(0);
				if(asset.getAssetSubType().getId() != request.getAssetSubType().getId()){
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					return Util.toMap("status", Constants.FAIL,"msg",msgSource.getMessage("request.issue.fail.wrong.asset.issue", null, null));
				}
			}
			List<AssetIssue> assetIssueList = assetIssueRepo.findByAssetAndReturnDateIsNull(asset);
			if(!assetIssueList.isEmpty()){
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return Util.toMap("status", Constants.FAIL,"msg",msgSource.getMessage("request.issue.fail.already.asset.issued", Util.toAttay(barcode,assetIssueList.get(0).getIssuedTo().getUsername()), null));
			}
			AssetIssue assetIssue = new AssetIssue(
										asset,
										null, 
										request, 
										currentDate, 
										null,
										request.getRequester(),
										new Users(loginUsername),
										null,
										remark,
										currentDate,
										currentDate);
			assetIssueRepo.save(assetIssue);
		}
		request.setDescription(remark);
		request.setStatus(RequestStatus.ISSUED);
		request.setUpdatedTime(currentDate);
		reqRepo.save(request);
		reqHistoryRepo.save(new RequestHistory(requestNumber, RequestStatus.ISSUED, loginUsername, remark, currentDate, currentDate));
		return Util.toMap("status", Constants.SUCCESS);
	}
	@Override
	public List<Request> getAllRequest() {
		return reqRepo.findAll();
	}
	
	@Transactional
	@Override
	public void revertRequest(Long requestNumber, String remark) {
		Date currentDate = new Date();
		String loginUsername = Util.getLoggedInUsername();
		Request request =reqRepo.findOne(requestNumber);
		request.setDescription(remark);
		request.setStatus(RequestStatus.PENDING);
		request.setUpdatedTime(currentDate);
		reqRepo.save(request);
		reqHistoryRepo.save(new RequestHistory(requestNumber, RequestStatus.PENDING, loginUsername, remark, currentDate, currentDate));
	}
	@Override
	public List<Request> getUserRequest(Users user) {
		return reqRepo.findByRequester(user);
	}
}
