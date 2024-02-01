package com.example.demo.controllers;

import com.example.demo.entities.Category;
import com.example.demo.models.CategoryDTO;
import com.example.demo.services.CategoryService;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import java.util.List;
import javax.validation.Valid;
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
import org.springframework.beans.factory.annotation.Autowired;


@RestController
@RequestMapping(value = "/api/v1/categories", produces = MediaType.APPLICATION_JSON_VALUE)
public class CategoryController {

    @Autowired
    private final CategoryService categoryService;

    public CategoryController(final CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping
    public ResponseEntity<List<Category>> getAllCategories() {
        return ResponseEntity.ok(categoryService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Category> getCategory(@PathVariable final Long id) {
        return ResponseEntity.ok(categoryService.get(id));
    }

    @PostMapping
    @ApiResponse(responseCode = "201")
    public ResponseEntity<Long> createCategory(@RequestBody @Valid final CategoryDTO categoryDTO) {
        return new ResponseEntity<>(categoryService.create(categoryDTO), HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Category> updateCategory(@PathVariable final Long id,
            @RequestBody @Valid final CategoryDTO categoryDTO) {
        return ResponseEntity.ok(categoryService.update(id, categoryDTO));
    }

    @DeleteMapping("/{id}")
    @ApiResponse(responseCode = "204")
    public ResponseEntity<Void> deleteCategory(@PathVariable final Long id) {
        categoryService.delete(id);
        return ResponseEntity.noContent().build();
    }

}