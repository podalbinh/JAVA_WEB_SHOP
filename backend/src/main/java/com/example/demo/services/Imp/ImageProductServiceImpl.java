package com.example.demo.services.imp;

import com.example.demo.commons.FileUtils;
import com.example.demo.entities.ImageProduct;
import com.example.demo.repositories.ImageProductRepository;
import com.example.demo.services.ImageProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Objects;

@Service
public class ImageProductServiceImpl implements ImageProductService {
    @Autowired
    private final ImageProductRepository imageProductRepository;
    @Autowired
    private final FileUtils fileUtils;

    public ImageProductServiceImpl(ImageProductRepository imageProductRepository, FileUtils fileUtils) {
        this.imageProductRepository = imageProductRepository;
        this.fileUtils = fileUtils;
    }


    public List<ImageProduct> getAllImage() {
        return imageProductRepository.findByOrderByCreatedAtDesc();
    }

    public ImageProduct getImage(Long id) {
        return imageProductRepository.findById(id).orElseThrow(() -> new RuntimeException("Not found image with id = " + id));
    }

    @Override
    public ImageProduct getImageWithProductId(Long productId) {
        return imageProductRepository.findByProductId(productId).orElseThrow(() -> new RuntimeException("Not found image with product id = " + productId));
    }

    public ImageProduct uploadImage(MultipartFile file, Long productId) {
        fileUtils.validateFile(file);

        try {
            String fileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
            ImageProduct image = new ImageProduct(fileName, file.getContentType(), file.getBytes(),productId);
            return imageProductRepository.save(image);
        } catch (Exception e) {
            throw new RuntimeException("Upload image error");
        }
    }


    public void deleteImage(Long id) {
        ImageProduct image = imageProductRepository.findById(id).orElseThrow(() -> new RuntimeException("Not found image with id = " + id));
        imageProductRepository.delete(image);
    }

    @Override
    public ImageProduct updateImage(MultipartFile file, Long productId) {
        fileUtils.validateFile(file);

        try {
            String fileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
            ImageProduct image = imageProductRepository.findById(productId).orElseThrow(() -> new RuntimeException("Not found image with id = " + productId));
            image.setData(file.getBytes());
            image.setName(fileName);
            return imageProductRepository.save(image);
        } catch (Exception e) {
            throw new RuntimeException("Upload image error");
        }
    }
}
