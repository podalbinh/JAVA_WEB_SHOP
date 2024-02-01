package com.example.demo.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/cart")
// dang nhap moi call dc api nay
public class TestController {
    @GetMapping(value="/all")
    public String cart(String s){
        return "S0nBu1 9848";
    }
}
