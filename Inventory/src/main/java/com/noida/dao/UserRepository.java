package com.noida.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.noida.model.Users;


public interface UserRepository extends CrudRepository<Users, String>{
	

	    List<Users> findByUsername(String name);
	    
	    @Transactional
	    @Modifying
	    @Query("UPDATE Users u SET u.enabled = :status WHERE u.username = :username")
	    int updateStatus(@Param("status") boolean status, @Param("username") String username);
	}
