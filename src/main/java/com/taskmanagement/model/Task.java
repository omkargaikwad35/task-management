package com.taskmanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Task {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private int id;

	private String taskname;

	private String description;

	private String department;

	private int assignerId;

	private int assigneeId;

	private String assignerStatus;

	private String assignerRemark;

	private String assigneeStatus;

	private String assigneeRemark;

	private String startDate;

	private String endDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public String gettaskname() {
		return taskname;
	}

	public void settaskname(String taskname) {
		this.taskname = taskname;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getAssignerId() {
		return assignerId;
	}

	public void setAssignerId(int assignerId) {
		this.assignerId = assignerId;
	}

	public int getAssigneeId() {
		return assigneeId;
	}

	public void setAssigneeId(int assigneeId) {
		this.assigneeId = assigneeId;
	}

	public String getAssignerStatus() {
		return assignerStatus;
	}

	public void setAssignerStatus(String assignerStatus) {
		this.assignerStatus = assignerStatus;
	}

	public String getAssignerRemark() {
		return assignerRemark;
	}

	public void setAssignerRemark(String assignerRemark) {
		this.assignerRemark = assignerRemark;
	}

	public String getAssigneeStatus() {
		return assigneeStatus;
	}

	public void setAssigneeStatus(String assigneeStatus) {
		this.assigneeStatus = assigneeStatus;
	}

	public String getAssigneeRemark() {
		return assigneeRemark;
	}

	public void setAssigneeRemark(String assigneeRemark) {
		this.assigneeRemark = assigneeRemark;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Task(int id, String taskname, String description, String department, int assignerId, int assigneeId,
			String assignerStatus, String assignerRemark, String assigneeStatus, String assigneeRemark,
			String startDate, String endDate) {
		super();
		this.id = id;
		this.taskname = taskname;
		this.description = description;
		this.department = department;
		this.assignerId = assignerId;
		this.assigneeId = assigneeId;
		this.assignerStatus = assignerStatus;
		this.assignerRemark = assignerRemark;
		this.assigneeStatus = assigneeStatus;
		this.assigneeRemark = assigneeRemark;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public Task() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", taskname=" + taskname + ", description=" + description + ", department="
				+ department + ", assignerId=" + assignerId + ", assigneeId=" + assigneeId + ", assignerStatus="
				+ assignerStatus + ", assignerRemark=" + assignerRemark + ", assigneeStatus=" + assigneeStatus
				+ ", assigneeRemark=" + assigneeRemark + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

}
