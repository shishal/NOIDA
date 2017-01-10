package com.noida.manager.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.AssetIssueRepository;
import com.noida.dao.AssetRepository;
import com.noida.dao.RequestRepository;
import com.noida.dao.UserRepository;
import com.noida.exception.InventoryException;
import com.noida.manager.AssetManager;
import com.noida.model.AMC;
import com.noida.model.Asset;
import com.noida.model.AssetIssue;
import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;
import com.noida.model.PO;
import com.noida.model.Request;
import com.noida.model.Users;
import com.noida.util.AssetStatus;
import com.noida.util.Message;
import com.noida.util.RequestStatus;

@Service
public class AssetManagerImpl implements AssetManager{

	@Autowired
	AssetRepository assetRepo;
	
	@Autowired
	AssetIssueRepository assetIssueRepo;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	RequestRepository reqRepo;

	@Override
	public List<Asset> getAllAsset() {
		return Lists.newArrayList(assetRepo.findAll());
	}

	@Override
	public void deleteAsset(Long id) {
		try{
			assetRepo.delete(id);
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.UNKNOW_ERROR,e);
	    }
		
	}

	@Override
	public Asset createAsset(Long assetTypeId, Long assetSubTypeId, Long amcId, Long poId,
			String serialNumber, String barcode, AssetStatus status, String desc) {

		try {

			return assetRepo.save(
					new Asset(new AssetMainType(assetTypeId),
							new AssetSubType(assetSubTypeId),
							new AMC(amcId),
							new PO(poId), 
							status,
							serialNumber,
							barcode,
							desc,
							new Date(),
							new Date()));
		} catch (DataIntegrityViolationException e) {
			throw new InventoryException(Message.DUPLICATE_ASSET, e);
		}
	}

	@Transactional
	@Override
	public void updateAsset(Long id, Long assetTypeId, Long assetSubTypeId, Long amcId, Long poId,
			String serialNumber, String barcode, AssetStatus status, String desc, Date returnDate, Long assetIssuedToId) {
		try {
			 	assetRepo.save(
				new Asset(id, new AssetMainType(assetTypeId),
				new AssetSubType(assetSubTypeId),
				new AMC(amcId),
				new PO(poId), 
				status,
				serialNumber,
				barcode,
				desc,
				new Date()));
			 	if(assetIssuedToId != null) {
			 		AssetIssue issue = assetIssueRepo.findOne(assetIssuedToId);
			 		if(returnDate != null)
			 			issue.setReturnDate(returnDate);
				 	assetIssueRepo.save(issue);
			 	}
		} catch (DataIntegrityViolationException e) {
			throw new InventoryException(Message.DUPLICATE_ASSET, e);
		}
	}

	@Override
	public Integer getAssetAvailability(Long assetSubTypeId) {
		List<Asset> assetList = assetRepo.findAssetByAssetSubType(new AssetSubType(assetSubTypeId));
		List<AssetIssue> assetIssueList = assetIssueRepo.findAssetIssueByAssetAssetSubTypeAndReturnDateIsNull(new AssetSubType(assetSubTypeId));
		List<Request> approvedRequest = reqRepo.findByAssetSubTypeAndStatus(new AssetSubType(assetSubTypeId), RequestStatus.APPROVED);
		int totalApproved = 0;
		for(Request req:approvedRequest){
			totalApproved += req.getAssetQuantity();
		}
		return assetList.size() - assetIssueList.size() - totalApproved;
	}

	@Override
	public List<AssetIssue> getAssetByUsername(String username) {
		List<Users> user = userRepo.findByUsername(username);
		return assetIssueRepo.findByIssuedTo(user.get(0));
		
	}

	@Override
	public List<AssetIssue> getAssetHistory(Long assetId) {
		return assetIssueRepo.findByAsset(new Asset(assetId));
	}
	
}
