package com.example.demo.services;

import com.example.demo.entities.ImageProduct;
import org.springframework.data.repository.query.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ImageProductService {
    public List<ImageProduct> getAllImage();
    public ImageProduct getImage(Long id);
    public ImageProduct getImageWithProductId(Long productId);
    public ImageProduct uploadImage(MultipartFile file, @Param("productId") Long productId);
    public void deleteImage(Long id);
    public ImageProduct updateImage(MultipartFile file,Long productId);
}
