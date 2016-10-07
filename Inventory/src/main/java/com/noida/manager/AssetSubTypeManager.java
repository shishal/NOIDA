package com.noida.manager;

import java.util.Date;
import java.util.List;

import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;

public interface AssetSubTypeManager {
	
	List<AssetSubType> getAllAssetSubType();

	void deleteAssetSubType(Long id);

	AssetSubType createAssetSubType(Long assetMainTypeId, String subType, String make, String desc, Date createdTime, Date updatedTime);

	void updateAssetSubType(Long id, Long assetMainTypeId, String subType, String make, String desc, Date updatedTime);

}
