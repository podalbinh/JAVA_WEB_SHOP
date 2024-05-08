package com.example.demo.services.imp;

import com.example.demo.repositories.SizeRepository;
import com.example.demo.repositories.SizeRepository;
import com.example.demo.services.SizeService;
import com.example.demo.entities.Size;
import com.example.demo.entities.Size;
import com.example.demo.models.SizeDTO;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class SizeServiceImp implements SizeService {
   private final SizeRepository sizeRepository;

    @Autowired
    private ModelMapper modelMapper;

    public SizeServiceImp(SizeRepository sizeRepository) {
        this.sizeRepository = sizeRepository;

    }

    @Override
    public List<Size> findAll() {
        return sizeRepository.findAll();
    }

    @Override
    public Size get(final Long id) {
        return sizeRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @Override
    public Long create(final SizeDTO sizeDTO) {
        final Size size = mapToEntity(sizeDTO, new Size());
        return sizeRepository.save(size).getSizeId();
    }

    @Override
    public Size update(final Long id, final SizeDTO sizeDTO) {
        Size size = sizeRepository.findById(id)
                .orElseThrow(
                        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Cannot find size with id: " + id));
        size = mapToEntity(sizeDTO, size);
        sizeRepository.save(size);
        return size;
    }

    @Override
    public void delete(final Long id) {
        sizeRepository.deleteById(id);
    }

    private Size mapToEntity(final SizeDTO sizeDTO, Size size) {
        sizeDTO.setSizeId(size.getSizeId());
        size = modelMapper.map(sizeDTO, Size.class);
        return size;
    }

}
