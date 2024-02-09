package com.example.demo.services;

import java.util.Optional;

import com.example.demo.entities.ERole;
import com.example.demo.entities.Role;

public interface RoleService {

    public Optional<Role> findByRoleName(ERole rolename);

}
