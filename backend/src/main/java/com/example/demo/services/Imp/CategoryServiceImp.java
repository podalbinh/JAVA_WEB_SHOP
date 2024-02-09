package com.example.demo.services.Imp;

import com.example.demo.entities.Category;
import com.example.demo.models.CategoryDTO;
import com.example.demo.repositories.CategoryRepository;
import com.example.demo.services.CategoryService;

import java.util.List;
import java.util.stream.Collectors;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
public class CategoryServiceImp implements CategoryService {

    private final CategoryRepository categoryRepository;

    @Autowired
    private ModelMapper modelMapper;

    public CategoryServiceImp(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;

    }

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Category get(final Long id) {
        return categoryRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    @Override
    public Long create(final CategoryDTO categoryDTO) {
        final Category category = mapToEntity(categoryDTO, new Category());
        return categoryRepository.save(category).getId();
    }

    @Override
    public Category update(final Long id, final CategoryDTO categoryDTO) {
        Category category = categoryRepository.findById(id)
                .orElseThrow(
                        () -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Cannot find category with id: " + id));
        category = mapToEntity(categoryDTO, category);
        categoryRepository.save(category);
        return category;
    }

    @Override
    public void delete(final Long id) {
        categoryRepository.deleteById(id);
    }

    private Category mapToEntity(final CategoryDTO categoryDTO, Category category) {
        categoryDTO.setId(category.getId());
        category = modelMapper.map(categoryDTO, Category.class);
        if (categoryDTO.getParentCategory() != null) {
            category.setParentCategory(categoryRepository.findById(categoryDTO.getParentCategory())
                    .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND,
                            "Cannot find category with id: " + categoryDTO.getParentCategory())));
        }
        return category;
    }

}