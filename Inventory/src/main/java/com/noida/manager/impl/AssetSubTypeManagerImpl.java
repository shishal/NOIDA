package com.noida.manager.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.AssetSubTypeRepository;
import com.noida.exception.InventoryException;
import com.noida.manager.AssetSubTypeManager;
import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;
import com.noida.util.Message;

@Service
public class AssetSubTypeManagerImpl implements AssetSubTypeManager{

	@Autowired
	AssetSubTypeRepository assetSubTypeRepo;

	@Override
	public AssetSubType createAssetSubType(Long assetMainTypeId, String subType, String make, String desc, Date createdTime, Date updatedTime) {
		try{
			
			return  assetSubTypeRepo.save(new AssetSubType(new AssetMainType(assetMainTypeId), subType,make, desc, new Date(), new Date()));
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_SUB_TYPE,e);
	    }
	}

	@Override
	public List<AssetSubType> getAllAssetSubType() {
		return Lists.newArrayList(assetSubTypeRepo.findAll());
	}

	@Override
	public void updateAssetSubType(Long id, Long assetMainTypeId, String subType, String make, String desc, Date updatedTime) {
		try{
			assetSubTypeRepo.save(new AssetSubType(id, new AssetMainType(assetMainTypeId), subType, make, desc, new Date()));
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_SUB_TYPE,e);
	    }
		
	}

	@Override
	public void deleteAssetSubType(Long id) {
		try{
			assetSubTypeRepo.delete(id);
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.UNKNOW_ERROR,e);
	    }
		
	}

	
}
