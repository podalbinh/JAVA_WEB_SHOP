package com.example.demo.services.imp;

import com.example.demo.commons.FileUtils;
import com.example.demo.entities.ImageProduct;
import com.example.demo.entities.ImageUser;
import com.example.demo.repositories.ImageUserRepository;
import com.example.demo.services.ImageUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Objects;
@Service
public class ImageUserServiceImpl  implements ImageUserService {
    @Autowired
    private final ImageUserRepository imageUserRepository;
    @Autowired
    private final FileUtils fileUtils;

    public ImageUserServiceImpl(ImageUserRepository imageUserRepository, FileUtils fileUtils) {
        this.imageUserRepository = imageUserRepository;
        this.fileUtils = fileUtils;
    }
    @Override
    public ImageUser getImageWithUserId(Long userId) {
        return imageUserRepository.findByUserId(userId).orElseThrow(() -> new RuntimeException("Not found image with user id = " + userId));
    }

    @Override
    public ImageUser updateImage(MultipartFile file, Long userId) {
        fileUtils.validateFile(file);

        try {
            String fileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
            ImageUser image =  imageUserRepository.findByUserId(userId).orElseThrow(() -> new RuntimeException("Not found image with user id = " + userId));
            image.setData(file.getBytes());
            image.setName(fileName);
            return imageUserRepository.save(image);

        } catch (Exception e) {
            throw new RuntimeException("Upload image error");
        }
    }

    public List<ImageUser> getAllImage() {
        return imageUserRepository.findByOrderByCreatedAtDesc();
    }

    public ImageUser getImage(Long id) {
        return imageUserRepository.findById(id).orElseThrow(() -> new RuntimeException("Not found image with id = " + id));
    }

    public ImageUser uploadImage(MultipartFile file, Long userId) {
        fileUtils.validateFile(file);

        try {
            String fileName = StringUtils.cleanPath(Objects.requireNonNull(file.getOriginalFilename()));
            ImageUser image = new ImageUser(fileName, file.getContentType(), file.getBytes(),userId);
            return imageUserRepository.save(image);
        } catch (Exception e) {
            throw new RuntimeException("Upload image error");
        }
    }

    public void deleteImage(Long id) {
        ImageUser image = imageUserRepository.findById(id).orElseThrow(() -> new RuntimeException("Not found image with id = " + id));

        imageUserRepository.delete(image);
    }
}
