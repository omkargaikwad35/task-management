<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Assigned Task</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>

	<%
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = formatter.format(date);

	List<Task> tasks = null;
	tasks = (List<Task>) request.getAttribute("tasks");
	%>

	<div class="container-fluid">
		<div class="row mt-4">
			<form class="form-inline ml-5" action="searchAllTaskByStartDate">
				<div class="form-group">
					<label for="inputPassword2" class="text-color"><h4>Search
							Task By Start Date</h4></label> <input type="date" class="form-control ml-3"
						id="inputPassword2" name="startDate" required>
				</div>

				<button type="submit" class="btn text-color custom-bg ml-2">Search</button>
			</form>

			<form class="form-inline ml-5" action="searchAllTaskByEndDate">
				<div class="form-group">
					<label for="inputPassword2" class="text-color"><h4>Search
							Task By End Date</h4></label> <input type="date" class="form-control ml-3"
						id="inputPassword2" name="endDate" required>
				</div>

				<button type="submit" class="btn text-color custom-bg ml-2">Search</button>
			</form>

			<form class="form-inline ml-5" action="searchAllTaskByDepartment">
				<div class="form-group">
					<label for="inputPassword2" class="text-color"><h4>Search
							Task By Department</h4></label> <select name="department"
						class="form-control" required>
						<option value="0">Select Department</option>
						<%
						for (Constants.Department department : Constants.Department.values()) {
						%>
						<option value="<%=department.value()%>"><%=department.value()%></option>
						<%
						}
						%>
					</select>
				</div>

				<button type="submit" class="btn text-color custom-bg ml-2">Search</button>
			</form>

			<a href="searchAllTaskByStartDate?startDate=<%=strDate%>"
				class="ml-2"><button class="btn text-color custom-bg ml-2">Get
					Todays Task</button></a>
		</div>
		<div class="table-responsive">
			<table class="table">
				<thead class="custom-bg text-color">
					<tr>
						<th scope="col">Assigner Name</th>
						<th scope="col">Department</th>
						<th scope="col">Task Name</th>
						<th scope="col">Task Description</th>
						<th scope="col">Assignee Name</th>
						<th scope="col">Start Date</th>
						<th scope="col">End Date</th>
						<th scope="col">Assignee Status</th>
						<th scope="col">Assignee Remark</th>
						<th scope="col">Assigner Status</th>
						<th scope="col">Assigner Remark</th>
						
					</tr>
				</thead>

				<%
				if (tasks != null) {
					for (Task task : tasks) {
						Assigner a = new Assigner();
						if (task.getAssignerId() > 0) {
					a = assignerDao.findById(task.getAssignerId()).get();
						}

						Assignee ae = new Assignee();
						if (task.getAssigneeId() > 0) {
					ae = assigneeDao.findById(task.getAssigneeId()).get();
						}
				%>
				<tbody>
					<tr class="text-center">
						<td class="mid-align"><%=a.getFirstname()%></td>
						<td class="mid-align"><%=task.getDepartment()%></td>
						<td class="mid-align"><%=task.gettaskname()%></td>
						<td class="mid-align"><%=task.getDescription()%></td>
						<td class="mid-align"><%=ae.getFirstname()%></td>
						<td class="mid-align"><%=task.getStartDate()%></td>
						<td class="mid-align"><%=task.getEndDate()%></td>
						<td class="mid-align"><%=task.getAssigneeStatus()%></td>
						<td class="mid-align"><%=task.getAssigneeRemark()%></td>
						<td class="mid-align"><%=task.getAssignerStatus()%></td>
						<td class="mid-align"><%=task.getAssignerRemark()%></td>
					</tr>
				</tbody>
				<%
				}
				}
				%>
			</table>
		</div>
	</div>

</body>
</html>