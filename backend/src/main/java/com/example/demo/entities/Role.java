package com.example.demo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Role{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Long roleId;
    
    @Column
    @Enumerated(EnumType.STRING)
    private ERole rolename;
}