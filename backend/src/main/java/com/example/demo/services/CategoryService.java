package com.example.demo.services;

import com.example.demo.entities.Category;
import com.example.demo.models.CategoryDTO;

import java.util.List;


public interface CategoryService {

    public List<Category> findAll();

    public Category get(final Long id);

    public Long create(final CategoryDTO categoryDTO);

    public Category update(final Long id, final CategoryDTO categoryDTO);

    public void delete(final Long id);
}