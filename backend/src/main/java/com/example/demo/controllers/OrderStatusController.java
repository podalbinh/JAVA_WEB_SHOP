package com.example.demo.controllers;

import com.example.demo.entities.OrderStatus;
import com.example.demo.models.OrderStatusDTO;
import com.example.demo.services.OrderStatusService;

import io.swagger.v3.oas.annotations.responses.ApiResponse;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.beans.factory.annotation.Autowired;
import javax.validation.Valid;
import java.util.List;


@RestController
@RequestMapping(path = "api/v1/order-statuses")
public class OrderStatusController {

    @Autowired
    private OrderStatusService orderStatusService;

    public OrderStatusController() {
    }
    @GetMapping
    public ResponseEntity<List<OrderStatus>> getAllOrderStatus() {
        return ResponseEntity.ok(orderStatusService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<OrderStatus> getOrderStatus(@PathVariable final Long id) {
        return ResponseEntity.ok(orderStatusService.get(id));
    }

    @PostMapping
    @ApiResponse(responseCode = "201")
    public ResponseEntity<Long> createOrderStatus(
            @RequestBody @Valid final OrderStatusDTO orderStatusDTO) {
        return new ResponseEntity<>(orderStatusService.create(orderStatusDTO), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> updateOrderStatus(@PathVariable final Long id,
            @RequestBody @Valid final OrderStatusDTO orderStatusDTO) {
        orderStatusService.update(id, orderStatusDTO);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/{id}")
    @ApiResponse(responseCode = "204")
    public ResponseEntity<Void> deleteOrderStatus(@PathVariable final Long id) {
        orderStatusService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
