package com.example.demo.repositories;

import com.example.demo.entities.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;


@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    User findByUsername(String username);
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
    Optional<User> findByUsernameAndProviderId(String username, String providerId);
    @Query("SELECT u FROM User u WHERE " +
    "u.username LIKE CONCAT('%',:query, '%')")
    List<User> searchUser(String query);
}