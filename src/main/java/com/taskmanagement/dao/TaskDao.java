package com.taskmanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.taskmanagement.model.Task;

@Repository
public interface TaskDao extends JpaRepository<Task, Integer> {
	
	List<Task> findByAssignerId(int assignerId);
	List<Task> findByAssigneeId(int assigneeId);
	List<Task> findByStartDateAndAssignerId(String startDate, int assignerId);
	List<Task> findByStartDateAndAssigneeId(String startDate, int assigneeId);
	List<Task> findByStartDate(String startDate);
	List<Task> findByEndDate(String endDate);
	List<Task> findByDepartment(String department);
	

}
