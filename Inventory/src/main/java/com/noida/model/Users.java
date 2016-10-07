package com.noida.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Users {

	@Id
    private String username;
    private String password;
    private boolean enabled;
    private String firstName;
	private String lastName;
	private int deptId;
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

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
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

	public Users(String username, String password, boolean enabled, String firstName, String lastName, int deptId,
			String empCode, /*String status,*/ String contactNo, Date createdTime, Date updatedTime) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.firstName = firstName;
		this.lastName = lastName;
		this.deptId = deptId;
		this.empCode = empCode;
		/*this.status = status;*/
		this.contactNo = contactNo;
		this.createdTime = createdTime;
		this.updatedTime = updatedTime;
	}

	@Override
	public String toString() {
		return "Users [username=" + username + ", password=" + password + ", enabled=" + enabled + ", firstName="
				+ firstName + ", lastName=" + lastName + ", deptId=" + deptId + ", empCode=" + empCode + /*", status="
				+ status +*/ ", contactNo=" + contactNo + ", createdTime=" + createdTime + ", updatedTime=" + updatedTime
				+ "]";
	}
}