package com.example.demo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.example.demo.jwt.JwtAuthenticationFilter;
import com.example.demo.services.oauth2.security.CustomOAuth2UserDetailService;
import com.example.demo.services.oauth2.security.handler.CustomOAuth2FailureHandler;
import com.example.demo.services.oauth2.security.handler.CustomOAuth2SuccessHandler;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig {
    @Autowired
    private CustomOAuth2UserDetailService customOAuth2UserDetailService;
    @Autowired
    private CustomUserDetailsService customUserDetailsService;
    @Autowired
    public CustomOAuth2FailureHandler customOAuth2FailureHandler;
    @Autowired
    public CustomOAuth2SuccessHandler customOAuth2SuccessHandler;

    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter() {
        return new JwtAuthenticationFilter();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
            throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        AppConfig appConfig = new AppConfig();
        auth.userDetailsService(customUserDetailsService)
                .passwordEncoder(appConfig.passwordEncoder());
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.cors()
                .and().csrf().disable()
                .authorizeRequests()
                .antMatchers("/api/v1/auth/**").permitAll()
                .antMatchers("/api/v1/products/**").permitAll()
                .antMatchers("/api/v1/categories/**").permitAll()
                .antMatchers("/api/v1/colors/**").permitAll()
                .antMatchers("/api/v1/sizes/**").permitAll()
                .antMatchers("/api/v1/posts/**").permitAll()
                .antMatchers("/api/v1/comments/**").permitAll()
                .antMatchers("/api/users/**").permitAll()
                .antMatchers("/swagger-ui/**","/v3/**","/authenticate","/swagger-resources/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .oauth2Login()
                .userInfoEndpoint()
                .userService(customOAuth2UserDetailService)
                .and()
                .successHandler(customOAuth2SuccessHandler)
                .failureHandler(customOAuth2FailureHandler)
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED);
        return http.addFilterBefore(jwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class).build();
    }
}
