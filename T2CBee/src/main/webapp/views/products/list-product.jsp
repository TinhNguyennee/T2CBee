
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>T2CBee</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="../css/productdetail.css">
<link rel="stylesheet" href="../css/styles.css">
<link rel="stylesheet" href="../css/listproduct.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&family=Quicksand:wght@300..700&display=swap"
	rel="stylesheet">
</head>

<body>
	<div class="container-fluid position-relative p-0">








		<jsp:include page="../component/header.jsp"></jsp:include>







	</div>





	<!-- End Header -->

	<!-- Content -->


	<div class="wrapper-product-detail position-relative"
		style="padding-top: 195px">



		<jsp:include page="../component/banner.jsp"></jsp:include>



		<section
			class="container product-categories p-5 bg-white position-relative"
			style="top: -50px;">
			<div
				class="categories-sort border-top border-bottom py-2 d-flex justify-content-between align-items-center">
				<div class="categories-icon d-flex align-items-center">
					<i class="bi bi-grid-3x3-gap me-3"></i> <i class="bi bi-list-task"></i>
					<div class="categories-title ms-5">Showing 1–9 of 28 results
					</div>
				</div>

				<div class="categories-sort d-flex align-items-center">
					<p class="fw-medium w-100 mb-0">Sort By :</p>
					<div class="dropdown">
						<button
							class="btn btn-secondary dropdown-toggle rounded-0 bg-transparent text-dark border-0"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							DEFAULT SORTING</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul>
					</div>
				</div>

			</div>
			<div class="list-product pt-4">
				<div class="row">
					<div class="col-md-3">
						<div class="list border-bottom pb-5">
							<h4>PRODUCT CATEGORIES</h4>
							<a href="" class="list-group pb-2 pt-3">+ Accessories (14)</a> <a
								href="" class="list-group pb-2">+ Accessories (14)</a> <a
								href="" class="list-group pb-2">+ Accessories (14)</a> <a
								href="" class="list-group pb-2">+ Accessories (14)</a> <a
								href="" class="list-group pb-2">+ Accessories (14)</a> <a
								href="" class="list-group pb-2">+ Accessories (14)</a> <a
								href="" class="list-group pb-2">+ Accessories (14)</a>
						</div>
						<div class="filter border-bottom pb-5">
							<h4 class="pt-5">FILTER BY PRICE</h4>
							<div class="range_container">
								<div class="sliders_control">
									<input id="fromSlider" type="range" value="10" min="0"
										max="100" /> <input id="toSlider" type="range" value="40"
										min="0" max="100" />
								</div>
								<button class="p-2 my-4">FILTER</button>
								<div class="form_control">
									<div class="form_control_container">
										<div class="form_control_container__time">Min</div>
										<input class="form_control_container__time__input"
											type="number" id="fromInput" value="10" min="0" max="100" />
									</div>
									<h5>Price</h5>
									<div class="form_control_container">
										<div class="form_control_container__time">Max</div>
										<input class="form_control_container__time__input"
											type="number" id="toInput" value="40" min="0" max="100" />
									</div>
								</div>
							</div>
						</div>
						<div class="compare pb-5 border-bottom">
							<h4 class="pt-5">COMPARE PRODUCTS</h4>
							<p>No products to compare</p>
							<div class="d-flex justify-content-between align-items-center">
								<a href="">Clear All</a>
								<button class="p-2 my-4">COMPARE</button>
							</div>
						</div>
						<div class="compare pb-5 border-bottom">
							<h4 class="pt-5">PRODUCT TAGS</h4>
							<button class="p-2 my-2">COMPARE</button>
							<button class="p-2 my-2">COMPARE</button>
							<button class="p-2 my-2">COMPARE</button>
							<button class="p-2 my-2">COMPARE</button>
						</div>
					</div>
					<div class="col-md-9">
						<div class="product-list-items">
							<div class="row">

								<!-- product -->
								<jsp:include page="../component/cp-product.jsp"></jsp:include>
								<!-- product -->


								<div class="col-md-4">
									<div class="card rounded-0">
										<img src="../images/product06.jpg" class="card-img-top"
											alt="...">
										<div class="card-body">
											<div class="title-head d-flex m-0">
												<p class="card-text mb-2">Accessories, Lighting, Outdor</p>
												<div class="rating w-100 text-end text-warning">
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
												</div>
											</div>
											<p class="card-title mb-2 fw-bold">Eodem modo vel mattis
												ante facilisis nec porttitor efficitur</p>
											<h5 class="fw-bold product-price">$86.00</h5>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card rounded-0">
										<img src="../images/product11.jpg" class="card-img-top"
											alt="...">
										<div class="card-body">
											<div class="title-head d-flex m-0">
												<p class="card-text mb-2">Dercor, Furniture</p>
												<div class="rating w-100 text-end text-warning">
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
												</div>
											</div>
											<p class="card-title mb-2 fw-bold">Laudantium enim
												fringilla dignissim ipsum primis</p>
											<h5 class="fw-bold product-price">$86.00</h5>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card rounded-0">
										<img src="../images/product11.jpg" class="card-img-top"
											alt="...">
										<div class="card-body">
											<div class="title-head d-flex m-0">
												<p class="card-text mb-2">Dercor, Furniture</p>
												<div class="rating w-100 text-end text-warning">
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
												</div>
											</div>
											<p class="card-title mb-2 fw-bold">Laudantium enim
												fringilla dignissim ipsum primis</p>
											<h5 class="fw-bold product-price">$86.00</h5>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card rounded-0">
										<img src="../images/product11.jpg" class="card-img-top"
											alt="...">
										<div class="card-body">
											<div class="title-head d-flex m-0">
												<p class="card-text mb-2">Dercor, Furniture</p>
												<div class="rating w-100 text-end text-warning">
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
												</div>
											</div>
											<p class="card-title mb-2 fw-bold">Laudantium enim
												fringilla dignissim ipsum primis</p>
											<h5 class="fw-bold product-price">$86.00</h5>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card rounded-0">
										<img src="../images/product11.jpg" class="card-img-top"
											alt="...">
										<div class="card-body">
											<div class="title-head d-flex m-0">
												<p class="card-text mb-2">Dercor, Furniture</p>
												<div class="rating w-100 text-end text-warning">
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
												</div>
											</div>
											<p class="card-title mb-2 fw-bold">Laudantium enim
												fringilla dignissim ipsum primis</p>
											<h5 class="fw-bold product-price">$86.00</h5>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card rounded-0">
										<img src="../images/product11.jpg" class="card-img-top"
											alt="...">
										<div class="card-body">
											<div class="title-head d-flex m-0">
												<p class="card-text mb-2">Dercor, Furniture</p>
												<div class="rating w-100 text-end text-warning">
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
												</div>
											</div>
											<p class="card-title mb-2 fw-bold">Laudantium enim
												fringilla dignissim ipsum primis</p>
											<h5 class="fw-bold product-price">$86.00</h5>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card rounded-0">
										<img src="../images/product11.jpg" class="card-img-top"
											alt="...">
										<div class="card-body">
											<div class="title-head d-flex m-0">
												<p class="card-text mb-2">Dercor, Furniture</p>
												<div class="rating w-100 text-end text-warning">
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
												</div>
											</div>
											<p class="card-title mb-2 fw-bold">Laudantium enim
												fringilla dignissim ipsum primis</p>
											<h5 class="fw-bold product-price">$86.00</h5>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card rounded-0">
										<img src="../images/product11.jpg" class="card-img-top"
											alt="...">
										<div class="card-body">
											<div class="title-head d-flex m-0">
												<p class="card-text mb-2">Dercor, Furniture</p>
												<div class="rating w-100 text-end text-warning">
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i> <i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
												</div>
											</div>
											<p class="card-title mb-2 fw-bold">Laudantium enim
												fringilla dignissim ipsum primis</p>
											<h5 class="fw-bold product-price">$86.00</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div
							class="container d-flex justify-content-center align-items-center border-bottom border-top pt-3 mt-5">
							<nav
								aria-label="Page navigation example d-flex justify-content-center align-items-center">
								<ul
									class="pagination d-flex pagination-custom justify-content-center align-items-center">
									<li class="page-item"><a
										class="page-link border-0 pagination-active" href="#">1</a></li>
									<li class="page-item"><a class="page-link border-0"
										href="#">2</a></li>
									<li class="page-item"><a class="page-link border-0"
										href="#">3</a></li>
									<li class="page-item"><a class="page-link border-0"
										href="#">Next</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- Content -->


	<!-- Footer -->


	<jsp:include page="../component/footer.jsp"></jsp:include>


	<!-- Footer -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="../js/filter-list.js"></script>
</body>

</html>