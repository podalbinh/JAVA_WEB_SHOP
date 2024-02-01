package com.example.demo.models;

import javax.validation.constraints.Size;

import java.util.Set;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ProductDTO {

    private Long id;

    @Size(max = 255)
    private String name;

    private String description;

    private Long color;

    @Size(max = 255)
    private String materials;

    private Set<Long> listSizes;

    @Size(max = 255)
    private String image;

    private String instruction;
    
    private Long price;

    private Long category;
}