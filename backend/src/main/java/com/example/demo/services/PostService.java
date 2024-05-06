package com.example.demo.services;

import java.util.List;

import com.example.demo.entities.Post;
import com.example.demo.entities.Post;
import com.example.demo.models.PostDTO;

public interface PostService {
    public List<Post> findAll();
    public Post get(final Long id);

    public Long create(final PostDTO PostDTO);

    public List<Post> search(final String query);

    public Post update(Long id, final PostDTO PostDTO);

    public void delete(final Long id);

}
