package com.example.demo.services.Imp;

import com.example.demo.repositories.SizeRepository;
import com.example.demo.services.SizeService;
import com.example.demo.entities.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SizeServiceImp implements SizeService {
    @Autowired
    private SizeRepository sizeRepository;

    @Override
    public List<Size> findAll() {
        return sizeRepository.findAll();
    }

    @Override
    public Size get(final Long id) {
        return sizeRepository.findById(id).orElseThrow(() -> new RuntimeException("Can't find size with id: " + id));
    }

}
