package com.example.demo.commons;

import org.apache.poi.ss.usermodel.*;

public class ExcelUtils {
    /**
     * Clone style từ hàng gốc sang hàng đích.
     *
     * @param sourceRow Hàng gốc có kiểu cần sao chép.
     * @param targetRow   Hàng đích để nhận kiểu đã sao chép.
     *
     */
    public static void cloneRowStyle(Row sourceRow, Row targetRow) {
        for (int i = 0; i < sourceRow.getLastCellNum(); i++) {
            Cell oldCell = sourceRow.getCell(i);
            Cell newCell = targetRow.getCell(i);
            if (newCell == null) {
                newCell = targetRow.createCell(i);
            }

            if (oldCell != null) {
                newCell.setCellStyle(oldCell.getCellStyle());
            }
        }
    }
}
