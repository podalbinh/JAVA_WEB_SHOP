package com.example.demo.controllers;

import com.example.demo.entities.ImageProduct;
import com.example.demo.entities.ImageUser;
import com.example.demo.services.ImageUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.HttpHeaders;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("api/v1/images-users")
@RequiredArgsConstructor
public class ImageUserController {
    @Autowired
    private final ImageUserService imageUserService;

    // Lấy danh sách ảnh
    @GetMapping("")
    public ResponseEntity<?> getAllImage() {
        return ResponseEntity.ok(imageUserService.getAllImage());
    }

    // Xem ảnh
    @GetMapping("{id}")
    public ResponseEntity<?> readImage(@PathVariable Long id) {
        ImageUser image = imageUserService.getImage(id);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(image.getType()))
                .body(image.getData());
    }

    // Xem ảnh với user id
    @GetMapping("/users/{id}")
    public ResponseEntity<?> readImageWithUserId(@PathVariable Long id) {
        ImageUser image = imageUserService.getImageWithUserId(id);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(image.getType()))
                .body(image.getData());
    }

    // Upload ảnh
    @PostMapping("")
    public ResponseEntity<?> uploadImage(@ModelAttribute("file") MultipartFile file, @RequestParam(required = false) Long userId) {
        return new ResponseEntity<>(imageUserService.uploadImage(file,userId), HttpStatus.CREATED);
    }

    // Update ảnh
    @PutMapping("")
    public ResponseEntity<?> updateImage(@ModelAttribute("file") MultipartFile file, @RequestParam(required = false) Long userId) {
        return new ResponseEntity<>(imageUserService.updateImage(file,userId), HttpStatus.CREATED);
    }


    // Download ảnh
    @GetMapping("/download/{id}")
    public ResponseEntity<?> downloadImage(@PathVariable Long id) {
        ImageUser image = imageUserService.getImage(id);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(image.getType()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + image.getName() + "\"")
                .body(new ByteArrayResource(image.getData()));
    }

    // Xóa ảnh
    @DeleteMapping("{id}")
    public ResponseEntity<?> deleteImage(@PathVariable Long id) {
        imageUserService.deleteImage(id);
        return ResponseEntity.noContent().build(); // 204
    }
}

