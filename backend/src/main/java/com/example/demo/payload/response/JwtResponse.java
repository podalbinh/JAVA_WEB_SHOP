package com.example.demo.payload.response;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JwtResponse {
    private String token; 
    private String type="Bearer";
    private String username;
    private String email;
    private String phone;
    private List<String> listRoles;
    public JwtResponse(String token, String username, String email, String phone, List<String> listRoles) {
        this.token = token;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.listRoles = listRoles;
    }

}
