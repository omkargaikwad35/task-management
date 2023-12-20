package com.taskmanagement.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.taskmanagement.dao.AssigneeDao;
import com.taskmanagement.dao.FileRepository;
import com.taskmanagement.helper.ExcelHelper;
import com.taskmanagement.model.Assignee;
import com.taskmanagement.model.Staff;
import com.taskmanagement.model.Task;
import com.taskmanagement.response.ResponseMessage;
import com.taskmanagement.services.ExcelService;





@CrossOrigin("http://localhost:8081")
@Controller
@RequestMapping("/api/excel")
public class ExcelController2 {

  @Autowired
  private ExcelService excelService;
  
  @Autowired
  private FileRepository fileRepository;
  
  @Autowired
  private AssigneeDao assigneeDao;
  
  @GetMapping("")
  public String goToExcelUpload()
  {
	  return "excelFile";
  }

  @PostMapping("/upload")
  public ResponseEntity<ResponseMessage> uploadFile(@RequestParam("file") MultipartFile file) {
    String message = "";

    if (ExcelHelper.hasExcelFormat(file)) {
      try {
    	  excelService.save(file);

        message = "Uploaded the file successfully: " + file.getOriginalFilename();
        return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
      } catch (Exception e) {
        message = "Could not upload the file: " + file.getOriginalFilename() + "!";
        return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
      }
    }

    message = "Please upload an excel file!";
    return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new ResponseMessage(message));
  }

  @GetMapping("/show")
  public ModelAndView getAllStaff() {
		
		ModelAndView mv = new ModelAndView();
		
		List<Assignee> assignee = assigneeDao.findAll();
		
		mv.addObject("assignee",assignee);
		mv.setViewName("showExcel");
		
		return mv;
	}

  @GetMapping("/download")
  public ResponseEntity<Resource> getFile() {
    String filename = "Staff.xlsx";
    InputStreamResource file = new InputStreamResource(excelService.load());

    return ResponseEntity.ok()
        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + filename)
        .contentType(MediaType.parseMediaType("application/vnd.ms-excel"))
        .body(file);
  }

}

