package com.example.demo.jwt;


import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.example.demo.security.CustomUserDetails;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.UnsupportedJwtException;
import lombok.extern.slf4j.Slf4j;

//sinh ra jwt
@Component
@Slf4j
public class JwtTokenPovider {
    @Value("${demo.jwt.secret}")
    private String JWT_SECRET;
    @Value("${demo.jwt.expiration}")
    private int JWT_EXPIRATION;
    public String generateToken(CustomUserDetails CustomUserDetails){
        Date now =new Date();
        Date dateExpiration =new Date(now.getTime()+JWT_EXPIRATION);
        return Jwts.builder()
                    .setSubject(CustomUserDetails.getUsername())
                    .setIssuedAt(now)
                    .setExpiration(dateExpiration)
                    .signWith(SignatureAlgorithm.HS512,JWT_SECRET)
                    .compact();
    }
   
    public String getUserNameFromJwt(String token){
        Claims claims= Jwts.parser().setSigningKey(JWT_SECRET)
                            .parseClaimsJws(token).getBody();
     
        return claims.getSubject();
    }
    
    public boolean validateToken(String token){
        try{
            Jwts.parser().setSigningKey(JWT_SECRET)
                            .parseClaimsJws(token);
            return true;
        }catch (MalformedJwtException e){
            log.error("Invalid JWT Token");
        }catch(ExpiredJwtException e){
            log.error("Expired JWT Token");
        }catch(UnsupportedJwtException e){
            log.error("UnsupportedJwt");
        }catch (IllegalArgumentException e){
            log.error("JWT Claims String is empty");
        }
        return false;
    }
}
