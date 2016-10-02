package com.noida.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
	private String status;
	private String contactNo;

    protected Users() {}

	public Users(String username, String password, boolean enabled, String firstName, String lastName, int deptId,
			String empCode, String status, String contactNo) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.firstName = firstName;
		this.lastName = lastName;
		this.deptId = deptId;
		this.empCode = empCode;
		this.status = status;
		this.contactNo = contactNo;
	}

	public String getUsername() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public int getDeptId() {
		return deptId;
	}

	public String getEmpCode() {
		return empCode;
	}

	public String getStatus() {
		return status;
	}

	public String getContactNo() {
		return contactNo;
	}

	@Override
	public String toString() {
		return "Users [username=" + username + ", password=" + password + ", enabled=" + enabled + ", firstName="
				+ firstName + ", lastName=" + lastName + ", deptId=" + deptId + ", empCode=" + empCode + ", status="
				+ status + ", contactNo=" + contactNo + "]";
	}
}