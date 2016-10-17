package com.noida.model;

import java.util.Date;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import com.noida.util.RequestStatus;

public class RequestHistory {

	private int id;
	private int requestId;
	@Enumerated(EnumType.STRING)
	private RequestStatus status;
	private String byUser;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getRequestId() {
		return requestId;
	}
	
	public void setRequestId(int requestId) {
		this.requestId = requestId;
	}
	
	public RequestStatus getStatus() {
		return status;
	}
	
	public void setStatus(RequestStatus status) {
		this.status = status;
	}
	
	public String getByUser() {
		return byUser;
	}
	
	public void setByUser(String byUser) {
		this.byUser = byUser;
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

	public RequestHistory(int requestId, RequestStatus status, String byUser,
			String description) {
		super();
		this.requestId = requestId;
		this.status = status;
		this.byUser = byUser;
		this.description = description;
	}

	public RequestHistory(int requestId, RequestStatus status, String byUser, String description, Date createdTime,
			Date updatedTime) {
		super();
		this.requestId = requestId;
		this.status = status;
		this.byUser = byUser;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}

	@Override
	public String toString() {
		return "RequestHistory [id=" + id + ", requestId=" + requestId + ", status=" + status + ", byUser=" + byUser
				+ ", description=" + description + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime
				+ "]";
	}
}