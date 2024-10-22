package com.example.demo.repositories;


import com.example.demo.entities.ImageProduct;
import com.example.demo.entities.ImageUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ImageUserRepository extends JpaRepository<ImageUser, Long> {
    List<ImageUser> findByOrderByCreatedAtDesc();
    Optional<ImageUser> findByUserId(Long productId);
}