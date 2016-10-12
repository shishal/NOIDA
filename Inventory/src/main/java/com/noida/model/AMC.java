package com.noida.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AMC {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String amcNumber;
	private Date startDate;
	private Date endDate;
	private String vendor;
	private String description;
	private Date createdTime;
	private Date updatedTime;

	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getAmcNumber() {
		return amcNumber;
	}

	public void setAmcNumber(String amcNumber) {
		this.amcNumber = amcNumber;
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
	
	
	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
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

	public AMC(String amcNumber, Date startDate, Date endDate, String vendor, String description, Date createdTime, Date updatedTime) {
		super();
		this.amcNumber = amcNumber;
		this.startDate = startDate;
		this.endDate = endDate;
		this.vendor = vendor;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}

	public AMC(Long id,String amcNumber, Date startDate, Date endDate, String vendor, String desc, Date updatedTime) {
		super();
		this.id= id;
		this.amcNumber = amcNumber;
		this.startDate = startDate;
		this.endDate = endDate;
		this.vendor = vendor;
		this.description = desc;
		this.updatedTime = updatedTime;
	}
	
	public AMC() {
		super();
	}

	public AMC(Long amcId) {
		this.id = amcId;
	}

	@Override
	public String toString() {
		return "AMC [id=" + id + ", amcNumber=" + amcNumber + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", vendor=" + vendor + ", description=" + description + ", createdTime=" + createdTime
				+ ", updatedTime=" + updatedTime + "]";
	}

	
}