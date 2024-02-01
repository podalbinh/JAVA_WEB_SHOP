package com.example.demo.repositories;
import com.example.demo.entities.CartItem;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Long> {
    void deleteAllByUserId(Long userId);
    List<CartItem> findAllByUserId(Long userId);
    CartItem findByUserIdAndProductId(Long userId, Long productId);
}