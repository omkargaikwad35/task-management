<%@page import="com.taskmanagement.services.ExcelService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.taskmanagement.model.*"%>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Excel Data</title>
<%@ include file="./components/common_cs_js.jsp"%>

<style>
.btn-container {
	display: flex;
	justify-content: space-around;
}

button.btn {
	font-size: 24px;
	padding: 24px 48px;
	margin: 16px;
	color: white;
}

table.table{
border-color: black;


}

button.backbutton{
color:blue;
}

.navbar1 {
       background : #ef9a9a;
       }
</style>

</head>
<body>
<div class="navbar1">
	<%@ include file="./components/navbar.jsp"%>
</div>	

	<%
	ExcelService excelService = context.getBean(ExcelService.class);
	FileRepository fileRepository = context.getBean(FileRepository.class);
	
	List<Assignee> assignees = null;
	assignees = (List<Assignee>) request.getAttribute("assignee");
	%>
<!-- 	
	<div>
		<a href="assignmentPage1"><button type="button"
				class="backbutton">Go Back</button></a>
		</div>	
	 -->
	<div class="btn-container mt-5">
		<div class="container-fluid">
			<form action="/show" method="post">
				<div class="table-responsive">
					<table class="table">
						<thead class="custom-bg text-color">
							<tr class="text-center">
								<th scope="col">Department</th>
								<th scope="col">First Name</th>
								<th scope="col">Last Name</th>
								<th scope="col">Email</th>
								<th scope="col">Password</th>
								<th scope="col">Mobile No</th>     

							</tr>
						</thead>

						<%
						if (assignees != null) {
							for (Assignee s : assignees) {

								if (s.getId() > 0) {
							s = assigneeDao.findById(s.getId()).get();
								}
						%>
						<tbody>
							<tr class="text-center">
								<td class="mid-align"><%=s.getDepartment()%></td>
								<td class="mid-align"><%=s.getFirstname()%></td>
								<td class="mid-align"><%=s.getLastname()%></td>
								<td class="mid-align"><%=s.getEmailid()%></td>
								<td class="mid-align"><%=s.getPassword()%></td>
								<td class="mid-align"><%=s.getMobileno()%></td>      
							</tr>
						</tbody>
						<%
						}
						}
						%>
					</table>
				</div>
			</form>

			<a href="api/excel/download"><button type="button"
					class="btn custom-bg mt-2">Download</button></a>
		</div>
	</div>
</body>
</html>