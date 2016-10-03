package com.noida.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AssetMainType {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String mainType;
	private String description;
	
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
	
	public String getDescription() {
		return description;
	}
	
	public void setDesc(String description) {
		this.description = description;
	}
	
	public AssetMainType(String mainType, String description) {
		super();
		this.mainType = mainType;
		this.description = description;
	}
	@Override
	public String toString() {
		return "AssetMainType [id=" + id + ", mainType=" + mainType + ", description=" + description + "]";
	}

	public AssetMainType() {
		super();
	}
	
}
