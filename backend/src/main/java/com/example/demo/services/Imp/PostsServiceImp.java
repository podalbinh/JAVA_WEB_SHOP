package com.example.demo.services.imp;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.example.demo.entities.OrderItem;
import com.example.demo.entities.Post;
import com.example.demo.models.PostDTO;
import com.example.demo.repositories.PostRepository;
import com.example.demo.services.PostService;
@Service
public class PostsServiceImp implements PostService {

    @Autowired 
    private PostRepository postRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public List<Post> findAll() {
        return postRepository.findAll();
    }

    @Override
    public Post get(Long id) {
         return postRepository.findById(id)
                .orElseThrow(
                        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Cannot find post with id: " + id));
    }
    public Post mapToEntity(PostDTO postDTO,Post post){
        post= modelMapper.map(postDTO,Post.class);
        return post;
    }

    @Override
    public Long create(PostDTO postDTO) {
          final Post post = mapToEntity(postDTO,new Post());
        return postRepository.save(post).getId();
    }

    @Override
    public List<Post> search(String query) {
       List<Post> posts = postRepository.searchPosts(query);
        if (posts.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No posts found with query: " + query);
        }
        return posts;
    }

    @Override
    public Post update(Long id, PostDTO postDTO) {
        Post post= get(id);
        post.setBody(postDTO.getBody());
        post.setTitle(postDTO.getTitle());
        post.setModifyDate(postDTO.getModifyDate());
        post.setImageUrl(postDTO.getImageUrl());
        return postRepository.save(post);
    }

    @Override
    public void delete(Long id) {
        postRepository.deleteById(id);
    }


    
}
