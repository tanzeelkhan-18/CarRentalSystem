<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Book Now</title>
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
}
</style>
</head>
<body>

	<!-- Header -->
	<c:import url="header.jsp" />
	<!-- /Header -->
	<br>
	<h1 align="center">Book Now!!</h1>
	<div class="container">
		<form action="custBooking" method="post">
			<div class="mb-3 col-sm-5">
				<label for="userName" class="form-label">Booking Period:</label> <select
					class="form-select" name='bookingPeriod'>
					<option value="None" selected>None</option>
					<option value="Daily">For A Day</option>
					<option value="Weekly">For A Week</option>
					<option value="Monthly">For A Month</option>
				</select>
			</div>
			<div class="mb-3 col-sm-5">
				<label for="carId" class="form-label">Car ID:</label> <input
					type="text" class="form-control" name="car_id"
					value="${param.carId}" readonly="readonly">
			</div>
			<div class="mb-3 col-sm-5">
				<label for="customerId" class="form-label">Customer ID:</label> <input
					type="text" class="form-control" name="customer_id"
					value="${param.customerId}" readonly="readonly">
			</div>
			<button type="submit" class="btn btn-primary">Book Now!!</button>
		</form>
	</div>

	<!-- Footer -->
	<c:import url="footer.jsp" />
	<!-- /Footer -->

</body>
</html>