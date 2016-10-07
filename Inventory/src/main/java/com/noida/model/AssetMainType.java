package com.noida.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AssetMainType {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String mainType;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getMainType() {
		return mainType;
	}
	
	public void setMainType(String mainType) {
		this.mainType = mainType;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDesc(String description) {
		this.description = description;
	}
	
	public Date getCreatedTime() {
		return createdTime;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public AssetMainType(String mainType, String description, Date createdTime, Date updatedTime) {
		super();
		this.mainType = mainType;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}
	
	public AssetMainType(Long id, String mainType, String description, Date updatedTime) {
		super();
		this.id = id;
		this.mainType = mainType;
		this.description = description;
		this.updatedTime = updatedTime;
	}

	public AssetMainType(String mainType, String description) {
		super();
		this.mainType = mainType;
		this.description = description;
	}

	@Override
	public String toString() {
		return "AssetMainType [id=" + id + ", mainType=" + mainType + ", description=" + description + ", createdTime="
				+ createdTime + ", updatedTime=" + updatedTime + "]";
	}

	public AssetMainType() {
		super();
	}

	public AssetMainType(Long id) {
		this.id =id;
	}
}
