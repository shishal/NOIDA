package com.noida.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.AssetDetailRepository;
import com.noida.exception.InventoryException;
import com.noida.manager.AssetDetailManager;
import com.noida.model.AssetDetail;
import com.noida.util.Message;

@Service
public class AssetDetailManagerImpl implements AssetDetailManager{

	@Autowired
	AssetDetailRepository assetDetailRepo;

	@Override
	public List<AssetDetail> getAllAssetDetail() {
		return Lists.newArrayList(assetDetailRepo.findAll());
	}

	@Override
	public void deleteAssetDetail(Long id) {
		try{
			assetDetailRepo.delete(id);
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.UNKNOW_ERROR,e);
	    }
		
	}

	
}
