package com.example.demo.models;

import javax.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryDTO {

    private Long id;

    @Size(max = 255)
    private String name;

    private Long parentCategory;
}