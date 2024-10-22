package com.example.demo.services.imp;

import com.example.demo.commons.ExcelUtils;
import com.example.demo.models.ExcelDTO;
import com.example.demo.repositories.ProductRepository;
import com.example.demo.services.DowloadService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class DowloadServiceImpl implements DowloadService {
    @Autowired
    private ProductRepository productRepository;
    @Override
    public ByteArrayOutputStream dowloadExcel(Integer year,Integer month) throws IOException {
        List<ExcelDTO> listValueExcel = productRepository.getValueExcel(year,month);
        Workbook workbook = null;
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        String path="E:/JAVA_WEB_SHOP/Bao_cao_doanh_thu_theo_thang_cua_tung_san_pham.xlsx";
        try {
            workbook = new XSSFWorkbook(new FileInputStream(path));
            Sheet sheet = workbook.getSheetAt(0);

            Row rowHeader = sheet.getRow(0);
            String headerYear = rowHeader.getCell(0).getStringCellValue();
            headerYear= headerYear.replace("{year}",String.valueOf(year));
            rowHeader.getCell(0).setCellValue( headerYear);
            headerYear=headerYear.replace("{month}",String.valueOf(month));
            rowHeader.getCell(0).setCellValue( headerYear);
            int rowIndex= 5;
            int stt=1;
            Row styleRow= sheet.getRow(5);
            for(ExcelDTO valueExcel : listValueExcel){
                Row row = sheet.getRow(rowIndex);
                if(row==null){
                    row=sheet.createRow(rowIndex);
                }
                ExcelUtils.cloneRowStyle(styleRow,row);
                row.getCell(0).setCellValue(stt);
                row.getCell(1).setCellValue(valueExcel.getProductName());
                row.getCell(2).setCellValue(valueExcel.getColor());
                row.getCell(3).setCellValue(valueExcel.getCategory());
                row.getCell(4).setCellValue(valueExcel.getPrice());
                row.getCell(5).setCellValue(valueExcel.getQuantity());
                row.getCell(6).setCellValue(valueExcel.getRevenue());
                rowIndex++;
                stt++;
            }

            workbook.write(outputStream);
            workbook.close();
        } catch (IOException e) {
        } finally {
            if (workbook != null) {
                workbook.close();
            }
        }
        return outputStream;
    }

}
