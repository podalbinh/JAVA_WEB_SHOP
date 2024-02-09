package com.example.demo.services;

import com.example.demo.entities.Order;
import com.example.demo.models.OrderDTO;

import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface OrderService {

    public List<Order> findAll();

    public Order get(Long id);

    public Long create(final OrderDTO orderDTO);

    public Long createOrderFromCart(OrderDTO orderDTO);

    public void update(final Long id, final OrderDTO orderDTO);

    public void delete(final Long id);
}
