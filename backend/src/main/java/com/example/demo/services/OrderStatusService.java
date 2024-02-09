package com.example.demo.services;

import com.example.demo.entities.OrderStatus;
import com.example.demo.models.OrderStatusDTO;

import java.util.List;

public interface OrderStatusService {

    public List<OrderStatus> findAll();

    public OrderStatus get(final Long id);

    public Long create(final OrderStatusDTO orderStatusDTO);

    public void update(final Long id, final OrderStatusDTO orderStatusDTO);

    public void delete(final Long id);
}
