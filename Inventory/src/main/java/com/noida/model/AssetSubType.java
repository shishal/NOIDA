package com.noida.model;

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
	private String desc;
	
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
	
	public String getDesc() {
		return desc;
	}
	
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public AssetSubType(String mainTypeId, String subType, String make, String desc) {
		super();
		this.mainTypeId = mainTypeId;
		this.subType = subType;
		this.make = make;
		this.desc = desc;
	}
	@Override
	public String toString() {
		return "AssetSubType [id=" + id + ", mainTypeId=" + mainTypeId + ", subType=" + subType + ", make=" + make
				+ ", desc=" + desc + "]";
	}
	
}
