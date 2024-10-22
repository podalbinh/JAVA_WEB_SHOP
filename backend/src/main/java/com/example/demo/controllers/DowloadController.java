package com.example.demo.controllers;


import com.example.demo.services.DowloadService;
import lombok.Builder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;

@RestController
@RequestMapping(path = "api/v1/excels")
public class DowloadController {
    @Autowired
    private  final DowloadService dowloadService;

    public DowloadController(DowloadService dowloadService) {
        this.dowloadService = dowloadService;
    }

    @PostMapping("/export")
    public ResponseEntity<?> downloadExcel(
            @RequestParam(value = "year", required = false, defaultValue = "#{T(java.time.LocalDate).now().year}") Integer year,
            @RequestParam(value = "month", required = false, defaultValue = "#{T(java.time.LocalDate).now().monthValue}") Integer month) {
        byte[] bytes = null;
        try {
            bytes = dowloadService.dowloadExcel(year,month).toByteArray();
        }catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error");
        }
        String fileName="Bao_cao_doanh_thu_theo_thang_cua_tung_san_pham";
        var inputStream = new ByteArrayInputStream(bytes);
        var resource = new InputStreamResource(inputStream);
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + fileName + ".xlsx");
        httpHeaders.add(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
        return ResponseEntity.ok()
                .headers(httpHeaders)
                .contentLength(bytes.length)
                .contentType(MediaType.APPLICATION_OCTET_STREAM)
                .body(resource);
    }
}
