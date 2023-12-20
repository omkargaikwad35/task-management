package com.taskmanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.taskmanagement.model.Masters;


@Repository
public interface MastersDao extends JpaRepository<Masters, Integer>{

}
