package com.taskmanagement.dao;

import java.io.InputStream;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.taskmanagement.model.Assignee;
import com.taskmanagement.model.Staff;

@Repository
public interface FileRepository extends JpaRepository<Assignee, Integer> {


	
}
