package com.noida.manager;

import java.util.List;

import com.noida.model.Users;

public interface UserManager {
	public Users createUser(String empCode, String userName, String firstName, String lastName, 
	String contactNo, boolean enabled, String password);

	public List<Users> getAllUsers();

	public void updateUser(Long id, String name, String desc);

	public void deleteUser(Long id);
}
