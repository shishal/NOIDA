package com.noida.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

public class RequestDetail {

	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int requestId;
	private String assetMainTypeId;
	private String assetSubTypeId;
	private int requester;
	private Date requestDate;
	private String requestType;
	private int assetQuantity;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	
	public int getRequestId() {
		return requestId;
	}
	
	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}
	
	public String getAssetMainTypeId() {
		return assetMainTypeId;
	}
	
	public void setAssetMainTypeId(String assetMainTypeId) {
		this.assetMainTypeId = assetMainTypeId;
	}
	
	public String getAssetSubTypeId() {
		return assetSubTypeId;
	}
	
	public void setAssetSubTypeId(String assetSubTypeId) {
		this.assetSubTypeId = assetSubTypeId;
	}
	
	public int getRequester() {
		return requester;
	}
	
	public void setRequester(int requester) {
		this.requester = requester;
	}
	
	public Date getRequestDate() {
		return requestDate;
	}
	
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	
	public String getRequestType() {
		return requestType;
	}
	
	public void setRequestType(String requestType) {
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

	public RequestDetail(String assetMainTypeId, String assetSubTypeId, int requester,
			Date requestDate, String requestType, int assetQuantity,
			String description) {
		super();
		this.assetMainTypeId = assetMainTypeId;
		this.assetSubTypeId = assetSubTypeId;
		this.requester = requester;
		this.requestDate = requestDate;
		this.requestType = requestType;
		this.assetQuantity = assetQuantity;
		this.description = description;
	}

	public RequestDetail(String assetMainTypeId, String assetSubTypeId, int requester, Date requestDate,
			String requestType, int assetQuantity, String description, Date createdTime, Date updatedTime) {
		super();
		this.assetMainTypeId = assetMainTypeId;
		this.assetSubTypeId = assetSubTypeId;
		this.requester = requester;
		this.requestDate = requestDate;
		this.requestType = requestType;
		this.assetQuantity = assetQuantity;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}

	@Override
	public String toString() {
		return "RequestDetail [requestId=" + requestId + ", assetMainTypeId=" + assetMainTypeId + ", assetSubTypeId="
				+ assetSubTypeId + ", requester=" + requester + ", requestDate=" + requestDate + ", requestType="
				+ requestType + ", assetQuantity=" + assetQuantity + ", description=" + description + ", createdTime="
				+ createdTime + ", updatedTime=" + updatedTime + "]";
	}
}