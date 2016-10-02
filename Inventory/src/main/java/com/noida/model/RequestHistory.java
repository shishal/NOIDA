package com.noida.model;

public class RequestHistory {

	private int id;
	private int requestId;
	private String status;
	private String byUser;
	private String desc;
	
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
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getByUser() {
		return byUser;
	}
	
	public void setByUser(String byUser) {
		this.byUser = byUser;
	}
	
	public String getDesc() {
		return desc;
	}
	
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	public RequestHistory(int requestId, String status, String byUser,
			String desc) {
		super();
		this.requestId = requestId;
		this.status = status;
		this.byUser = byUser;
		this.desc = desc;
	}
}