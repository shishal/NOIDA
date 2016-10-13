package com.noida.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.SelectBeforeUpdate;

@Entity
@SelectBeforeUpdate
public class AssetSubType {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@ManyToOne(fetch=FetchType.LAZY)
	private AssetMainType mainType;//No need for @JoinColumn("ColumnNAME") as default column will be main_type_id
	private String subType;
	private String make;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public AssetMainType getMainType() {
		return mainType;
	}

	public void setMainType(AssetMainType mainType) {
		this.mainType = mainType;
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

	public AssetSubType(AssetMainType mainType, String subType, String make, String description, Date createdTime,
			Date updatedTime) {
		super();
		this.mainType = mainType;
		this.subType = subType;
		this.make = make;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}

	public AssetSubType(Long id, AssetMainType mainType, String subType, String make, String desc, Date updatedTime) {
		super();
		this.id = id; 
		this.mainType = mainType;
		this.subType = subType;
		this.make = make;
		this.description = desc;
		this.updatedTime = updatedTime;
	}
	
	

	public AssetSubType() {
		super();
	}

	public AssetSubType(Long assetSubTypeId) {
		this.id = assetSubTypeId;
	}

	@Override
	public String toString() {
		return "AssetSubType [id=" + id + ", assetMainType=" + mainType + ", subType=" + subType + ", make=" + make
				+ ", description=" + description + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime
				+ "]";
	}
}