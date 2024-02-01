package com.example.demo.services;
import com.example.demo.repositories.SizeRepository;
import com.example.demo.entities.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SizeService {
    @Autowired
    private SizeRepository sizeRepository;

    public SizeService(final SizeRepository sizeRepository) {
        this.sizeRepository = sizeRepository;
    }

    public List<Size> findAll() {
        return sizeRepository.findAll();
    }

    public Size get(final Long id) {
        return sizeRepository.findById(id).orElseThrow(() -> new RuntimeException("Can't find size with id: " + id));
    }

}
