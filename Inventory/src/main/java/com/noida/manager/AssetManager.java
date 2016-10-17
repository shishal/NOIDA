package com.noida.manager;

import java.util.Date;
import java.util.List;

import com.noida.model.Asset;
import com.noida.util.AssetStatus;

public interface AssetManager {
	
	List<Asset> getAllAsset();

	void deleteAsset(Long id);
	
	Asset createAsset(Long assetTypeId, Long assetSubTypeId, Long amcId, Long poId, String serialNumber,String barcode, AssetStatus status, String desc);

	void updateAsset(Long id, Long assetTypeId, Long assetSubTypeId, Long amcId, Long poId, String serialNumber,String barcode, AssetStatus status, String desc, Date returnDate, Long assetIssuedToId);

	Integer getAssetAvailability(Long assetSubTypeId);

}
