package com.noida.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class AssetMainType {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String mainType;
	private String desc;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getMainType() {
		return mainType;
	}
	
	public void setMainType(String mainType) {
		this.mainType = mainType;
	}
	
	public String getDesc() {
		return desc;
	}
	
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public AssetMainType(String mainType, String desc) {
		super();
		this.mainType = mainType;
		this.desc = desc;
	}
	@Override
	public String toString() {
		return "AssetMainType [id=" + id + ", mainType=" + mainType + ", desc=" + desc + "]";
	}
	
}
