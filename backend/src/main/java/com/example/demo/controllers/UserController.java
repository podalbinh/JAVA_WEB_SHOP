package com.example.demo.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.security.AuthService;
import com.example.demo.services.UserService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;
import io.swagger.v3.oas.annotations.responses.ApiResponse;

import com.example.demo.entities.User;
import com.example.demo.models.UserDTO;

@RestController
@RequestMapping(value = "/api/users", produces = MediaType.APPLICATION_JSON_VALUE)
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private AuthService authService;

    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')")
    @GetMapping
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        return ResponseEntity.ok(userService.findAllUser());
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> getUser(@PathVariable Long id) {
        return ResponseEntity.ok(userService.get(id));
    }
    @GetMapping("/me")
    public ResponseEntity<User> me() {
        return ResponseEntity.ok(authService.getCurrentUser());

    }

    @PostMapping
    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')")
    @ApiResponse(responseCode = "201")
    public ResponseEntity<Long> createUser(@RequestBody @Valid UserDTO userDTO) {
        return new ResponseEntity<>(userService.create(userDTO), HttpStatus.CREATED);
    }

    @DeleteMapping("/{id}")
    @ApiResponse(responseCode = "204")
    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        userService.delete(id);
        return ResponseEntity.noContent().build();
    }
}