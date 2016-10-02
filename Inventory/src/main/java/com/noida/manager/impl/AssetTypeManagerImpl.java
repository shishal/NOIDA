package com.noida.manager.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.noida.dao.UserRepository;
import com.noida.manager.AssetTypeManager;
import com.noida.model.AssetMainType;

@Service
public class AssetTypeManagerImpl implements AssetTypeManager{

	@Autowired
	UserRepository userRepo;
	
	@Override
	public AssetMainType createAssetType(Map assetType) {
		
		return null;
	}

}
