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
	
	public PO(String company, Date poDate, String description) {
		super();
		this.company = company;
		this.poDate = poDate;
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "PO [id=" + id + ", company=" + company + ", poDate=" + poDate + ", description=" + description + "]";
	}
}