package com.noida.manager;

import java.util.List;
import java.util.Map;

import com.noida.model.AssetMainType;

public interface AssetTypeManager {
	
	public AssetMainType createAssetType(String name, String desc);

	public List<AssetMainType> getAllAssetType();

	public void updateAssetType(Long id, String name, String desc);

	public void deleteAssetType(Long id);

}
