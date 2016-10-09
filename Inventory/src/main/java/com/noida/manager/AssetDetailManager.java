package com.noida.manager;

import java.util.List;

import com.noida.model.AssetDetail;

public interface AssetDetailManager {
	
	List<AssetDetail> getAllAssetDetail();

	void deleteAssetDetail(Long id);

}
