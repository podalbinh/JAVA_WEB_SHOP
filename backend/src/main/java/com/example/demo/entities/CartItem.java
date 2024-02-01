package com.example.demo.entities;
import com.example.demo.entities.User;
import com.example.demo.entities.Product;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.FetchType;
import javax.persistence.GenerationType;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Getter
@Setter
public class CartItem {
    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Integer quantity;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="product_id")
    private Product product;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="size_id")
    private Size size;

}
