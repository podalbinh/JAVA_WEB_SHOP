package com.example.demo.controllers;

import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Comment;
import com.example.demo.models.PostDTO;
import com.example.demo.services.PostService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;





@RestController
@RequestMapping(path = "api/v1/posts")
public class PostController {
    @Autowired
    private PostService postService;
    @GetMapping
    public ResponseEntity<?> getAllPost() {
        return ResponseEntity.ok(postService.findAll());
    }
    @PostMapping
    public ResponseEntity<?> create(@RequestBody PostDTO postDTO) {
        return ResponseEntity.ok(postService.create(postDTO));        
    }
    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody PostDTO postDTO) {
        return ResponseEntity.ok(postService.update(id, postDTO));
    }
    @DeleteMapping("/{id}")
    public void deletet(@PathVariable Long id){
        postService.delete(id);
    }
    @GetMapping("/{id}")
    public ResponseEntity<?> getPost(@PathVariable Long id) {
        return  ResponseEntity.ok(postService.get(id));
    }
}
