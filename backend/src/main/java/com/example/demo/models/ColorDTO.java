package com.example.demo.models;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ColorDTO {
    private Long id;
    private String name;
    private String image;
}
