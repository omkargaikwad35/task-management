<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="./components/common_cs_js.jsp"%>
<%@ include file="./components/navbar.jsp"%>
<style>
.btn-container {
    display: flex;
    justify-content: space-around;
}
button.btn {
    font-size: 24px;
    padding: 24px 48px;
    margin: 16px;
    color:white;
}
</style>
</head>
<body>

	<div class="btn-container mt-5">
		<a href="api/excel"><button type="button"
				class="btn custom-bg mt-2">Upload File</button></a>
				
				<a href="api/excel/show"><button type="button"
				class="btn custom-bg mt-2">Show Data</button></a>
				
				<a href="assigntasktoassigner"><button type="button"
				class="btn custom-bg mt-2">Assign</button></a>
	</div>
</body>
</html>