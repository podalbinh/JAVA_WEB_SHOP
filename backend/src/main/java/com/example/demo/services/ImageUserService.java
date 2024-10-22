package com.example.demo.services;


import com.example.demo.entities.ImageProduct;
import com.example.demo.entities.ImageUser;
import org.springframework.data.repository.query.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ImageUserService {
    public List<ImageUser> getAllImage();
    public ImageUser getImage(Long id);
    public ImageUser uploadImage(MultipartFile file, @Param("userId") Long userId);
    public void deleteImage(Long id);
    public ImageUser getImageWithUserId(Long productId);
    public ImageUser updateImage(MultipartFile file,Long userId);
}
