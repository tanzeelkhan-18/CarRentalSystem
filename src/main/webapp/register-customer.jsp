<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Registration!!</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
a{
	text-decoration: none;
	color: aliceblue;
}
</style>
</head>
<body>

	<!-- Header -->
	<c:import url="header.jsp"/>
	<!-- /Header -->
	<br>
	<div class="container">
	<h1 align="center">Customer Registration</h1>
	<form action="customer/register" method="post">
		<div class="mb-3 col-sm-5">
			<label for="name" class="form-label">Name:</label> 
			<input type="text" class="form-control" name="name">
		</div>
		<div class="mb-3 col-sm-5">
			<label for="contact" class="form-label">Contact:</label> 
			<input type="text" class="form-control" name="contact">
		</div>
		<div class="mb-3 col-sm-5">
			<label for="address" class="form-label">Address:</label> 
			<input type="text" class="form-control" name="address">
		</div>
		<div class="mb-3 col-sm-5">
			<label for="userName" class="form-label">User Name:</label> 
			<input type="text" class="form-control" name="username">
		</div>
		<div class="mb-3 col-sm-5">
			<label for="password" class="form-label">Password:</label> 
			<input type="password" class="form-control" name="password">
		</div>
		
		<button type="submit" class="btn btn-primary">Register</button>
		<button type="reset" class="btn btn-primary">Clear</button>
	</form>
	</div>
	
	<!-- Footer -->
	<c:import url="footer.jsp"/>
	<!-- /Footer -->
</body>
</html>