package com.noida.manager;

import java.util.List;
import java.util.Set;

import com.noida.model.UserRoles;
import com.noida.model.Users;

public interface UserManager {
	public Users createUser(String empCode, String userName, String firstName, String lastName, 
	String contactNo, boolean enabled, String password, Long deptId, Set<UserRoles> userRoles);

	public List<Users> getAllUsers();
	
	public List<Users> getUser(String username);

	public void updateUser(String empCode, String userName, String firstName, String lastName, 
			String contactNo, boolean enabled, String password, Long deptId, Set<UserRoles> userRoles);

	public void deleteUser(String userName);
}
