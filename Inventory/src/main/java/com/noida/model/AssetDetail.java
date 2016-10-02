package com.noida.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class AssetDetail {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String serialNo;
	private String barcode;
	private int amcId;
	private int poId;
	private int assetMainTypeId;
	private int assetSubTypeId;
	private int status;
	private String description;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	
	public String getBarcode() {
		return barcode;
	}
	
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	
	public int getAmcId() {
		return amcId;
	}
	
	public void setAmcId(int amcId) {
		this.amcId = amcId;
	}
	
	public int getPoId() {
		return poId;
	}
	
	public void setPoId(int poId) {
		this.poId = poId;
	}
	
	public int getAssetMainTypeId() {
		return assetMainTypeId;
	}
	
	public void setAssetMainTypeId(int assetMainTypeId) {
		this.assetMainTypeId = assetMainTypeId;
	}
	
	public int getAssetSubTypeId() {
		return assetSubTypeId;
	}

	public void setAssetSubTypeId(int assetSubTypeId) {
		this.assetSubTypeId = assetSubTypeId;
	}

	public int getStatus() {
		return status;
	}
	
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public AssetDetail(String serialNo, String barcode, int amcId, int poId, int assetMainTypeId, 
			int assetSubTypeId, int status, String description) {
		super();
		this.serialNo = serialNo;
		this.barcode = barcode;
		this.amcId = amcId;
		this.poId = poId;
		this.assetMainTypeId = assetMainTypeId;
		this.assetSubTypeId = assetSubTypeId;
		this.status = status;
		this.description = description;
	}
	@Override
	public String toString() {
		return "AssetDetail [id=" + id + ", serialNo=" + serialNo + ", barcode=" + barcode + ", amcId=" + amcId
				+ ", poId=" + poId + ", assetMainTypeId=" + assetMainTypeId + ", assetSubTypeId=" + assetSubTypeId 
				+ ", status=" + status + ", description="
				+ description + "]";
	}
	
	
}
