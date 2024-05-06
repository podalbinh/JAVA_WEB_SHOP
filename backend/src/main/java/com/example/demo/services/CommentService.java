package com.example.demo.services;

import java.util.List;

import com.example.demo.entities.Comment;
import com.example.demo.models.CommentDTO;

public interface CommentService {
    public Long create(CommentDTO commentDTO);
    public void delete(Long id);
    public List<Comment> findAll(Long id);
    public Comment get(Long id);
}
