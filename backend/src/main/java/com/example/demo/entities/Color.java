package com.example.demo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.GenerationType;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Color {
    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String name;
    
    @Column
    private String image;
}
