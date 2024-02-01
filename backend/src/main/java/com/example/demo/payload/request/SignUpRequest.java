package com.example.demo.payload.request;

import java.util.Date;
import java.util.Set;
public class SignUpRequest {
    private String username;
    private String password;
    private String email;
    private String phone;
    private Date created= new Date();
    private boolean userStatus;
    private Set<String> listRoles;
    
    public void setUsername(String username) {
        this.username = username;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public void setCreated(Date created) {
        this.created = created;
    }
    public void setUserStatus(boolean userStatus) {
        this.userStatus = userStatus;
    }
    public void setListRoles(Set<String> listRoles) {
        this.listRoles = listRoles;
    }
    public String getUsername() {
        return username;
    }
    public String getPassword() {
        return password;
    }
    public String getEmail() {
        return email;
    }
    public String getPhone() {
        return phone;
    }
    public Date getCreated() {
        return created;
    }
    public boolean isUserStatus() {
        return userStatus;
    }
    public Set<String> getListRoles() {
        return listRoles;
    }
}
