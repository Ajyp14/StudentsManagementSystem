<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>

</head>
<body>

<div class="container" style="margin-top: 100px; width: 400px">
	<h2 class="text-center mb-3">Registration Form</h2>
	
<form method="post" action="./AddStudents">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Roll Number</label>
    <input type="number" name="rno" class="form-control" id="rno" aria-describedby="emailHelp"  required>
    <div id="emailHelp" class="form-text" >It should be Numeric</div>
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" id="name" aria-describedby="emailHelp"  required>
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Percentage</label>
    <input type="number" name="per" class="form-control" id="per" aria-describedby="emailHelp"  required> 
  </div>
 
  <div class="d-grid gap-2">
  <button type="submit" class="btn btn-primary" value="save">Save</button>
  </div>
</form>	
	

</div>
	<%-- <%
			String msg = (String)request.getAttribute("msg");
		%>
	--%>
	<%--		<p style="color:blue;" ><%= msg %></p>  --%>


  <p>${msg}</p>


	

	
</body>
</html>
