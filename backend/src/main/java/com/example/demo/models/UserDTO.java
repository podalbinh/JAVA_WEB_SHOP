package com.example.demo.models;

import java.util.Date;
import java.util.Set;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class UserDTO {
    private String username;
    private String password;
    private String email;
    private String phone;
    private Date created = new Date();
    private boolean userStatus;
    private Set<String> listRoles;
}