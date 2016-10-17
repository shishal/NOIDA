package com.noida.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.noida.model.AssetIssue;
import com.noida.model.AssetSubType;

public interface AssetIssueRepository extends CrudRepository<AssetIssue, Long>{
	
	List<AssetIssue> findAssetIssueByAssetAssetSubTypeAndReturnDateIsNull(AssetSubType subType);
}
