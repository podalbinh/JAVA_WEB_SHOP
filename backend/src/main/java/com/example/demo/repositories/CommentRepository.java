package com.example.demo.repositories;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long>{

    // List<Comment> findByc(Comment one);
    Comment findOneById(Long id);
    List<Comment> findAllByPostId(Long Id);
}
