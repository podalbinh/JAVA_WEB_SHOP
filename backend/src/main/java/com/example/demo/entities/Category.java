package com.example.demo.entities;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;



@Entity
@Getter
@Setter
public class Category {

    @Id
    @Column(nullable = false, updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @ManyToOne
    @JoinColumn(name = "parent_category_id")
    private Category parentCategory;

    public void compare(Category category)
    {
        if (category.getName() != null ) this.name = category.getName();
        if (category.getParentCategory() != null ) this.parentCategory = category.getParentCategory();
    }

}