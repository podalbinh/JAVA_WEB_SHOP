package com.example.demo.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.ERole;
import com.example.demo.entities.Role;
@Repository
public interface RoleRepository extends JpaRepository<Role,Long>{
    Optional<Role> findByRolename(ERole roleName);
}
