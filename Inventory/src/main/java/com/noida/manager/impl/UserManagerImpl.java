package com.noida.manager.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.common.collect.Lists;
import com.noida.dao.UserRepository;
import com.noida.manager.UserManager;
import com.noida.model.Users;

@Service
public class UserManagerImpl implements UserManager {
	
	@Autowired
	UserRepository userRepo;

	@Override
	public Users createUser(String empCode, String userName, String firstName, String lastName, 
	String contactNo, boolean enabled, String password) {
	
		userRepo.save(new Users(userName, null, true, firstName, lastName, 1, empCode , contactNo, 
				new Date(), new Date()));
		return null;
	}

	@Override
	public List<Users> getAllUsers() {
		return Lists.newArrayList(userRepo.findAll());
	}

	@Override
	public void updateUser(Long id, String name, String desc) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(Long id) {
		// TODO Auto-generated method stub
		
	}

}
