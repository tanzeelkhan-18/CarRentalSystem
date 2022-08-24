<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Manual Booking</title>
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

	<h1 align="center">Book Now</h1>
	<div class="container">
		<form action="addBooking" method="post">
			<div class="mb-3 col-sm-5">
				<label for="bookingPeriod" class="form-label">Booking
					Period:</label> <select class="form-select" name='bookingPeriod'>
					<option value="None">None</option>
					<option value="Daily">Daily</option>
					<option value="Weekly">Weekly</option>
					<option value="Monthly">Monthly</option>
				</select>
			</div>
			<div class="mb-3 col-sm-5">
				<label for="carId" class="form-label">Car Id:</label> <input
					type="text" class="form-control" name="car_id"
					placeholder="Check Cars table for reference">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="customerId" class="form-label">Customer Id:</label> <input
					type="text" class="form-control" name="customer_id"
					placeholder="Check Customer table for reference">
			</div>
			<button type="submit" class="btn btn-primary">Add Booking</button>
		</form>
		<br> <a href="../customer/adminUi"><button
				class="btn btn-primary">Go Back</button></a>
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp" />
	<!-- /Footer -->

</body>
</html>