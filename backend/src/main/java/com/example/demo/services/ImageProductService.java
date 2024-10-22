package com.example.demo.services;

import com.example.demo.entities.Image;
import org.springframework.data.repository.query.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ImageService {
    public List<Image> getAllImage();
    public Image getImage(Integer id);
    public Image uploadImage(MultipartFile file, @Param("userId") Long userId,@Param("productId") Long productId);
    public void deleteImage(Integer id);
}
