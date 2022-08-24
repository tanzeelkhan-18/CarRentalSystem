<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Bookings Details</title>
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

	<h1 align="center">Update Booking Details</h1>
	<div class="container">
		<form action="updateBooking" method="post">
			<div class="mb-3 col-sm-5">
				<label for="bookingId" class="form-label">Booking ID:</label> <input
					type="text" class="form-control" name="id" value='${booking.id}'
					readonly="readonly">
			</div>
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
					value='${booking.car.id}' required="required">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="carId" class="form-label">Customer Id:</label> <input
					type="text" class="form-control" name="customer_id"
					value='${booking.car.id}' required="required">
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