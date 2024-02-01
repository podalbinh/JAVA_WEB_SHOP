package com.example.demo.services;
import com.example.demo.repositories.ColorRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ColorService {
    @Autowired
    private ColorRepository colorRepository;
}