<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assign Task To Assignee</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<%
	Task task = taskDao.findById(Integer.parseInt((String) request.getAttribute("taskId"))).get();

	List<Assignee> assignees = assigneeDao.findByDepartment(task.getDepartment());
	%>
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4 admin">
				<div class="card">
					<%@ include file="./components/message.jsp"%>
					<div class="card-body px-5">
						<h3 class="text-center my-3">TASK</h3>
						<form action="assignTaskToAssignee" method="post">
							<input type="hidden" name="id" value="<%=task.getId()%>">
							<input type="hidden" name="assignerId" value="<%=task.getAssignerId()%>">
							<input type="hidden" name="department" value="<%=task.getDepartment()%>">
							
							<div class="form-group">
								<label>Task Name</label> <input type="text"
									class="form-control" name="name"
									placeholder="Enter Task Name"
									required>
							</div>

							<div class="form-group">
								<label>Task Description</label>
								<textarea style="height: 150px" class="form-control"
									name="description" placeholder="Enter Task Description here"
									required></textarea>
							</div>
							
							<div class="form-group">
								<label for="email">Select Assignee</label> <select name="assigneeId"
									class="form-control">
									<option value="0">Select Assignee</option>
									<%
									for (Assignee a : assignees) {
									%>
									<option value="<%=a.getId()%>"><%=a.getFirstname() +" "+a.getLastname()%></option>
									<%
									}
									%>
								</select>
							</div>
							
							<div class="form-group">
								<input type="text" class="form-control" name="startDate" value="<%=task.getStartDate()%>" readonly required>
							</div>

							<div class="form-group">
								<input type="date" class="form-control" name="endDate"
									placeholder="Select End Date" required>
							</div>

							<div class="container text-center">
								<button class="btn custom-bg text-white">Assign Task</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>


			</div>
		</div>
	</div>
</body>
</html>