<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!doctype html>
	<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>T2CBee</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
		<link rel="stylesheet" href="/css/styles.css">
		<link rel="stylesheet" href="/css/profile-css.css">
		<link rel="stylesheet" href="/css/cart.css">
		<link rel="stylesheet" href="/css/checkout.css">
		<link rel="stylesheet" href="/css/about-us.css">
		<link rel="stylesheet" href="/css/listproduct.css">
		<!-- <link rel="stylesheet" href="/css/login.css"> -->
		<link rel="stylesheet" href="/css/register.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link
			href="https://fonts.googleapis.com/css2?family=Oswald:wght@200..700&family=Quicksand:wght@300..700&family=Source+Sans+3:ital,wght@0,200..900;1,200..900&display=swap"
			rel="stylesheet">
	</head>

	<body>
		<!-- Header -->
		<jsp:include page="./component/header.jsp"></jsp:include>
		<!-- Header -->



		<!-- Content -->

		<jsp:include page="./${path}.jsp"></jsp:include>
		<!-- Content -->




		<!-- Footer -->
		<jsp:include page="./component/footer.jsp"></jsp:include>
		<!-- Footer -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>

	</body>

	</html>