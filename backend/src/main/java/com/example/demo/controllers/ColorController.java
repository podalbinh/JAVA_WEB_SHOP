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

import com.example.demo.entities.Color;
import com.example.demo.models.ColorDTO;
import com.example.demo.services.ColorService;

import io.swagger.v3.oas.annotations.responses.ApiResponse;

@RestController
@RequestMapping(value = "/api/v1/colors", produces = MediaType.APPLICATION_JSON_VALUE)
public class ColorController {

    @Autowired
    private final ColorService colorService;

    public ColorController(final ColorService colorService) {
        this.colorService = colorService;
    }

    @GetMapping
    public ResponseEntity<List<Color>> getAllCategories() {
        return ResponseEntity.ok(colorService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Color> getColor(@PathVariable final Long id) {
        return ResponseEntity.ok(colorService.get(id));
    }

    @PostMapping
    @ApiResponse(responseCode = "201")
    public ResponseEntity<Long> createColor(@RequestBody @Valid final ColorDTO colorDTO) {
        return new ResponseEntity<>(colorService.create(colorDTO), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Color> updateColor(@PathVariable final Long id,
            @RequestBody @Valid final ColorDTO colorDTO) {
        return ResponseEntity.ok(colorService.update(id, colorDTO));
    }

    @DeleteMapping("/{id}")
    @ApiResponse(responseCode = "204")
    public ResponseEntity<Void> deleteColor(@PathVariable final Long id) {
        colorService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
