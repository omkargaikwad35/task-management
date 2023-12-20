package com.taskmanagement.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.taskmanagement.model.Masters;



@Service
public interface MastersServices{
	
public List<Masters>  getMasters();

public Masters getMasters(Integer id);

public String saveMasters(Masters masters);

public String deleteMasters(Integer id);
	
	
}
