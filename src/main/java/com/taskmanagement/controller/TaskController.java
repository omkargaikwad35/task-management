package com.taskmanagement.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.taskmanagement.dao.AssigneeDao;
import com.taskmanagement.dao.AssignerDao;
import com.taskmanagement.dao.TaskDao;
import com.taskmanagement.model.Task;

@Controller
public class TaskController {
	
	@Autowired
	private AssigneeDao assigneeDao;
	
	@Autowired
	private TaskDao taskDao;
	
	@Autowired
	private AssignerDao assignerDao;
	
	@GetMapping("/searchAllTaskByStartDate")
	public ModelAndView searchMyAssignedTaskByStartDate(@RequestParam("startDate") String startDate) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Task> tasks = taskDao.findByStartDate(startDate);
		
		mv.addObject("tasks",tasks);
		mv.setViewName("alltaskstatus");
		
		return mv;
	}
	
	@GetMapping("/searchAllTaskByEndDate")
	public ModelAndView searchMyAssignedTaskByEndDate(@RequestParam("endDate") String endDate) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Task> tasks = taskDao.findByEndDate(endDate);
		
		mv.addObject("tasks",tasks);
		mv.setViewName("alltaskstatus");
		
		return mv;
	}
	
	@GetMapping("/searchAllTaskByDepartment")
	public ModelAndView searchMyAssignedTaskByDepartment(@RequestParam("department") String department) {
		
		ModelAndView mv = new ModelAndView();
		
		List<Task> tasks = taskDao.findByDepartment(department);
		
		mv.addObject("tasks",tasks);
		mv.setViewName("alltaskstatus");
		
		return mv;
	}
	
	@GetMapping("/getAllTasks")
	public ModelAndView getAllTasks() {
		
		ModelAndView mv = new ModelAndView();
		
		List<Task> tasks = taskDao.findAll();
		
		mv.addObject("tasks",tasks);
		mv.setViewName("alltaskstatus");
		
		return mv;
	}

}
