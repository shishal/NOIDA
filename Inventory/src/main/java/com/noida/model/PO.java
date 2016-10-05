package com.noida.model;


import java.sql.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class PO {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String company;
	private Date poDate;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCompany() {
		return company;
	}
	
	public void setCompany(String company) {
		this.company = company;
	}
	
	public Date getPoDate() {
		return poDate;
	}
	
	public void setPoDate(Date poDate) {
		this.poDate = poDate;
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

	public PO(String company, Date poDate, String description) {
		super();
		this.company = company;
		this.poDate = poDate;
		this.description = description;
	}
	
	public PO(String company, Date poDate, String description, Date createdTime, Date updatedTime) {
		super();
		this.company = company;
		this.poDate = poDate;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}

	@Override
	public String toString() {
		return "PO [id=" + id + ", company=" + company + ", poDate=" + poDate + ", description=" + description
				+ ", createdTime=" + createdTime + ", updatedTime=" + updatedTime + "]";
	}
}