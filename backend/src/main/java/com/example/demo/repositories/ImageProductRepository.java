package com.example.demo.repositories;

import com.example.demo.entities.ImageProduct;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ImageProductRepository extends JpaRepository<ImageProduct, Long> {
    List<ImageProduct> findByOrderByCreatedAtDesc();
    Optional<ImageProduct> findByProductId(Long productId);
}