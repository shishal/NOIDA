package com.noida.controller.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.noida.dao.UserRepository;
import com.noida.model.Users;
import com.noida.util.Util;

@RestController
@RequestMapping("test")
public class CommonRestController {
	
	@Autowired
	UserRepository userRepo;
	
	@RequestMapping("/changeStatus")
	//Call url: http://localhost:8080/test/changeStatus?username=admin&status=false
	public Map<String,Object> activateUser(@RequestParam String username, @RequestParam boolean status){
		//Users user = userRepo.findOne(username);//always find by primary key
		//System.out.println(user);
		
		userRepo.updateStatus(status, username);
		
		List<Users> updatedUserList = userRepo.findByUsername(username); // find by given field name
		Users u =null;
		if(!updatedUserList.isEmpty()){
			u = updatedUserList.get(0);
			System.out.println(u);
		}
		return Util.toMap("Response", "success", "NewUser",u);
	}

}
