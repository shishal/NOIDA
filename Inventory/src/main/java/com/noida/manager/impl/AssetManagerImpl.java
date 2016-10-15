package com.noida.manager.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.AssetRepository;
import com.noida.exception.InventoryException;
import com.noida.manager.AssetManager;
import com.noida.model.AMC;
import com.noida.model.Asset;
import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;
import com.noida.model.PO;
import com.noida.util.AssetStatus;
import com.noida.util.Message;

@Service
public class AssetManagerImpl implements AssetManager{

	@Autowired
	AssetRepository assetDetailRepo;

	@Override
	public List<Asset> getAllAsset() {
		return Lists.newArrayList(assetDetailRepo.findAll());
	}

	@Override
	public void deleteAsset(Long id) {
		try{
			assetDetailRepo.delete(id);
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.UNKNOW_ERROR,e);
	    }
		
	}

	@Override
	public Asset createAsset(Long assetTypeId, Long assetSubTypeId, Long amcId, Long poId,
			String serialNumber, String barcode, AssetStatus status, String desc) {

		try {

			return assetDetailRepo.save(
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

	@Override
	public void updateAsset(Long id, Long assetTypeId, Long assetSubTypeId, Long amcId, Long poId,
			String serialNumber, String barcode, AssetStatus status, String desc) {
		try {
			 	assetDetailRepo.save(
				new Asset(id, new AssetMainType(assetTypeId),
				new AssetSubType(assetSubTypeId),
				new AMC(amcId),
				new PO(poId), 
				status,
				serialNumber,
				barcode,
				desc,
				new Date()));
		} catch (DataIntegrityViolationException e) {
			throw new InventoryException(Message.DUPLICATE_ASSET, e);
		}
	}

	
}
