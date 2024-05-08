package com.example.demo.services;

import java.util.List;

import javax.validation.Valid;

import com.example.demo.entities.Color;
import com.example.demo.models.ColorDTO;

public interface ColorService {
    
    public List<Color> findAll();

    public Color get(final Long id);

    public Long create(final ColorDTO colorDTO);

    public Color update(final Long id, final ColorDTO colorDTO);

    public void delete(final Long id);
}