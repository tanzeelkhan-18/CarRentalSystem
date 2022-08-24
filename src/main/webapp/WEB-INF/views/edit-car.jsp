<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Car Details</title>
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

	<h1 align="center">Update Car Details</h1>
	<div class="container">
		<form action="updateCar" method="post">
			<div class="mb-3 col-sm-5">
				<label for="carId" class="form-label">ID:</label> <input type="text"
					class="form-control" name="id" value='${car.id}'
					readonly="readonly">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="name" class="form-label">Name:</label> <input
					type="text" class="form-control" name="name" value='${car.name}'
					required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="category" class="form-label">Category:</label> <input
					type="text" class="form-control" name="category"
					value='${car.category}' required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="rentCharge" class="form-label">RentCharge:</label> <input
					type="text" class="form-control" name="rentCharge"
					value='${car.rentCharge}' required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="status" class="form-label">Status:</label> <input
					type="text" class="form-control" name="status"
					value='${car.status}' placeholder="Available/Booked"
					required="required">
			</div>
			<button type="submit" class="btn btn-primary">Update</button>
		</form>
		<br> <a href="list"><button class="btn btn-primary">Go
				Back</button></a>
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp" />
	<!-- /Footer -->

</body>
</html>