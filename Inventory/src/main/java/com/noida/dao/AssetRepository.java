package com.noida.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.noida.model.Asset;
import com.noida.model.AssetSubType;


public interface AssetRepository extends CrudRepository<Asset, Long>{
	
	public List<Asset> findAssetByAssetSubType(AssetSubType subType);

}
