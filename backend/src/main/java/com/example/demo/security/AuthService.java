package com.example.demo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.example.demo.entities.User;
import com.example.demo.repositories.UserRepository;

@Service
public class AuthService {
    @Autowired
    private UserRepository userRepository;

    public Long getCurrentUserId() {
        CustomUserDetails u = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return u.getUserId();
    }

    public User getCurrentUser() {
        return userRepository.findById(getCurrentUserId()).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }
}
