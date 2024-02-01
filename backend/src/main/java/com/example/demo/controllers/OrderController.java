package com.example.demo.controllers;
import com.example.demo.services.OrderService;

import io.swagger.v3.oas.annotations.responses.ApiResponse;

import com.example.demo.entities.Order;
import com.example.demo.models.OrderDTO;

import java.util.List;
import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping(path = "/api/v1/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping
    public ResponseEntity<List<Order>> getAll() {
        return ResponseEntity.ok(orderService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Order> getOrder(@PathVariable Long id) {
        return ResponseEntity.ok(orderService.get(id));
    }

    @PostMapping("")
    @ApiResponse(responseCode = "201")
    public ResponseEntity<Long> createOrderFromCart(@RequestBody OrderDTO orderDTO) {
        return new ResponseEntity<>(orderService.createOrderFromCart(orderDTO), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> updateOrder(@PathVariable Long id, @RequestBody OrderDTO orderDTO) {
        orderService.update(id, orderDTO);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/{id}")
    @ApiResponse(responseCode = "204")
    public ResponseEntity<Void> deleteOrder(@PathVariable Long id) {
        orderService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
