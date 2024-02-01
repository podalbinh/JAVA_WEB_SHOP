package com.example.demo.services;

import com.example.demo.repositories.OrderItemRepository;
import com.example.demo.repositories.OrderRepository;
import com.example.demo.entities.OrderItem;
import com.example.demo.models.OrderItemDTO;

import java.util.List;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderItemService {
    
    private final OrderItemRepository orderItemRepository;
    private final OrderRepository orderRepository;

    @Autowired
    private ModelMapper modelMapper;

    public OrderItemService(final OrderItemRepository orderItemRepository,final OrderRepository orderRepository) {
        this.orderItemRepository = orderItemRepository;
        this.orderRepository = orderRepository;
    }

    public List<OrderItem> findAll() {
        return orderItemRepository.findAll();
    }

    public OrderItem get(final Long id) {
        return orderItemRepository.findById(id).orElseThrow(() -> new RuntimeException("Can't find orderItem with id: " + id));
    }

    public Long create(final OrderItemDTO orderItemDTO) {
        final OrderItem orderItem = mapToEntity(orderItemDTO);
        return orderItemRepository.save(orderItem).getId();
    }
    
    public void update(final Long id, final OrderItemDTO orderItemDTO) {
        final OrderItem orderItem = orderItemRepository.findById(id).orElseThrow(() -> new RuntimeException("Can't find orderItem with id: " + id + " to update"));
        orderItem.setOrder(orderRepository.findById(orderItemDTO.getOrder()).orElseThrow(() -> new RuntimeException("Can't find order with id: " + orderItemDTO.getOrder() + " to update")));
        orderItemRepository.save(orderItem);
    }

    public void delete(final Long id) {
        orderItemRepository.deleteById(id);
    }

    public OrderItem mapToEntity(final OrderItemDTO orderItemDTO) {
        return modelMapper.map(orderItemDTO, OrderItem.class);
    }
}