package com.example.demo.repositories;

import com.example.demo.entities.Post;
import com.example.demo.entities.Product;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PostRepository extends JpaRepository<Post, Long> {
    List<Post> findAll();
    Optional<Post> findById(Long id);
    @Query("SELECT p FROM Post p WHERE " +
            "p.title LIKE CONCAT('%',:query, '%')")
    List<Post> searchPosts(String query);
}
