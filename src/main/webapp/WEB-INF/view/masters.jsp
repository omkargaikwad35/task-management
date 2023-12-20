<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h1 class="text-center">MASTERS</h1>



	<a href="showMasters" class="btn btn-primary">ADD NEW STATUS</a>

	<table class="table">

		<thead>

			<tr>



				  <th scope="col">Id</th>

				<th scope="col">Name</th>

				<th scope="col">Description</th>



				<th scope="col">Action</th>

			</tr>

		</thead>

		<tbody>

			<tr each="object:masters">



				  <td text="object.id"></td>

				<td text="object.name"></td>

				<td text="object.description"></td>



				<td><a href="showeditmasters/{id}(id=object.id)" class="btn btn-primary">EDIT</a> <a href="deletemasters/{id}(id=object.id)" class="btn btn-primary">DELETE</a></td>



			</tr>



		</tbody>

	</table>
</body>
</html>