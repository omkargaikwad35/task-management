package com.taskmanagement.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.taskmanagement.model.Masters;
import com.taskmanagement.services.MastersServices;



@Controller
public class MastersController {
	
	@Autowired
	private MastersServices mastersServices;
	
	@GetMapping("/masters")
	public String showContacts(Model model) {
		List<Masters> status = this.mastersServices.getMasters();
		model.addAttribute("status",status );
		return "masters";
		
	}
	
	
	@GetMapping("/showMasters")
	public String getMasters(Model model) {
		Masters status=new Masters();
		model.addAttribute("status", status);
		return "showMasters";
		
	}
	@PostMapping("/saveMasters")
	public String saveMasters(@ModelAttribute("status") Masters masters, Model model) {
		this.mastersServices.saveMasters(masters);
		return "masters";
		
	}
	
	@GetMapping("/showEditMasters/{id}")
	public String showEditMasters(@PathVariable Integer id,Model model) {
		Masters status = this.mastersServices.getMasters(id);
		
		
		model.addAttribute("status", status);
		return "showEditMasters";
		
	}
	@GetMapping("/deleteMasters/{id}")
	public String deleteMastersById(@PathVariable Integer id) {
		
		String deleteMasters = this.mastersServices.deleteMasters(id);
		return deleteMasters;
	}

}
