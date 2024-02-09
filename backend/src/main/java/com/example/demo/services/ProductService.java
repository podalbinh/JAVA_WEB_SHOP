package com.example.demo.services;

import com.example.demo.entities.Product;
import com.example.demo.models.ProductDTO;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ProductService {

    public List<Product> findAll();

    public Product get(final Long id);

    public Long create(final ProductDTO productDTO);

    public List<Product> search(final String query);

    public Product update(Long id, final ProductDTO productDTO);

    public void delete(final Long id);

}