package com.example.demo.services.imp;

import com.example.demo.commons.FileUtils;
import com.example.demo.entities.ImageProduct;
import com.example.demo.repositories.ImageRepository;
import com.example.demo.services.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Objects;

@Service
public class ImageServiceImpl  implements ImageService {
    @Autowired
    private final ImageRepository imageRepository;
    @Autowired
    private final FileUtils fileUtils;

    public ImageServiceImpl(ImageRepository imageRepository, FileUtils fileUtils) {
        this.imageRepository = imageRepository;
        this.fileUtils = fileUtils;
    }

    public List<ImageProduct> getAllImage() {
        return imageRepository.findByOrderByCreatedAtDesc();
    }

    public ImageProduct getImage(Integer id) {
        return imageRepository.findById(id).orElseThrow(() -> new RuntimeException("Not found image with id = " + id));
    }

    public ImageProduct uploadImage(MultipartFile file, Long userId, Long productId) {
        fileUtils.validateFile(file);

        try {
            String fileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
            ImageProduct image = new ImageProduct(fileName, file.getContentType(), file.getBytes(),productId);
            return imageRepository.save(image);
        } catch (Exception e) {
            throw new RuntimeException("Upload image error");
        }
    }

    public void deleteImage(Integer id) {
        ImageProduct image = imageRepository.findById(id).orElseThrow(() -> new RuntimeException("Not found image with id = " + id));

        imageRepository.delete(image);
    }
}
