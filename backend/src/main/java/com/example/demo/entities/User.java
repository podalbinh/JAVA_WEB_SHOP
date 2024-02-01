package com.example.demo.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.FetchType;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class User {
    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String username;

    @JsonIgnore
    @Column(nullable = false)
    private String password;

    @Column(unique = true)
    private String email;

    @Column(name = "Created")
    @JsonFormat(pattern = "dd/MM/yyyy")
    private Date created;

    @Column
    private String phone;

    @Column
    private boolean userStatus;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name="User_Role",
    joinColumns = @JoinColumn(name="user_id"),
    inverseJoinColumns = @JoinColumn(name="role_id"))
    private Set<Role> listRoles=new HashSet<>();

    @OneToMany(mappedBy = "user")
    private Set<CartItem> userCartItems;
}
