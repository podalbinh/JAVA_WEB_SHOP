package com.example.demo.services;


import com.example.demo.entities.Size;

import java.util.List;

public interface SizeService {

    public List<Size> findAll();

    public Size get(final Long id);

}
