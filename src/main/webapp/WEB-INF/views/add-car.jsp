<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Car</title>
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

	<h1 align="center">Add Car</h1>
	<div class="container">
		<form action="addCar" method="post">
			<div class="mb-3 col-sm-5">
				<label for="name" class="form-label">Car Name:</label> <input
					type="text" class="form-control" name="name" required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="category" class="form-label">Category:</label> <select
					class="form-select" name='category'>
					<option value="AC">AC</option>
					<option value="Non-AC">Non-AC</option>
				</select>
			</div>
			<div class="mb-3 col-sm-5">
				<label for="rentCharge" class="form-label">Rent Charge(per
					KM):</label> <input type="text" class="form-control" name="rentCharge"
					required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="status" class="form-label">Status:</label> <select
					class="form-select" name='status'>
					<option value="Available">Available</option>
					<option value="Booked">Booked</option>
				</select>
			</div>
			<button type="submit" class="btn btn-primary">Add Car</button>
		</form>
		<br> <a href="../customer/adminUi"><button
				class="btn btn-primary">Go Back</button></a>
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp" />
	<!-- /Footer -->

</body>
</html>