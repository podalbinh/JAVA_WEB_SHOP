package com.example.demo.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.ERole;
import com.example.demo.entities.Role;
import com.example.demo.repositories.RoleRepository;
@Service
public class RoleService {
    
    public Optional<Role> findByRoleName(ERole rolename) {
        return roleRepository.findByRolename(rolename);
    }
    
    @Autowired
    private RoleRepository roleRepository;

}
