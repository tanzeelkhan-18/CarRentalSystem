<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage Cars</title>
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

	<h1 align="center">Manage Cars</h1>
	<br>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Sr. No.:</th>
					<th scope="col">Customer ID:</th>
					<th scope="col">Name:</th>
					<th scope="col">Category:</th>
					<th scope="col">RentCharges:</th>
					<th scope="col">Status:</th>
					<th scope="col">Edit | Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="car" items="${car}" varStatus="v">
					<tr>
						<th scope="row">${v.count}</th>
						<td>${car.id}</td>
						<td>${car.name}</td>
						<td>${car.category}</td>
						<td>${car.rentCharge}</td>
						<td>${car.status}</td>
						<td><a href="editCar?id=${car.id}">Edit</a> | <a
							href="deleteCar?id=${car.id}"
							onclick="if(!(confirm('Are you sure you want to delete'))) return false">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="../customer/adminUi"><button class="btn btn-primary">Go
				Back</button></a>
	</div>
	<div class="container" style="height: 50px;"></div>

	<!-- Footer -->
	<c:import url="footer.jsp" />
	<!-- /Footer -->

</body>
</html>