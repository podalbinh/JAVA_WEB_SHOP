package com.example.demo.services.oauth2.security;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class OAuth2UserDetailCustom implements OAuth2User,UserDetails{

    private Long userId;
    private String username;
    private String password;
    private Collection<? extends GrantedAuthority> authorities;
    private Map<String,Object> attributes;
    private boolean accountNonLocked;
    private boolean credentialsNonExpired;
    private boolean acccountNonExpired;
    private boolean isEnabled;

    public OAuth2UserDetailCustom(Long userId,String username,String password,List<GrantedAuthority> authorities){
         this.userId=userId;
        this.username=username;
        this.password=password;
        this.authorities=authorities;
    }
    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }
    @Override
    public <A> A getAttribute(String name) {
        return OAuth2User.super.getAttribute(name);
    }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.authorities;
    }
    @Override
    public String getPassword() {
        return password;
    }
    @Override
    public String getUsername() {
        return username;
    }
    @Override
    public boolean isAccountNonExpired() {
        return acccountNonExpired;
    }
    @Override
    public boolean isAccountNonLocked() {
        return accountNonLocked;
    }

    @Override
    public boolean isEnabled() {
        return isEnabled;
    }
    @Override
    public String getName() {
       return String.valueOf(userId);
    }
    @Override
    public boolean isCredentialsNonExpired() {
      return credentialsNonExpired;
    }
    
}
