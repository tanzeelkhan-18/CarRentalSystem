<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Customer Details</title>
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

	<h1 align="center">Update Customer Details</h1>
	<div class="container">
		<form action="updateCustomer" method="post">
			<div class="mb-3 col-sm-5">
				<label for="customerId" class="form-label">Customer ID:</label> <input
					type="text" class="form-control" name="id" value='${cust.id}'
					readonly="readonly">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="name" class="form-label">Name:</label> <input
					type="text" class="form-control" name="name" value='${cust.name}'
					required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="contact" class="form-label">Contact:</label> <input
					type="text" class="form-control" name="contact"
					value='${cust.contact}' required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="address" class="form-label">Address:</label> <input
					type="text" class="form-control" name="address"
					value='${cust.address}' required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="username" class="form-label">UserName:</label> <input
					type="text" class="form-control" name="username"
					value='${cust.username}' required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="password" class="form-label">Password:</label> <input
					type="password" class="form-control" name="password"
					value='${cust.password}' required="required">
			</div>
			<button type="submit" class="btn btn-primary">Update</button>
		</form>
		<br> <a href="list"><button class="btn btn-primary">Go
				Back</button></a><br>
	</div>
	<div class="container" style="height: 50px;"></div>

	<!-- Footer -->
	<c:import url="footer.jsp" />
	<!-- /Footer -->

</body>
</html>