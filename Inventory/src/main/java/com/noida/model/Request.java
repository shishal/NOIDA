package com.noida.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.noida.util.RequestType;

@Entity
public class Request {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@ManyToOne(fetch=FetchType.LAZY)
	private AssetMainType assetMainType;
	@ManyToOne(fetch=FetchType.LAZY)
	private AssetSubType assetSubType;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name ="REQUESTER")
	private Users requester;
	private Date requestDate;
	private RequestType requestType;
	private int assetQuantity;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
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
	
	public Users getRequester() {
		return requester;
	}
	
	public void setRequester(Users requester) {
		this.requester = requester;
	}
	
	public Date getRequestDate() {
		return requestDate;
	}
	
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	
	public RequestType getRequestType() {
		return requestType;
	}
	
	public void setRequestType(RequestType requestType) {
		this.requestType = requestType;
	}
	
	public int getAssetQuantity() {
		return assetQuantity;
	}
	
	public void setAssetQuantity(int assetQuantity) {
		this.assetQuantity = assetQuantity;
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

	public Request(AssetMainType assetMainType, AssetSubType assetSubType, Users requester,
			Date requestDate, RequestType requestType, int assetQuantity,
			String description) {
		super();
		this.assetMainType = assetMainType;
		this.assetSubType = assetSubType;
		this.requester = requester;
		this.requestDate = requestDate;
		this.requestType = requestType;
		this.assetQuantity = assetQuantity;
		this.description = description;
	}

	public Request(AssetMainType assetMainType, AssetSubType assetSubType, Users requester, Date requestDate,
			RequestType requestType, int assetQuantity, String description, Date createdTime, Date updatedTime) {
		super();
		this.assetMainType = assetMainType;
		this.assetSubType = assetSubType;
		this.requester = requester;
		this.requestDate = requestDate;
		this.requestType = requestType;
		this.assetQuantity = assetQuantity;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}
	
	

	public Request() {
		super();
	}

	@Override
	public String toString() {
		return "RequestDetail [id=" + id + ", assetMainTypeId=" + assetMainType + ", assetSubTypeId="
				+ assetSubType + ", requester=" + requester + ", requestDate=" + requestDate + ", requestType="
				+ requestType + ", assetQuantity=" + assetQuantity + ", description=" + description + ", createdTime="
				+ createdTime + ", updatedTime=" + updatedTime + "]";
	}
}