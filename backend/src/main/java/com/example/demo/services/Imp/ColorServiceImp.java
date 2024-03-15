package com.example.demo.services.imp;
import com.example.demo.repositories.ColorRepository;
import com.example.demo.services.ColorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ColorServiceImp implements ColorService {
    @Autowired
    private ColorRepository colorRepository;
}