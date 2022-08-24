<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage Customers</title>
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

	<h1 align="center">Manage Customers</h1>
	<br>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Sr. No.:</th>
					<th scope="col">Customer ID:</th>
					<th scope="col">Name:</th>
					<th scope="col">Contact:</th>
					<th scope="col">Address:</th>
					<th scope="col">Booked Car:</th>
					<th scope="col">Booking Period:</th>
					<th scope="col">Edit | Delete:</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${cust}" varStatus="v">
					<tr>
						<th scope="row">${v.count}</th>
						<td>${customer.id}</td>
						<td>${customer.name}</td>
						<td>${customer.contact}</td>
						<td>${customer.address}</td>
						<td>${customer.booking.car.name}</td>
						<td>${customer.booking.bookingPeriod}</td>
						<td><a href="editCustomer?id=${customer.id}">Edit</a> | <a
							href="deleteCustomer?id=${customer.id}"
							onclick="if(!(confirm('Are you sure you want to delete'))) return false">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="adminUi"><button class="btn btn-primary">Go Back</button></a>
	</div>
	<div class="container" style="height: 50px;"></div>

	<!-- Footer -->
	<c:import url="footer.jsp" />
	<!-- /Footer -->

</body>
</html>