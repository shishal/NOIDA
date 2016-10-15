package com.noida.model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class AssetIssue {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@ManyToOne(fetch=FetchType.LAZY)
	private Asset asset;
	private String issueType;
	@ManyToOne(fetch=FetchType.LAZY)
	private Request request;
	private Date issueDate;
	private Date returnDate;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name ="ISSUED_TO")
	private Users issuedTo;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name ="ISSUED_BY")
	private Users issuedBy;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name ="RETURNED_BY")
	private Users returnedBy;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Asset getAsset() {
		return asset;
	}
	
	public void setAssetId(Asset asset) {
		this.asset = asset;
	}
	
	public String getIssueType() {
		return issueType;
	}
	
	public void setIssueType(String issueType) {
		this.issueType = issueType;
	}
	
	public Request getRequest() {
		return request;
	}
	
	public void setRequest(Request request) {
		this.request = request;
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
	
	
	public Users getIssuedTo() {
		return issuedTo;
	}

	public void setIssuedTo(Users issuedTo) {
		this.issuedTo = issuedTo;
	}

	public Users getIssuedBy() {
		return issuedBy;
	}

	public void setIssuedBy(Users issuedBy) {
		this.issuedBy = issuedBy;
	}

	public Users getReturnedBy() {
		return returnedBy;
	}
	
	public void setReturnedBy(Users returnedBy) {
		this.returnedBy = returnedBy;
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

	public AssetIssue(Asset asset, String issueType, Request request, Date issueDate, Date returnDate, Users issuedTo,
			Users issuedBy, Users returnedBy, String description, Date createdTime, Date updatedTime) {
		super();
		this.asset = asset;
		this.issueType = issueType;
		this.request = request;
		this.issueDate = issueDate;
		this.returnDate = returnDate;
		this.issuedTo = issuedTo;
		this.issuedBy = issuedBy;
		this.returnedBy = returnedBy;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}
	
	public void setAsset(Asset asset) {
		this.asset = asset;
	}
	

	public AssetIssue() {
		super();
	}

	@Override
	public String toString() {
		return "AssetIssue [id=" + id + ", asset=" + asset + ", issueType=" + issueType + ", request=" + request
				+ ", issueDate=" + issueDate + ", returnDate=" + returnDate + ", issuedTo=" + issuedTo + ", issuedBy="
				+ issuedBy + ", returnedBy=" + returnedBy + ", description=" + description + ", createdTime="
				+ createdTime + ", updatedTime=" + updatedTime + "]";
	}
}
