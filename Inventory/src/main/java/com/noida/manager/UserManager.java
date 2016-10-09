package com.noida.manager;

import java.util.List;

import com.noida.model.Users;

public interface UserManager {
	public Users createUser(String empCode, String userName, String firstName, String lastName, 
	String contactNo, boolean enabled, String password, Long deptId);

	public List<Users> getAllUsers();
	
	public List<Users> getUser(String username);

	public void updateUser(String empCode, String userName, String firstName, String lastName, 
			String contactNo, boolean enabled, String password, Long deptId);

	public void deleteUser(String userName);
}
