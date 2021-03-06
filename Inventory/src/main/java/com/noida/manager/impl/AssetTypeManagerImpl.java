package com.noida.manager.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.AssetTypeRepository;
import com.noida.exception.InventoryException;
import com.noida.manager.AssetTypeManager;
import com.noida.model.AssetMainType;
import com.noida.util.Message;

@Service
public class AssetTypeManagerImpl implements AssetTypeManager{

	@Autowired
	AssetTypeRepository assetTypeRepo;

	@Override
	public AssetMainType createAssetType(String name, String desc) {
		try{
			return  assetTypeRepo.save(new AssetMainType(name, desc, new Date(), new Date()));
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_MAIN_TYPE,e);
	    }
	}

	@Override
	public List<AssetMainType> getAllAssetType() {
		return Lists.newArrayList(assetTypeRepo.findAll());
	}

	@Override
	public void updateAssetType(Long id, String name, String desc) {
		try{
			assetTypeRepo.save(new AssetMainType(id, name, desc, new Date()));
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_MAIN_TYPE,e);
	    }
		
	}

	@Override
	public void deleteAssetType(Long id) {
		try{
			assetTypeRepo.delete(id);
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.UNKNOW_ERROR,e);
	    }
		
	}
	
}
