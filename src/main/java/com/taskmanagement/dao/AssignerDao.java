package com.taskmanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.taskmanagement.model.Assignee;
import com.taskmanagement.model.Assigner;

@Repository
public interface AssignerDao extends JpaRepository<Assigner, Integer> {
	
	Assigner findByEmailidAndPassword(String emailId, String password);
    List<Assigner> findByDepartment(String department);
    
}
