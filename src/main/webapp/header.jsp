<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TCA,Pune</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">


</head>
<body>
<!-- Navbar Starts -->
	<nav class="navbar navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Firstbit Sulotions</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar"
				aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1"
				id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">FBS,Pune</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						
						<li class="nav-item">
						   <!-- <a class="nav-link active" aria-current="page" href="index.jsp">Home</a> -->
						   	 <a class="nav-link active" aria-current="page" href="./">Home</a>
						   
						</li>
						
						<li class="nav-item">
						   <a class="nav-link active"
							aria-current="page" href="AboutUs.jsp">About Us</a>
						</li>
						
						<li class="nav-item">
						   <a class="nav-link active"
							aria-current="page" href="https://firstbitsolutions.com/">Schedules</a>
						</li>
						
				  <!-- Student dropdown -->	
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle " href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Student
							</a>
							  <ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="./AddStudents">Add Student</a></li>
								<li><a class="dropdown-item" href="./DisplayStudent">Display Student</a></li>
								<li><a class="dropdown-item" href="./UpdateStudent">Update Student</a></li>
								<li><a class="dropdown-item" href="./DeleteStudent">Delete Student</a></li>
							</ul>
						</li>
						
					<!-- Teacher DropDown Starts here -->
			<%--  		<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-danger" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Teacher 
							</a>
							  <ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="#">Add Teacher</a></li>
								<li><a class="dropdown-item" href="#">Display Teacher</a></li>
								<li><a class="dropdown-item" href="#">Update Teacher</a></li>
								<li><a class="dropdown-item" href="#">Delete Teacher</a></li>
							</ul>
						</li>	--%>
					</ul>
					
					<form class="d-flex mt-3" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" />
						<button class="btn btn-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</div>
	</nav>
<!-- Navbar Ends -->

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>