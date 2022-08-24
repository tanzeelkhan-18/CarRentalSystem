<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Customer</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
a {
	text-decoration: none;
	color: green;
}
</style>
</head>
<body>

	<!-- Header -->
	<c:import url="header.jsp" />
	<!-- /Header -->
	<br>

	<h1 align="center">Add Customer</h1>
	<div class="container">
		<form action="addCustomer" method="post">
			<div class="mb-3 col-sm-5">
				<label for="name" class="form-label">Name </label> <input
					type="text" class="form-control" name="name" required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="contact" class="form-label">Contact: </label> <input
					type="text" class="form-control" name="contact" required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="address" class="form-label">Address: </label> <input
					type="text" class="form-control" name="address" required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="username" class="form-label">UserName: </label> <input
					type="text" class="form-control" name="username"
					required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="password" class="form-label">Password:</label> <input
					type="password" class="form-control" name="password"
					required="required">
			</div>
			<button type="submit" class="btn btn-primary">Register</button>
		</form>
		<br> <a href="adminUi"><button class="btn btn-primary">Go
				Back</button></a>
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp" />
	<!-- /Footer -->

</body>
</html>