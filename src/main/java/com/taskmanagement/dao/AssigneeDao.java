package com.taskmanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.taskmanagement.model.Assignee;
import com.taskmanagement.model.Assigner;

@Repository
public interface AssigneeDao extends JpaRepository<Assignee, Integer> {
	
	Assignee findByEmailidAndPassword(String emailId, String password);
	List<Assignee> findByDepartment(String department);

}
