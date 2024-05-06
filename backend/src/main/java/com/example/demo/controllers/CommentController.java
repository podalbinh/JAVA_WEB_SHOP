package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.models.CommentDTO;
import com.example.demo.services.CommentService;


@RestController
@RequestMapping(path = "api/v1/comments")
public class CommentController {
     @Autowired
    private CommentService commentService;
    @GetMapping("/all/{id}")
    public ResponseEntity<?> getAllcommentByPostId(@PathVariable Long id) {
        return ResponseEntity.ok(commentService.findAll(id));
    }
    @PostMapping
    public ResponseEntity<?> create(@RequestBody CommentDTO commentDTO) {
        return ResponseEntity.ok(commentService.create(commentDTO));        
    }
    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id){
        commentService.delete(id);
    }
    @GetMapping("/{id}")
    public ResponseEntity<?> getcomment(@PathVariable Long id) {
        return  ResponseEntity.ok(commentService.get(id));
    }
}
