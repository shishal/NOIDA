package com.noida.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class AssetDetail {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String serialNo;
	private String barcode;
	@ManyToOne(fetch=FetchType.LAZY)
	private AMC amc;
	@ManyToOne(fetch=FetchType.LAZY)
	private PO po;
	@ManyToOne(fetch=FetchType.LAZY)
	private AssetMainType assetMainType;
	@ManyToOne(fetch=FetchType.LAZY)
	private AssetSubType assetSubType;
	private int status;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
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
	

	public AMC getAmc() {
		return amc;
	}

	public void setAmc(AMC amc) {
		this.amc = amc;
	}

	public PO getPo() {
		return po;
	}

	public void setPo(PO po) {
		this.po = po;
	}

	public AssetMainType getAssetMainType() {
		return assetMainType;
	}

	public void setAssetMainType(AssetMainType assetMainType) {
		this.assetMainType = assetMainType;
	}

	public AssetSubType getAssetSubType() {
		return assetSubType;
	}

	public void setAssetSubType(AssetSubType assetSubType) {
		this.assetSubType = assetSubType;
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

	public AssetDetail(String serialNo, String barcode, AMC amc, PO po, AssetMainType assetMainType,
			AssetSubType assetSubType, int status, String description, Date createdTime, Date updatedTime) {
		super();
		this.serialNo = serialNo;
		this.barcode = barcode;
		this.amc = amc;
		this.po = po;
		this.assetMainType = assetMainType;
		this.assetSubType = assetSubType;
		this.status = status;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}

	@Override
	public String toString() {
		return "AssetDetail [id=" + id + ", serialNo=" + serialNo + ", barcode=" + barcode + ", amc=" + amc
				+ ", po=" + po + ", assetMainTypeId=" + assetMainType + ", assetSubTypeId=" + assetSubType
				+ ", status=" + status + ", description=" + description + ", createdTime=" + createdTime
				+ ", updatedTime=" + updatedTime + "]";
	}

	public AssetDetail() {
		super();
	}


}
