package com.example.demo.models;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CartItemDTO {
    private Long id;

    private Long productId;
    
    private Integer quantity;

    private Long size;
}
