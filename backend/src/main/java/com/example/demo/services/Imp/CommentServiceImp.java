package com.example.demo.services.imp;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.example.demo.entities.Comment;
import com.example.demo.models.CommentDTO;
import com.example.demo.repositories.CommentRepository;
import com.example.demo.repositories.PostRepository;
import com.example.demo.security.AuthService;
import com.example.demo.services.CommentService;
import com.example.demo.services.PostService;

@Service
public class CommentServiceImp implements CommentService {
    @Autowired
    private CommentRepository commentRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private AuthService authService;
    @Autowired
    private PostService postService;
    public Comment get(Long id){
             return commentRepository.findById(id)
             .orElseThrow(
                     () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Cannot find comment with id: " + id));
    }
    public Comment mapToEntity(CommentDTO commentDTO, Comment comment){
        comment = modelMapper.map(commentDTO,Comment.class);
        return comment;
    }
    @Override
    public Long create(CommentDTO commentDTO) {
        final Comment comment = new Comment();
        comment.setUser(authService.getCurrentUser());
        comment.setBody(commentDTO.getBody());
        comment.setPost(postService.get(commentDTO.getPostId()));
        return commentRepository.save(comment).getId();
    }
    
    @Override
    public void delete(Long id) {
        commentRepository.deleteById(id);
    }
     @Override
    public List<Comment> findAll(Long id) {
        return commentRepository.findAllByPostId(id);
    }
}