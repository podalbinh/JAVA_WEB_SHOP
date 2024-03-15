package com.example.demo.services.oauth2.security.handler;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.example.demo.jwt.JwtTokenPovider;
import com.example.demo.payload.response.JwtResponse;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class CustomOAuth2SuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    @Autowired
    private JwtTokenPovider tokenPovider;

   @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException, ServletException {
        String jwt = tokenPovider.generateToken(authentication);
        List<String> listRoles = authentication.getAuthorities().stream()
                .map(item -> item.getAuthority()).collect(Collectors.toList());
        getRedirectStrategy().sendRedirect(request, response, "http://127.0.0.1:5500/frontend/index.html?token=" + jwt);
    }
}
