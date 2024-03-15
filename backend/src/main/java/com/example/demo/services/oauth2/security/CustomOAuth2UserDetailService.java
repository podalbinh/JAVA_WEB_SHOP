package com.example.demo.services.oauth2.security;


import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.apache.catalina.connector.Response;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.example.demo.entities.ERole;
import com.example.demo.entities.Provider;
import com.example.demo.entities.Role;
import com.example.demo.entities.User;
import com.example.demo.repositories.RoleRepository;
import com.example.demo.repositories.UserRepository;
import com.example.demo.services.oauth2.OAuth2UserDetailFactory;
import com.example.demo.services.oauth2.OAuth2UserDetails;

@Service
public class CustomOAuth2UserDetailService extends DefaultOAuth2UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);
        try {
            return checkingOAuth2User(userRequest, oAuth2User);
        }
        catch(Exception e){
            throw new InternalAuthenticationServiceException(e.getMessage(),e.getCause());
        }

    }

    private OAuth2User checkingOAuth2User(OAuth2UserRequest oAuth2UserRequest, OAuth2User oAuth2User) {
        OAuth2UserDetails oAuth2UserDetails = OAuth2UserDetailFactory.OAuth2UserDetails(
                oAuth2UserRequest.getClientRegistration().getRegistrationId(),
                oAuth2User.getAttributes());
        if (ObjectUtils.isEmpty(oAuth2UserDetails)) {
            throw new RuntimeException("Can not found oauth2 user from properties");
        }
        Optional<User> user = userRepository.findByUsernameAndProviderId(
                oAuth2UserDetails.getEmail(),
                oAuth2UserRequest.getClientRegistration().getRegistrationId());
        User userDetail;
        if (user.isPresent()) {
            userDetail = user.get();
            if (!userDetail.getProviderId().equals(oAuth2UserRequest.getClientRegistration().getRegistrationId())) {
                // return String.valueOf(oAuth2UserRequest.getClientRegistration().getRegistrationId());
                throw new RuntimeException("Invalid site login with " + userDetail.getProviderId());
            }
            userDetail = updateOAuth2UserDetail(userDetail, oAuth2UserDetails);
        } else {
            userDetail = registerNewOAuth2USerDetail(oAuth2UserRequest, oAuth2UserDetails);
        }
        List<GrantedAuthority> listAuthorities = userDetail.getListRoles().stream()
                .map(roles -> new SimpleGrantedAuthority(roles.getRolename().name()))
                .collect(Collectors.toList());
        return new OAuth2UserDetailCustom(userDetail.getId(),
                userDetail.getUsername(),
                userDetail.getPassword(),
                listAuthorities);
    }

    public User registerNewOAuth2USerDetail(OAuth2UserRequest oAuth2UserRequest, OAuth2UserDetails oAuth2UserDetails) {
        User user = new User();
        user.setUsername(oAuth2UserDetails.getEmail());
        user.setProviderId(oAuth2UserRequest.getClientRegistration().getRegistrationId());
        user.setUserStatus(true);
        Set<Role> listRoles = new HashSet<>();
        // User quyen mac dinh
        Role userRoles = roleRepository.findByRolename(ERole.ROLE_USER)
                .orElseThrow(() -> new RuntimeException("Role is not found"));
        listRoles.add(userRoles);
        user.setListRoles(listRoles);
        return userRepository.save(user);
    }

    public User updateOAuth2UserDetail(User user, OAuth2UserDetails oAuth2UserDetails) {
            user.setUsername(oAuth2UserDetails.getEmail());
            return userRepository.save(user);
    }
}
