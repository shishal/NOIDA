package com.noida.manager;

import java.util.Map;

import com.noida.model.AssetMainType;

public interface AssetTypeManager {
	
	public AssetMainType createAssetType(String name, String desc);
}
