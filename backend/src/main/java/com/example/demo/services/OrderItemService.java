package com.example.demo.services;

import com.example.demo.entities.OrderItem;
import com.example.demo.models.OrderItemDTO;

import java.util.List;

public interface OrderItemService {

    public List<OrderItem> findAll();

    public OrderItem get(final Long id);

    public Long create(final OrderItemDTO orderItemDTO);

    public void update(final Long id, final OrderItemDTO orderItemDTO);

    public void delete(final Long id);

}