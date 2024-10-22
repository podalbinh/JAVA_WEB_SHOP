package com.example.demo.repositories;

import com.example.demo.entities.ImageProduct;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ImageRepository extends JpaRepository<ImageProduct, Integer> {
    List<ImageProduct> findByOrderByCreatedAtDesc();
}