package com.example.demo.controllers;


import com.example.demo.entities.ImageProduct;
import com.example.demo.entities.ImageUser;
import com.example.demo.services.ImageProductService;
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
@RequestMapping("api/v1/images-products")
@RequiredArgsConstructor
public class ImageProductController {
    @Autowired
    private final ImageProductService imageProductService;

    // Lấy danh sách ảnh
    @GetMapping("")
    public ResponseEntity<?> getAllImage() {
        return ResponseEntity.ok(imageProductService.getAllImage());
    }

    // Xem ảnh
    @GetMapping("{product-id}")
    public ResponseEntity<?> readImage(@PathVariable Long id) {
        ImageProduct image = imageProductService.getImage(id);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(image.getType()))
                .body(image.getData());
    }

    // Upload ảnh
    @PostMapping("")
    public ResponseEntity<?> uploadImage(@RequestParam("file") MultipartFile file,@RequestParam(required = false) Long productId) {
        return new ResponseEntity<>(imageProductService.uploadImage(file,productId), HttpStatus.CREATED);
    }

    // Download ảnh
    @GetMapping("/download/{id}")
    public ResponseEntity<?> downloadImage(@PathVariable Long id) {
        ImageProduct image = imageProductService.getImage(id);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(image.getType()))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + image.getName() + "\"")
                .body(new ByteArrayResource(image.getData()));
    }

    // Xóa ảnh
    @DeleteMapping("{id}")
    public ResponseEntity<?> deleteImage(@PathVariable Long id) {
        imageProductService.deleteImage(id);
        return ResponseEntity.noContent().build(); // 204
    }

    // Xem ảnh với product id
    @GetMapping("/products/{id}")
    public ResponseEntity<?> readImageWithProductId(@PathVariable Long id) {
        ImageProduct image = imageProductService.getImageWithProductId(id);
        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(image.getType()))
                .body(image.getData());
    }

    // Update ảnh
    @PutMapping("")
    public ResponseEntity<?> updateImage(@ModelAttribute("file") MultipartFile file, @RequestParam(required = false) Long productId) {
        return new ResponseEntity<>(imageProductService.updateImage(file,productId), HttpStatus.CREATED);
    }
}

