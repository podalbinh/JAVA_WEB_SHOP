package com.example.demo.services;


import com.example.demo.entities.Size;
import com.example.demo.entities.Size;
import com.example.demo.models.SizeDTO;
import com.example.demo.models.SizeDTO;

import java.util.List;

import javax.validation.Valid;

public interface SizeService {
  public List<Size> findAll();

    public Size get(final Long id);

    public Long create(final SizeDTO sizeDTO);

    public Size update(final Long id, final SizeDTO sizeDTO);

    public void delete(final Long id);

}
