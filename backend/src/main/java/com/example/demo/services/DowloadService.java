package com.example.demo.services;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

public interface DowloadService {
    ByteArrayOutputStream dowloadExcel(Integer year,Integer month) throws IOException;
}
