package com.noida.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.SelectBeforeUpdate;

@Entity
@SelectBeforeUpdate
public class Users {

	@Id
    private String username;
    private String password;
    private boolean enabled;
    private String firstName;
	private String lastName;
	
	@ManyToOne(fetch=FetchType.LAZY)
	private Department dept;
	@OneToMany(mappedBy="username")
	private Set<UserRoles> userRoles;
	private String empCode;
	/*private String status;*/
	private String contactNo;
	private Date createdTime;
	private Date updatedTime;
	
    protected Users() {}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Department getDepartment() {
		return dept;
	}

	public void setDepartment(Department department) {
		this.dept = department;
	}

	public String getEmpCode() {
		return empCode;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	/*public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}*/

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
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

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	

	public Set<UserRoles> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Set<UserRoles> userRoles) {
		this.userRoles = userRoles;
	}

	public Users(String username, String password, boolean enabled, String firstName, String lastName, Department department,
			String empCode, Set<UserRoles> userRoles, String contactNo, Date createdTime, Date updatedTime) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dept = department;
		this.empCode = empCode;
		this.userRoles = userRoles;
		this.contactNo = contactNo;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}
	
	public Users(String username, String password, boolean enabled, String firstName, String lastName, Department department,
			String empCode, Set<UserRoles> userRoles, String contactNo, Date updatedTime) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dept = department;
		this.empCode = empCode;
		this.userRoles = userRoles;
		this.contactNo = contactNo;
		this.updatedTime = updatedTime;
	}

	public Users(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Users [username=" + username + ", password=" + password + ", enabled=" + enabled + ", firstName="
				+ firstName + ", lastName=" + lastName + ", department=" + dept + ", empCode=" + empCode + ", userRoles="
				+ userRoles + ", contactNo=" + contactNo + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime
				+ "]";
	}
}