<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!-- Content -->


	<div class="wrapper-product-detail position-relative" style="padding-top: 195px">



		<jsp:include page="../component/banner.jsp"></jsp:include>



		<section class="container product-categories p-5 bg-white position-relative" style="top: -50px;">
			<div
				class="categories-sort border-top border-bottom py-2 d-flex justify-content-between align-items-center">
				<div class="categories-icon d-flex align-items-center">
					<i class="bi bi-grid-3x3-gap me-3"></i> <i class="bi bi-list-task"></i>
					<div class="categories-title ms-5">Hiển thị 1 - 9 trên 28 kết quả
					</div>
				</div>

				<div class="categories-sort d-flex align-items-center">
					<p class="fw-medium w-100 mb-0">Sắp xếp theo :</p>
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle rounded-0 bg-transparent text-dark border-0"
							type="button" data-bs-toggle="dropdown" aria-expanded="false">
							MẶC ĐỊNH PHÂN LOẠI</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Mặc định</a></li>
							<li><a class="dropdown-item" href="#">A - Z</a></li>
							<li><a class="dropdown-item" href="#">Z - A</a></li>
							<li><a class="dropdown-item" href="#">Giá tăng dần</a></li>
							<li><a class="dropdown-item" href="#">Giá giảm dần</a></li>
							<li><a class="dropdown-item" href="#">Hàng mới nhất</a></li>
							<li><a class="dropdown-item" href="#">Hàng cũ nhất</a></li>
						</ul>
					</div>
				</div>

			</div>
			<div class="list-product pt-4">
				<div class="row">
					<div class="col-md-3">
						<div class="list border-bottom pb-5">
							<h4>DANH MỤC SẢN PHẨM</h4>
							<a href="" class="list-group pb-2 pt-3">+ Phụ kiện (14)</a>
							<a href="" class="list-group pb-2">+ Trang trí (14)</a>
							<a href="" class="list-group pb-2">+ Nội thất (28)</a>
							<a href="" class="list-group pb-2">+ Chiếu sáng (14)</a>
							<a href="" class="list-group pb-2">+ Ngoài trời (14)</a>
							<a href="" class="list-group pb-2">+ Thể thao (13)</a>
						</div>
						<div class="filter border-bottom pb-5">
							<h4 class="pt-5">LỌC THEO GIÁ</h4>
							<div class="range_container">
								<div class="sliders_control">
									<input id="fromSlider" type="range" value="10" min="0" max="100" /> <input
										id="toSlider" type="range" value="40" min="0" max="100" />
								</div>
								<button class="p-2 my-4">LỌC</button>
								<div class="form_control">
									<div class="form_control_container">
										<div class="form_control_container__time">Thấp nhất</div>
										<input class="form_control_container__time__input" type="number" id="fromInput"
											value="10" min="0" max="100" />
									</div>
									<h5>Giá</h5>
									<div class="form_control_container">
										<div class="form_control_container__time">Cao nhất</div>
										<input class="form_control_container__time__input" type="number" id="toInput"
											value="40" min="0" max="100" />
									</div>
								</div>
							</div>
						</div>
						<div class="compare pb-5 border-bottom">
							<h4 class="pt-5">SO SÁNH SẢN PHẨM</h4>
							<p>Không có sản phẩm để so sánh</p>
							<div class="d-flex justify-content-between align-items-center">
								<a href="">Làm sạch tất cả</a>
								<button class="p-2 my-4">SO SÁNH</button>
							</div>
						</div>
						<div class="compare pb-5 border-bottom">
							<h4 class="pt-5">THẺ SẢN PHẨM</h4>
							<button class="p-2 my-2">Thời Trang</button>
							<button class="p-2 my-2">Túi Xách</button>
							<button class="p-2 my-2">Laptop</button>
							<button class="p-2 my-2">Quần Áo</button>
						</div>
					</div>
					<div class="col-md-9">
						<div class="product-list-items">
							<div class="row">

								<!-- product -->
								<jsp:include page="../component/cp-product.jsp"></jsp:include>
								<!-- product -->

								<!-- product -->
								<jsp:include page="../component/cp-product.jsp"></jsp:include>
								<!-- product -->

								<!-- product -->
								<jsp:include page="../component/cp-product.jsp"></jsp:include>
								<!-- product -->

								<!-- product -->
								<jsp:include page="../component/cp-product.jsp"></jsp:include>
								<!-- product -->

								<!-- product -->
								<jsp:include page="../component/cp-product.jsp"></jsp:include>
								<!-- product -->

								<!-- product -->
								<jsp:include page="../component/cp-product.jsp"></jsp:include>
								<!-- product -->


								
							</div>
						</div>
						<div
							class="container d-flex justify-content-center align-items-center border-bottom border-top pt-3 mt-5">
							<nav aria-label="Page navigation example d-flex justify-content-center align-items-center">
								<ul
									class="pagination d-flex pagination-custom justify-content-center align-items-center">
									<li class="page-item"><a class="page-link border-0 pagination-active" href="#">1</a>
									</li>
									<li class="page-item"><a class="page-link border-0" href="#">2</a></li>
									<li class="page-item"><a class="page-link border-0" href="#">3</a></li>
									<li class="page-item"><a class="page-link border-0" href="#">Tiếp theo</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>
	<script src="../js/filter-list.js"></script>

	<!-- Content -->