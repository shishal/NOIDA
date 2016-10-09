package com.noida.model;


import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PO {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String company;
	private String poNumber;
	private Date poDate;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getPoNumber() {
		return poNumber;
	}

	public void setPoNumber(String poNumber) {
		this.poNumber = poNumber;
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

	public PO(String poNumber, String company, Date poDate, String description) {
		super();
		this.poNumber = poNumber;
		this.company = company;
		this.poDate = poDate;
		this.description = description;
	}
	
	public PO(String poNumber, String company, Date poDate, String description, Date createdTime, Date updatedTime) {
		super();
		this.poNumber = poNumber;
		this.company = company;
		this.poDate = poDate;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}

	public PO(Long id, String poNumber, String company, Date poDate, String desc, Date updatedTime) {
		super();
		this.id = id;
		this.poNumber = poNumber;
		this.company = company;
		this.poDate = poDate;
		this.description = desc;
		this.updatedTime = updatedTime;
	}

	public PO() {
		super();
	}

	@Override
	public String toString() {
		return "PO [id=" + id + ", company=" + company + ", poNumber=" + poNumber + ", poDate=" + poDate
				+ ", description=" + description + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime
				+ "]";
	}

	
}