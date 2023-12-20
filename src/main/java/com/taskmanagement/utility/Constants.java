package com.taskmanagement.utility;

public class Constants {

	public enum Department {
		IT("IT"),
		CS("CS"),
		CIVIL("Civil"),
		MECHANICAL("Mechanical");
		
		private String department;

	    private Department(String department) {
	      this.department = department;
	    }

	    public String value() {
	      return this.department;
	    }  
	}
	
	public enum TaskStatus {
		PENDING("Pending"),
		COMPLETE("Complete"),
		INCOMPLETE("Incomplete"),
		IN_PROGRESS("In progress"),
		WORKING("Working");
		
		private String status;

	    private TaskStatus(String status) {
	      this.status = status;
	    }

	    public String value() {
	      return this.status;
	    }  
	}
	
}
