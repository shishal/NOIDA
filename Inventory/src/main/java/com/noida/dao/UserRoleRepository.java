package com.noida.dao;

import org.springframework.data.repository.CrudRepository;

import com.noida.model.UserRoles;

public interface UserRoleRepository extends CrudRepository<UserRoles, String> {

}
