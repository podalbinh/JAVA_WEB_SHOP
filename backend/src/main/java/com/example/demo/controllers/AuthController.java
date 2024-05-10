package com.example.demo.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.ERole;
import com.example.demo.entities.Role;
import com.example.demo.entities.User;
import com.example.demo.jwt.JwtTokenPovider;
import com.example.demo.models.UserDTO;
import com.example.demo.payload.request.LoginRequest;
import com.example.demo.payload.request.SignUpRequest;
import com.example.demo.payload.response.JwtResponse;
import com.example.demo.payload.response.MessageResponse;
import com.example.demo.security.AuthService;
import com.example.demo.security.CustomUserDetails;
import com.example.demo.services.RoleService;
import com.example.demo.services.UserService;

import io.swagger.v3.oas.annotations.Operation;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private JwtTokenPovider tokenPovider;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private PasswordEncoder encoder;
     @Autowired
    private AuthService authService;

    @PostMapping("/signup")
    public ResponseEntity<?> registerUser(@RequestBody SignUpRequest signUpRequest) {
        if (userService.existsByUsername(signUpRequest.getUsername())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Username is already"));
        }
        if (userService.existsByEmail(signUpRequest.getEmail())) {
            return ResponseEntity.badRequest().body(new MessageResponse("Email is already"));
        }
        User user = new User();
        user.setUsername(signUpRequest.getUsername());
        user.setPassword(encoder.encode(signUpRequest.getPassword()));
        user.setEmail(signUpRequest.getEmail());
        user.setPhone(signUpRequest.getPhone());
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date dateNow = new Date();
        String strNow = sdf.format(dateNow);
        try {
            user.setCreated(sdf.parse(strNow));
        } catch (Exception e) {
            e.printStackTrace();
        }
        user.setUserStatus(true);
        Set<String> roles = signUpRequest.getListRoles();
        Set<Role> listRoles = new HashSet<>();
        if (roles == null) {
            // User quyen mac dinh
            Role userRoles = roleService.findByRoleName(ERole.ROLE_USER)
                    .orElseThrow(() -> new RuntimeException("Role is not found"));
            listRoles.add(userRoles);
        } else {
            roles.forEach(role -> {
                switch (role) {
                    case "admin":
                        Role adminRoles = roleService.findByRoleName(ERole.ROLE_ADMIN)
                                .orElseThrow(() -> new RuntimeException("Role is not found"));
                        listRoles.add(adminRoles);
                        break;
                    case "moderator":
                        Role modRoles = roleService.findByRoleName(ERole.ROLE_MODERATOR)
                                .orElseThrow(() -> new RuntimeException("Role is not found"));
                        listRoles.add(modRoles);
                        break;
                    case "user":
                        Role userRoles = roleService.findByRoleName(ERole.ROLE_USER)
                                .orElseThrow(() -> new RuntimeException("Role is not found"));
                        listRoles.add(userRoles);
                        break;
                }
            });
        }
        user.setListRoles(listRoles);
        userService.saveOrUpdate(user);
        return ResponseEntity.ok(new MessageResponse("User registered successfully"));
    }

    @PostMapping("/signin")
    public ResponseEntity<?> loginUser(@RequestBody LoginRequest loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        CustomUserDetails customUserDetails = (CustomUserDetails) authentication.getPrincipal();
        String jwt = tokenPovider.generateToken(customUserDetails);
        List<String> listRoles = customUserDetails.getAuthorities().stream()
                .map(item -> item.getAuthority()).collect(Collectors.toList());
        return ResponseEntity.ok(new JwtResponse(jwt, customUserDetails.getUsername(), customUserDetails.getEmail(),
                customUserDetails.getPhone(), listRoles));
    }            
        @Operation(summary = "Update user with CurrentUser")
        @PreAuthorize("hasRole('ROLE_USER')")
        @PutMapping
        public ResponseEntity<?> saveOrUpdateUser(UserDTO userDTO) {
            User user = userService.findById(authService.getCurrentUserId());
            user.setPhone(userDTO.getPhone());
            if (userService.existsByUsername(userDTO.getUsername())) {
                return ResponseEntity.badRequest().body(new MessageResponse("Username is already"));
            }
            if (userService.existsByEmail(userDTO.getEmail())) {
                return ResponseEntity.badRequest().body(new MessageResponse("Email is already"));
            }
            user.setPassword(encoder.encode(userDTO.getPassword()));
            user.setEmail(userDTO.getEmail());
            user.setUsername(userDTO.getUsername());
            userService.saveOrUpdate(user);
            return ResponseEntity.ok(new String("Update success!"));
        }
}
