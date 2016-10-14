package com.noida.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.noida.model.AssetMainType;
import com.noida.model.AssetSubType;


public interface AssetSubTypeRepository extends CrudRepository<AssetSubType, Long>{
	
		List<AssetSubType> findByMainType(AssetMainType assetType);
	   
	}
