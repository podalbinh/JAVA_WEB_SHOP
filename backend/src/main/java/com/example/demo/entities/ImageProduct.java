package com.example.demo.entities;

import javax.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "image")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "type")
    private String type;

    @Lob // Large Object
    @Column(name = "data", columnDefinition = "LONGBLOB")
    private byte[] data;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name ="user_id")
    private Long userId;

    @Column(name="product_id")
    private Long productId;

    @PrePersist
    public void prePersist() {
        createdAt = LocalDateTime.now();
    }

    public Image(String name, String type, byte[] data,Long userId,Long productId) {
        this.name = name;
        this.type = type;
        this.data = data;
        this.productId=productId;
        this.userId=userId;
    }
}