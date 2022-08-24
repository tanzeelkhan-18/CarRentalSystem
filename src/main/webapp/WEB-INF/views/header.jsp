<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- Header -->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark sticky-top">
	<div class="container-fluid">
		<c:if
			test="${(sessionScope.name!=null) and (sessionScope.adminName==null)}">
			<a class="navbar-brand" href="../customer/customerUi"><b>Car
					Rental System</b></a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					href="../customer/customerUi">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../customer/logout">Logout</a></li>
			</ul>
		</c:if>
		<c:if
			test="${(sessionScope.name==null) and (sessionScope.adminName==null)}">
			<a class="navbar-brand" href="callIndex"><b>Car Rental System</b></a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					href="callIndex">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="loginPage">Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../register-customer.jsp">Register</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../customer/adminLoginPage">Admin Login</a></li>
			</ul>
		</c:if>
		<c:if
			test="${(sessionScope.name==null) and (sessionScope.adminName!=null)}">
			<a class="navbar-brand" href="../customer/adminUi"><b>Car
					Rental System</b></a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active"
					href="../customer/adminUi">Home</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../customer/adminLogout">Logout</a></li>
			</ul>
		</c:if>
	</div>
</nav>
<!-- /Header -->