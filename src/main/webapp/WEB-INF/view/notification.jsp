<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.IOException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body>
	<%@ include file="./components/navbar.jsp"%>
	<h2 align="center">Notifications</h2>
	<div class="container-fluid">
		<div class="form-group">
			<div class="row mt-4">
				<div class="col-md-4 offset-md-4 admin">

					<form method="get" action="notification">



						<label for="Task id">Task id:</label> <input type="text"
							id="task_id" name="task_id" required><br> <label
							for="Notification">Notification:</label>
						<textarea style="height: 150px" class="form-control"
							id="notification" name="notification"
							placeholder="Enter Notification Description here" required></textarea>
						<br> <input type="submit" value="Submit">

						<% 
        

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
        	int task_id = Integer.parseInt(request.getParameter("task_id"));
			String notification = request.getParameter("notification");
            // Replace "your_db_name", "your_db_user", and "your_db_password" with your MySQL database credentials
            String url = "jdbc:mysql://localhost:3306/task_management_demo";
            String user = "root";
            String password = "Root@1234";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String sql = "INSERT INTO notification(task_id,notification) VALUES (?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, task_id);
            pstmt.setString(2, notification);
            pstmt.executeUpdate();

            out.println("<h2>Data successfully saved in the database!</h2>");

        } catch (Exception e) {
            e.printStackTrace();
          //  out.println("<h2>Failed to save data.</h2>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
<br><br>

						<table class="table">
				<thead class="custom-bg text-color">
							<tr>
								<td>Task ID</td>
								<td>Notification</td>
								<td>Action</td>
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
							
								<td>
									<input type="button" value="Delete">
								</td>
							</tr>
							<%

}
%>
						</table>
						<%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }


							%>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>