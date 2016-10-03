package com.noida.manager.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.noida.dao.AssetTypeRepository;
import com.noida.exception.InventoryException;
import com.noida.manager.AssetTypeManager;
import com.noida.model.AssetMainType;
import com.noida.util.Message;

@Service
public class AssetTypeManagerImpl implements AssetTypeManager{

	@Autowired
	AssetTypeRepository assetTypeRespo;

	@Override
	public AssetMainType createAssetType(String name, String desc) {
		try{
			return  assetTypeRespo.save(new AssetMainType(name, desc));
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_MAIN_TYPE,e);
	    }
	}
	
}
