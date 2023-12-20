package com.taskmanagement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "notification")
public class Notification {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int notification_id;

	
	private int task_id;

	private String notification;

	public Notification(int notification_id, int task_id, String notification) {
		super();
		this.notification_id = notification_id;
		this.task_id = task_id;
		this.notification = notification;
	}

	public Notification() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNotification_id() {
		return notification_id;
	}

	public void setNotification_id(int notification_id) {
		this.notification_id = notification_id;
	}

	public int getId() {
		return task_id;
	}

	public void setId(int task_id) {
		this.task_id = task_id;
	}

	public String getNotification() {
		return notification;
	}

	public void setNotification(String notification) {
		this.notification = notification;
	}

	@Override
	public String toString() {
		return "Notification [notification_id=" + notification_id + ", task_id=" + task_id + ", notification=" + notification
				+ "]";
	}

}
