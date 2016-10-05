package com.noida.model;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class AMC {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private Date startDate;
	private Date endDate;
	private String description;
	private Date createdTime;
	private Date updatedTime;

	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public Date getStartDate() {
		return startDate;
	}
	
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getEndDate() {
		return endDate;
	}
	
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
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

	public AMC(Date startDate, Date endDate, String description, Date createdTime, Date updatedTime) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}

	@Override
	public String toString() {
		return "AMC [id=" + id + ", startDate=" + startDate + ", endDate=" + endDate + ", description=" + description
				+ ", createdTime=" + createdTime + ", updatedTime=" + updatedTime + "]";
	}
	

}