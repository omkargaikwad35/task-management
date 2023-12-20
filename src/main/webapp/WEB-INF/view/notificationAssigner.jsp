<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
<%@ include file="./components/navbar.jsp"%>
<div class="container-fluid">
		<div class="form-group">
			<div class="row mt-4">
				<div class="col-md-4 offset-md-4 admin">

					<form method="get" action="notificationAssigner">
					<table class="table">
				<thead class="custom-bg text-color">
							<tr>
								<td>Task ID</td>
								<td>Notification</td>
								
							</tr>
							</thead>
							<%
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost/task_management_demo";
String username="root";
String password="Root@1234";
String query="select * from notification";
Connection con=DriverManager.getConnection(url,username,password);
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
							<tr>
								<td>
									<%=rs.getInt("task_id") %>
								</td>
							
								<td>
									<%=rs.getString("notification") %>
								</td>
							
								
							</tr>
							<%

}
%>
						</table>
						<%
    rs.close();
    stmt.close();
    con.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }


							%>
					</form>

				</div>
			</div>
					
</body>
</html>