<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Customer Dashboard</title>
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
	color: aliceblue;
}
</style>
</head>
<body>

	<!-- Header -->
	<c:import url="header.jsp" />
	<!-- /Header -->

	<c:if test="${sessionScope.name==null}">
		<c:redirect url="/index.jsp" />
	</c:if>

	<c:if test="${sessionScope.name!=null}">
		<h4 align="right" style="padding-top: 20px; padding-right: 20px;">Welcome:
			${sessionScope.name}</h4>
	</c:if>

	<c:if test="${sessionScope.bookedCar!=null}">
		<h4 align="right" style="padding-top: 20px; padding-right: 20px;">Your
			Booked Vehicle: ${sessionScope.bookedCar}</h4>
	</c:if>

	<c:if test="${sessionScope.name!=null}">
		<!-- Body -->
		<div class="container mt-5">
			<div class="row">
				<!-- Sidebar -->
				<div
					class="col-sm-2 p-3 border border-2 broder-info bg-dark text-white">
					<h4>Category wise</h4>
					<h5 class="mt-4">Type</h5>
					<ul class="flex-column">
						<li><a href="#">AC</a></li>
						<li><a href="#">Non-AC</a></li>
					</ul>
					<hr class="d-sm-none">
				</div>
				<!-- /Sidebar -->

				<!-- MainBody -->
				<div class="col-sm-10">
					<div style="display: flex; flex-wrap: wrap;">
						<c:forEach var="car" items="${sessionScope.car}" varStatus="v">
							<div
								class="col-sm-3 p-2 m-1 border border-2 border-success bg-success">
								<h3>${car.name}</h3>
								<h6>Rate: Rs. ${car.rentCharge}/KM</h6>
								<c:if test="${sessionScope.bookedCar==null}">
									<a
										href="../booking/cust-booking?carId=${car.id}&&customerId=${sessionScope.id}">Book
										Now</a>
								</c:if>
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- /MainBody -->
			</div>
		</div>
		<!-- /Body -->
	</c:if>

	<c:if test="${sessionScope.bookedCar!=null}">
		<div align="right">
			<h6 align="right" style="padding-top: 20px; padding-right: 20px;">
				If you want to book another vehicle, Click to cancel first booking.
			</h6>
			<a style="padding-top: 20px; padding-right: 20px; color: red;"
				href="../booking/deleteBookingbyCst?cust_id=${sessionScope.id}&&car_id=${sessionScope.car_id}"
				onclick="if(!(confirm('Are you sure you want to delete'))) return false">Cancel
				Booking</a>
		</div>
	</c:if>

	<!-- Footer -->
	<c:import url="footer.jsp" />
	<!-- /Footer -->

</body>
</html>