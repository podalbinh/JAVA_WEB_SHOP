package com.example.demo.entities;

import java.time.LocalDateTime;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import javax.persistence.Table;

@Entity
@Table(name = "\"order\"")
@Getter
@Setter
public class Order {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Long total;

    @Column
    private String address;

    @Column
    private String phone;

    @Column
    private String firstName;

    @Column
    private String lastName;

    @ManyToOne
    @JoinColumn(name = "status_id")
    private OrderStatus status;

    @OneToMany(mappedBy = "order")
    @JsonManagedReference
    @JsonIgnoreProperties("order")
    private Set<OrderItem> orderItems;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Column(updatable = false)
    @CreationTimestamp
    private LocalDateTime createdAt;

    @UpdateTimestamp
    private LocalDateTime updatedAt;
}