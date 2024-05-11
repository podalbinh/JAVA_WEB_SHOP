package com.example.demo.controllers;

import java.util.List;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.User;
import com.example.demo.models.UserDTO;
import com.example.demo.payload.response.MessageResponse;
import com.example.demo.security.AuthService;
import com.example.demo.services.UserService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;


@RestController
@RequestMapping(value = "/api/users", produces = MediaType.APPLICATION_JSON_VALUE)
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private AuthService authService;
    @Autowired
    private PasswordEncoder encoder;
    @Operation(summary = "Get all User")
    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')")
    @GetMapping
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        return ResponseEntity.ok(userService.findAllUser());
    }
    @Operation(summary = "Get User By userId")
    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')")
    @GetMapping("/{id}")
    public ResponseEntity<User> getUser(@PathVariable Long id) {
        return ResponseEntity.ok(userService.get(id));
    }
    @Operation(summary = "Get current User")
    @GetMapping("/me")
    public ResponseEntity<User> me() {
        return ResponseEntity.ok(authService.getCurrentUser());

    }
    @Operation(summary = "Create User")
    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')")
    @PostMapping
    public ResponseEntity<?> createUser(@RequestBody UserDTO userDTO) {
        if (userService.existsByUsername(userDTO.getUsername())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Username is already"));
        }
        if (userService.existsByEmail(userDTO.getEmail())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Email is already"));
        }
        return new ResponseEntity<>(userService.create(userDTO), HttpStatus.CREATED);
    }
    @Operation(summary = "Search User")
    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')")
    @GetMapping("/search")
    public ResponseEntity<List<User>> searchUser(@RequestParam("query") String query) {
        return ResponseEntity.ok(userService.search(query));
    }
    @Operation(summary = "Delete User")
    @DeleteMapping("/{id}")
    @ApiResponse(responseCode = "204")
    @PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR')")
    public ResponseEntity<?> deleteUser(@PathVariable Long id) {
        userService.delete(id);
        return ResponseEntity.ok(new String("Delete success!"));
    }
    @Operation(summary = "Update user By ID with Admin")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PutMapping("/{id}")
    public ResponseEntity<?> saveOrUpdateUser(@PathVariable Long id, @RequestBody UserDTO userDTO) {
        User user = userService.findById(id);
        user.setPhone(userDTO.getPhone());
        System.out.println(userDTO.getPhone());
        if (userService.existsByUsername(userDTO.getUsername())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Username is already"));
        }
        if (userService.existsByEmail(userDTO.getEmail())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Email is already"));
        }
        user.setEmail(userDTO.getEmail());
        user.setUsername(userDTO.getUsername());
        userService.saveOrUpdate(user);
        return ResponseEntity.ok(new MessageResponse("Update success!"));
    } 
}