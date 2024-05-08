package com.example.demo.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Size;
import com.example.demo.models.SizeDTO;
import com.example.demo.services.SizeService;

import io.swagger.v3.oas.annotations.responses.ApiResponse;

@RestController
@RequestMapping(value = "/api/v1/sizes", produces = MediaType.APPLICATION_JSON_VALUE)
public class SizeController {

    @Autowired
    private final SizeService sizeService;

    public SizeController(final SizeService sizeService) {
        this.sizeService = sizeService;
    }

    @GetMapping
    public ResponseEntity<List<Size>> getAllCategories() {
        return ResponseEntity.ok(sizeService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Size> getSize(@PathVariable final Long id) {
        return ResponseEntity.ok(sizeService.get(id));
    }

    @PostMapping
    @ApiResponse(responseCode = "201")
    public ResponseEntity<Long> createSize(@RequestBody @Valid final SizeDTO sizeDTO) {
        return new ResponseEntity<>(sizeService.create(sizeDTO), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Size> updateSize(@PathVariable final Long id,
            @RequestBody @Valid final SizeDTO sizeDTO) {
        return ResponseEntity.ok(sizeService.update(id, sizeDTO));
    }

    @DeleteMapping("/{id}")
    @ApiResponse(responseCode = "204")
    public ResponseEntity<Void> deleteSize(@PathVariable final Long id) {
        sizeService.delete(id);
        return ResponseEntity.noContent().build();
    }

}