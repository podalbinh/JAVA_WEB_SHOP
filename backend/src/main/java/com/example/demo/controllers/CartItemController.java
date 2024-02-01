package com.example.demo.controllers;
import com.example.demo.entities.CartItem;
import com.example.demo.services.CartItemService;
import com.example.demo.models.CartItemDTO;

import java.util.List;  
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.v3.oas.annotations.responses.ApiResponse;

@RestController
@RequestMapping("/api/v1/cart-items")
public class CartItemController {
    private final CartItemService cartItemService;

    private CartItemController(final CartItemService cartItemService) {
        this.cartItemService = cartItemService;
    }

    @GetMapping
    public ResponseEntity<List<CartItem>> findAllByUserId() {
        return ResponseEntity.ok(cartItemService.findAllByUserId());
    }

    @GetMapping("/{id}")
    public ResponseEntity<CartItem> findById(@PathVariable final Long id) {
        return ResponseEntity.ok(cartItemService.get(id));
    }

    @PostMapping
    @ApiResponse(responseCode = "201")
    public ResponseEntity<CartItem> create(@RequestBody final CartItemDTO cartItemDTO) {
        return ResponseEntity.ok(cartItemService.create(cartItemDTO));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CartItem> update(@PathVariable final Long id, @RequestBody final CartItemDTO cartItemDTO) {
        return ResponseEntity.ok(cartItemService.update(id, cartItemDTO));
    }

    @DeleteMapping("/{id}")
    @ApiResponse(responseCode = "204")
    public ResponseEntity<Void> delete(@PathVariable final Long id) {
        cartItemService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
