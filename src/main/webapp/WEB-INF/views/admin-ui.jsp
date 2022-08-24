<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin Dashboard</title>
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
	color: #33b5e5;
}
</style>
</head>
<body>

	<!-- Header -->
	<c:import url="header.jsp" />
	<!-- /Header -->

	<c:if test="${sessionScope.adminName==null}">
		<c:redirect url="/index.jsp" />
	</c:if>

	<c:if test="${sessionScope.adminName!=null}">
		<div class="container">
			<h4 align="right" style="padding-top: 20px; padding-right: 20px;">Welcome:
				${sessionScope.adminName}</h4>
			<br>
			<h4>What would you like to do today:</h4>
			<br>
			<div class="d-flex justify-content-center"
				style="display: flex; flex-wrap: wrap;">
				<div
					class="col-sm-3 p-4 m-3 border border-2 border-info bg-dark text-center">
					<a href="add-customer">Add Customer!!</a>
				</div>
				<div
					class="col-sm-3 p-4 m-3 border border-2 border-info bg-dark text-center">
					<a href="../cars/add-car">Add Car!!</a>
				</div>
				<div
					class="col-sm-3 p-4 m-3 border border-2 border-info bg-dark text-center">
					<a href="../booking/add-booking">Add Booking!!</a>
				</div>
				<div
					class="col-sm-3 p-4 m-3 border border-2 border-info bg-dark text-center">
					<a href="list">Manage Customers!!</a>
				</div>
				<div
					class="col-sm-3 p-4 m-3 border border-2 border-info bg-dark text-center">
					<a href="../cars/list">Manage Cars!!</a>
				</div>
				<div
					class="col-sm-3 p-4 m-3 border border-2 border-info bg-dark text-center">
					<a href="../booking/list">Manage Bookings!!</a>
				</div>
			</div>
		</div>
	</c:if>


	<!-- Footer -->
	<c:import url="footer.jsp" />
	<!-- /Footer -->

</body>
</html>