package com.taskmanagement.services;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.taskmanagement.helper.ExcelHelper;
import com.taskmanagement.dao.AssigneeDao;
import com.taskmanagement.dao.FileRepository;
import com.taskmanagement.model.Assignee;
import com.taskmanagement.model.Staff;


//import com.bezkoder.spring.files.excel.helper.ExcelHelper;
//import com.bezkoder.spring.files.excel.model.Tutorial;
//import com.bezkoder.spring.files.excel.repository.TutorialRepository;

@Service
public class ExcelService {
  @Autowired
  private AssigneeDao assigneeDao;

  public void save(MultipartFile file) {
    try {
      List<Assignee> assignee = ExcelHelper.excelToTutorials(file.getInputStream());
      assigneeDao.saveAll(assignee);
    } catch (IOException e) {
      throw new RuntimeException("fail to store excel data: " + e.getMessage());
    }
  }

  public ByteArrayInputStream load() {
    List<Assignee> assignee = assigneeDao.findAll();

    ByteArrayInputStream in = ExcelHelper.tutorialsToExcel(assignee);
    return in;
  }

  public List<Assignee> getAllStaffs() {
    return assigneeDao.findAll();
  }
}
