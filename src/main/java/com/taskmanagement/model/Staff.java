package com.taskmanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "staff")
public class Staff {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="Id")
	private int id;

	private String Department;

	private String Name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDepartment() {
		return Department;
	}

	public void setDepartment(String department) {
		Department = department;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public Staff(int id, String department, String name) {
		super();
		this.id = id;
		Department = department;
		Name = name;
	}

	public Staff() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Staff [id=" + id + ", Department=" + Department + ", Name=" + Name + "]";
	}

}
