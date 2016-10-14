package com.noida.manager.impl;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.UserRepository;
import com.noida.dao.UserRoleRepository;
import com.noida.exception.InventoryException;
import com.noida.manager.UserManager;
import com.noida.model.Department;
import com.noida.model.UserRoles;
import com.noida.model.Users;
import com.noida.util.Message;

@Service
public class UserManagerImpl implements UserManager {
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	UserRoleRepository userRoleRepo;

	@Override
	public Users createUser(String empCode, String userName, String firstName, String lastName, 
	String contactNo, boolean enabled, String password, Long deptId, Set<UserRoles> userRoles) {
	
		try {
			Users user =  userRepo.save(new Users(userName, password, enabled, firstName, lastName, new Department(deptId), empCode , userRoles, contactNo, 
				new Date(), new Date()));
			for(UserRoles role:userRoles){
				role.setUsername(user);
				role.setCreatedTime(new Date());
				userRoleRepo.save(role);
			}
			
			return user;
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_USER,e);
	    }
	}

	@Override
	public List<Users> getAllUsers() {
		return Lists.newArrayList(userRepo.findAll());
	}
	
	@Override
	public List<Users> getUser(String username) {
		return userRepo.findByUsername(username);
	}

	@Override
	public void updateUser(String userName, String empCode, String firstName, String lastName, 
			String contactNo, boolean enabled, String password, Long deptId,Set<UserRoles> userRoles) {
		try {
			userRepo.save(new Users(userName, password, enabled, firstName, lastName, new Department(deptId), empCode , userRoles, contactNo, 
				new Date()));
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.DUPLICATE_USER,e);
	    }
		
	}

	@Override
	public void deleteUser(String userName) {
		try{
			userRepo.delete(userName);
		}catch (DataIntegrityViolationException e) {
	        throw new InventoryException(Message.UNKNOW_ERROR,e);
	    }
		
	}

}
