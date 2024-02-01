package com.example.demo.entities;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Size {
    @Id
    @Column(nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sizeId;

    @Column
    private String name;
}