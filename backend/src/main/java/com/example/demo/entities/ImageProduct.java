package com.example.demo.entities;

import javax.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "image_product")
public class ImageProduct {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "type")
    private String type;

    @Lob // Large Object
    @Column(name = "data", columnDefinition = "LONGBLOB")
    private byte[] data;

    @Column(name = "created_at")
    private LocalDateTime createdAt;


    @Column(name="product_id")
    private Long productId;

    @PrePersist
    public void prePersist() {
        createdAt = LocalDateTime.now();
    }

    public ImageProduct(String name, String type, byte[] data, Long productId) {
        this.name = name;
        this.type = type;
        this.data = data;
        this.productId=productId;
    }
}