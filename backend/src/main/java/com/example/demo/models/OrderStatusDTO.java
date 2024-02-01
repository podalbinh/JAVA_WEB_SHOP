package com.example.demo.models;

import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderStatusDTO {

    private Long id;

    @Size(max = 50)
    private String name;

    @Size(max = 255)
    private String description;

}
