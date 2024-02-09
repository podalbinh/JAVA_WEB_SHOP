package com.example.demo.services.Imp;

import com.example.demo.repositories.OrderStatusRepository;
import com.example.demo.services.OrderStatusService;
import com.example.demo.entities.OrderStatus;
import com.example.demo.models.OrderStatusDTO;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderStatusServiceImp implements OrderStatusService {

    @Autowired
    private OrderStatusRepository orderStatusRepository;

    @Autowired
    private ModelMapper modelMapper;

    public OrderStatusServiceImp() {
    }

    @Override
    public List<OrderStatus> findAll() {
        return orderStatusRepository.findAll();
    }

    @Override
    public OrderStatus get(final Long id) {
        return orderStatusRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Can't find orderStatus with id: " + id));
    }

    @Override
    public Long create(final OrderStatusDTO orderStatusDTO) {
        OrderStatus orderStatus = modelMapper.map(orderStatusDTO, OrderStatus.class);
        return orderStatusRepository.save(orderStatus).getId();
    }

    @Override
    public void update(final Long id, final OrderStatusDTO orderStatusDTO) {
        OrderStatus orderStatus = orderStatusRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Can't find orderStatus with id: " + id + " to update"));
        orderStatusDTO.setId(id);
        modelMapper.map(orderStatusDTO, orderStatus);
        orderStatusRepository.save(orderStatus);
    }

    @Override
    public void delete(final Long id) {
        orderStatusRepository.deleteById(id);
    }
}
