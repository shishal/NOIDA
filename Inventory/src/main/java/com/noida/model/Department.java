package com.noida.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Department {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String name;
	private String description;
	private Date createdTime;
	private Date updatedTime;
	/*@OneToMany(mappedBy = "dept", cascade = CascadeType.ALL)
	private Set<Users> users;*/
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
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

	/*public Set<Users> getUsers() {
		return users;
	}

	public void setUsers(Set<Users> users) {
		this.users = users;
	}*/

	public Department(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}

	public Department(String name, String description, Date createdTime, Date updatedTime) {
		super();
		this.name = name;
		this.description = description;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}
	
	public Department(Long id, String name, String description, Date updatedTime) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.updatedTime = updatedTime;
	}
	
	public Department() {
		super();
	}
	
	public Department(Long id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Department [id=" + id + ", name=" + name + ", description=" + description + ", createdTime="
				+ createdTime + ", updatedTime=" + updatedTime + "]";
	}
}