package com.example.demo.jwt;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import com.example.demo.security.CustomUserDetailsService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class JwtAuthenticationFilter extends OncePerRequestFilter {
    @Autowired
    private JwtTokenPovider JwtTokenPovider;
    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    private String getJwtFromRequest (HttpServletRequest request){
        String bearerToken = request.getHeader("Authorization");
        if(StringUtils.hasText(bearerToken)&& bearerToken.startsWith("Bearer ")){
            return bearerToken.substring(7);
        }
        return null;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        try{
            String jwt = getJwtFromRequest(request);
            if(StringUtils.hasText(jwt)&&JwtTokenPovider.validateToken(jwt)){
                String username=JwtTokenPovider.getUserNameFromJwt(jwt);
                UserDetails userDetails=customUserDetailsService.loadUserByUsername(username);
                if(userDetails!=null){
                    UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken
                     = new UsernamePasswordAuthenticationToken(
                        userDetails, null, userDetails.getAuthorities());
                usernamePasswordAuthenticationToken
                        .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
                }
            }
        }catch(Exception e){
                log.error("fail on set user authentication ",e);
        }
        filterChain.doFilter(request, response);
    }
    
    
}
