package com.example.demo.services;

import com.example.demo.entities.CartItem;

import com.example.demo.models.CartItemDTO;
import java.util.List;

public interface CartItemService {

    public List<CartItem> findAllByUserId();

    public void deleteAllByUserId();

    public CartItem get(final Long id);

    public CartItem create(CartItemDTO cartItemDTO);

    public CartItem update(Long id, CartItemDTO cartItemDTO);

    public void delete(Long id);
}