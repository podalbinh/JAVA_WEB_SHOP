package com.example.demo.entities;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
@Getter
@Setter
public class OrderStatus {
    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(name = "\"description\"")
    private String description;
}
