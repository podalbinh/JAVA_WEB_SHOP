package com.example.demo.repositories;

import com.example.demo.entities.User;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    User findByUsername(String username);
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
}