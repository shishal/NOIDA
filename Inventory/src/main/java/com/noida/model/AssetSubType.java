package com.noida.model;

import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class AssetSubType {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String mainTypeId;
	private String subType;
	private String make;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getMainTypeId() {
		return mainTypeId;
	}
	
	public void setMainTypeId(String mainTypeId) {
		this.mainTypeId = mainTypeId;
	}
	
	public String getSubType() {
		return subType;
	}
	
	public void setSubType(String subType) {
		this.subType = subType;
	}
	
	public String getMake() {
		return make;
	}
	
	public void setMake(String make) {
		this.make = make;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}

	public AssetSubType(String mainTypeId, String subType, String make, String description, Date createdTime,
			Date updatedTime) {
		super();
		this.mainTypeId = mainTypeId;
		this.subType = subType;
		this.make = make;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}

	@Override
	public String toString() {
		return "AssetSubType [id=" + id + ", mainTypeId=" + mainTypeId + ", subType=" + subType + ", make=" + make
				+ ", description=" + description + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime
				+ "]";
	}
}