package com.taskmanagement.helper;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.taskmanagement.model.Assignee;
import com.taskmanagement.model.Staff;



public class ExcelHelper {
  public static String TYPE = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
  static String[] HEADERs = { "Department", "FirstName","LastName","Email","Password","MobileNo"};
  static String SHEET = "Assignee";

  public static boolean hasExcelFormat(MultipartFile file) {

    if (!TYPE.equals(file.getContentType())) {
      return false;
    }

    return true;
  }

  public static ByteArrayInputStream tutorialsToExcel(List<Assignee> assignees) {

    try (Workbook workbook = new XSSFWorkbook(); ByteArrayOutputStream out = new ByteArrayOutputStream();) {
      Sheet sheet = workbook.createSheet(SHEET);

      // Header
      Row headerRow = sheet.createRow(0);

      for (int col = 0; col < HEADERs.length; col++) {
        Cell cell = headerRow.createCell(col);
        cell.setCellValue(HEADERs[col]);
      }

      int rowIdx = 1;
      for (Assignee assignee : assignees) {
        Row row = sheet.createRow(rowIdx++);

        row.createCell(0).setCellValue(assignee.getDepartment());
        row.createCell(1).setCellValue(assignee.getFirstname());
        row.createCell(2).setCellValue(assignee.getLastname());
        row.createCell(3).setCellValue(assignee.getEmailid());
        row.createCell(4).setCellValue(assignee.getPassword());
//        row.createCell(5).setCellValue(assignee.getMobileno());
        //    row.createCell(2).setCellValue(tutorial.getDescription());
    //    row.createCell(3).setCellValue(tutorial.isPublished());
      }

      workbook.write(out);
      return new ByteArrayInputStream(out.toByteArray());
    } catch (IOException e) {
      throw new RuntimeException("fail to import data to Excel file: " + e.getMessage());
    }
  }

  public static List<Assignee> excelToTutorials(InputStream is) {
    try {
    	Workbook workbook = WorkbookFactory.create(is);

    	Sheet sheet = workbook.getSheetAt(0);
      Iterator<Row> rows = sheet.iterator();

      List<Assignee> assignees = new ArrayList<Assignee>();

      int rowNumber = 0;
      while (rows.hasNext()) {
        Row currentRow = rows.next();

        // skip header
        if (rowNumber == 0) {
          rowNumber++;
          continue;
        }

        Iterator<Cell> cellsInRow = currentRow.iterator();

        Assignee assignee = new Assignee();

        int cellIdx = 0;
        while (cellsInRow.hasNext()) {
          Cell currentCell = cellsInRow.next();

          switch (cellIdx) {
          case 0:
            assignee.setDepartment(currentCell.getStringCellValue());
            break;

          case 1:
            assignee.setFirstname(currentCell.getStringCellValue());
            break;
            
          case 2:
              assignee.setLastname(currentCell.getStringCellValue());
              break;
              
          case 3:
              assignee.setEmailid(currentCell.getStringCellValue());
              break;
//              
          case 4:
              assignee.setPassword(currentCell.getStringCellValue());
              break;
//              
//          case 5:
//              assignee.setMobileno(currentCell.getStringCellValue());
//              break;

//          case 2:
//            staff.setDescription(currentCell.getStringCellValue());
//            break;
//
//          case 3:
//            tutorial.setPublished(currentCell.getBooleanCellValue());
//            break;

          default:
            break;
          }

          cellIdx++;
        }

        assignees.add(assignee);
      }

      workbook.close();

      return assignees;
    } catch (IOException e) {
      throw new RuntimeException("fail to parse Excel file: " + e.getMessage());
    }
  }
}
