package com.example.demo.services.imp;
import com.example.demo.entities.Color;
import com.example.demo.models.ColorDTO;
import com.example.demo.repositories.ColorRepository;
import com.example.demo.repositories.ColorRepository;
import com.example.demo.services.ColorService;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
public class ColorServiceImp implements ColorService {
     private final ColorRepository colorRepository;

    @Autowired
    private ModelMapper modelMapper;

    public ColorServiceImp(ColorRepository colorRepository) {
        this.colorRepository = colorRepository;

    }

    @Override
    public List<Color> findAll() {
        return colorRepository.findAll();
    }

    @Override
    public Color get(final Long id) {
        return colorRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @Override
    public Long create(final ColorDTO colorDTO) {
        final Color color = mapToEntity(colorDTO, new Color());
        return colorRepository.save(color).getId();
    }

    @Override
    public Color update(final Long id, final ColorDTO colorDTO) {
        Color color = colorRepository.findById(id)
                .orElseThrow(
                        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Cannot find color with id: " + id));
        color = mapToEntity(colorDTO, color);
        colorRepository.save(color);
        return color;
    }

    @Override
    public void delete(final Long id) {
        colorRepository.deleteById(id);
    }

    private Color mapToEntity(final ColorDTO colorDTO, Color color) {
        colorDTO.setId(color.getId());
        color = modelMapper.map(colorDTO, Color.class);
        return color;
    }

}