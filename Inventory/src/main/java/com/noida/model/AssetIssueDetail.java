package com.noida.model;


import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class AssetIssueDetail {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private int assetId;
	private String issueType;
	private int requestId;
	private Date issueDate;
	private Date returnDate;
	private int issuedBy;
	private int returnedBy;
	private String description;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getAssetId() {
		return assetId;
	}
	
	public void setAssetId(int assetId) {
		this.assetId = assetId;
	}
	
	public String getIssueType() {
		return issueType;
	}
	
	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}
	
	public int getRequestId() {
		return requestId;
	}
	
	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}
	
	public Date getIssueDate() {
		return issueDate;
	}
	
	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	
	public Date getReturnDate() {
		return returnDate;
	}
	
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	
	public int getIssuedBy() {
		return issuedBy;
	}
	
	public void setIssuedBy(int issuedBy) {
		this.issuedBy = issuedBy;
	}
	
	public int getReturnedBy() {
		return returnedBy;
	}
	
	public void setReturnedBy(int returnedBy) {
		this.returnedBy = returnedBy;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public AssetIssueDetail(int assetId, String issueType, int requestId,
			Date issueDate, Date returnDate, int issuedBy, int returnedBy,
			String description) {
		super();
		this.assetId = assetId;
		this.issueType = issueType;
		this.requestId = requestId;
		this.issueDate = issueDate;
		this.returnDate = returnDate;
		this.issuedBy = issuedBy;
		this.returnedBy = returnedBy;
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "AssetIssueDetail [id=" + id + ", assetId=" + assetId + ", issueType=" + issueType + ", requestId="
				+ requestId + ", issueDate=" + issueDate + ", returnDate=" + returnDate 
				+ ", issuedBy=" + issuedBy + ", returnedBy=" + returnedBy
				+ ", description=" + description + "]";
	}
	
	
}
