package com.noida.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.noida.model.Asset;
import com.noida.model.AssetIssue;
import com.noida.model.AssetSubType;
import com.noida.model.Users;

public interface AssetIssueRepository extends CrudRepository<AssetIssue, Long>{
	
	List<AssetIssue> findAssetIssueByAssetAssetSubTypeAndReturnDateIsNull(AssetSubType subType);
	
	List<AssetIssue> findByIssuedTo(Users issuedTo);
	
	List<AssetIssue> findByAssetAndReturnDateIsNotNull(Asset asset);
	
}
