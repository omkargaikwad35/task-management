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
<h1 class="text-center">EDIT MASTERS</h1>



<form  action="saveMasters" object="masters"  method="post" >

<!--  <input type="hidden" th:field="*{id}" placeholder="type id here"  />-->

 

  <input  style="width:50%" class="form-control" type="text" field="name" placeholder="type name here"  /> <br>

  

    <input style="width: 1200px; height: 200px;" class="form-control" type="text" field="description" placeholder="type desc here" /> <br>

  

    <button style="width:200px;" class="btn btn-primary">UPDATE</button>

</form>
</body>
</html>