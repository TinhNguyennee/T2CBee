<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="container-fluid position-relative p-0">



			<div class="container">
				<div class="home-title position-absolute top-50 translate-middle-y z-1">
					<h4>SẢN PHẨM MỚI</h4>
					<h1 class="fw-bold mt-4 mb-5">Forma Milkyway Ivory Chair</h1>
					<a href="" class="fw-bold text-decoration-none">MUA NGAY</a>
				</div>
			</div>
			<div id="carouselExampleIndicators" class="carousel slide">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
						class="active" aria-current="true" aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
						aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
						aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/images/home-slider1.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/images/home-slider2.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/images/home-slider3.jpg" class="d-block w-100" alt="...">
					</div>
				</div>
			</div>
		</div>



		<section class="container-fluid pb-4">
			<div class="home-banner mt-4">
				<div class="row">
					<div class="col-md-4">
						<div class="card card-product position-relative">
							<img src="/images/home-banner1-1.jpg" alt="" class="img-fluid">
							<div class="card-title card-product-title position-absolute pt-5 ps-5">
								<h5>Cyber Monday</h5>
								<h3 class="fw-bold w-50 fs-4">Khuyến mãi lớn, giảm giá 50%</h3>
								<a href="" class="text-decoration-none">Xem bộ sưu tập</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card position-relative">
							<img src="/images/home-banner1-2.jpg" alt="" class="img-fluid">
							<div class="card-title card-product-title position-absolute pt-5 ps-5">
								<h5>Sản phẩm mới</h5>
								<h3 class="fw-bold fs-4">Điểm nhấn trang trí</h3>
								<a href="" class="text-decoration-none">Xem bộ sưu tập</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card position-relative">
							<img src="/images/home-banner1-3.jpg" alt="" class="img-fluid">
							<div class="card-title card-product-title position-absolute pt-5 ps-5">
								<h5>Black Fridays</h5>
								<h3 class="fw-bold fs-4">Giảm giá lên tới 70%</h3>
								<a href="" class="text-decoration-none">Xem bộ sưu tập</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="container mt-5 border-top pb-4">
			<div class="row pt-3 pb-4">
				<div class="col-md-3">
					<div class="product-list-title text-center">
						<h4>SẢN PHẨM</h4>
						<h2 class="text-secondary fw-bold pb-1">TỐT NHẤT CỦA CHÚNG TÔI</h2>
						<div class="list-group rounded-0">
							<a href="/trang-chu"
								class="list-group-item lst list-group-item-action item-active"
								aria-current="true">Tất Cả</a>
							<c:forEach var="danhMuc" items="${listDanhMuc}">
								<a href="/trang-chu/${danhMuc.tenDanhMuc}"
									class="list-group-item lst list-group-item-action ${danhMuc.tenDanhMuc == param['danh-muc'] ? 'item-active' : ''}"
									aria-current="true">${danhMuc.tenDanhMuc}</a>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-md-9 p-0">
					<div class="product-list-items">
						<div class="row mx-auto my-auto" style="height: 580px;">
							<div id="recipeCarousel" class="carousel slide" data-bs-ride="carousel">
								<div class="carousel-inner" role="listbox">
									<c:forEach var="sanPham" items="${page.content}" varStatus="status">
										<div class="carousel-item carousel-product ${status.first ? 'active' : ''}">
											<div class="col-md-4 p-2">
												<div class="card rounded-0">
													<div class="card-image position-relative">
														<c:if test="${not empty sanPham.anhSanPhams}">
															<img src="${sanPham.anhSanPhams[0].url}" height="350"
																class="card-img-top" alt="...">
															<div
																class="add-to-cart-btn d-flex justify-content-center p-2 border position-absolute start-50 translate-middle">
																<a href=""
																	class="text-decoration-none text-dark fw-medium me-3 w-100">Add
																	to cart</a>
																<a href=""><i class="bi bi-suit-heart"></i></a>
																<a href=""><i class="bi bi-toggles"></i></a>
																<a href="/chi-tiet-san-pham/${sanPham.maSanPham}"><i
																		class="bi bi-search"></i></a>
															</div>
														</c:if>
													</div>
													<div class="card-body">
														<div class="title-head d-flex m-0">
															<p class="card-text mb-2 w-100" style="font-size: 12px;">
																<c:forEach items="${sanPham.danhMucs}" var="danhMuc"
																	varStatus="loop">
																	${danhMuc} ${!loop.last ? ', ' : ''}
																</c:forEach>
															</p>
															<div class="rating w-100 text-end text-warning">
																<i class="bi bi-star-fill"></i>
																<i class="bi bi-star-fill"></i>
																<i class="bi bi-star-fill"></i>
																<i class="bi bi-star-fill"></i>
																<i class="bi bi-star"></i>
															</div>
														</div>
														<p class="card-title mb-2 fw-bold">${sanPham.tenSanPham}</p>
														<h5 class="fw-bold product-price">${sanPham.giaBan}</h5>
													</div>

												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<a class="carousel-control-prev bg-transparent w-aut" href="#recipeCarousel"
									role="button" data-bs-slide="prev">
									<span class="carousel-control-prev-icon prev-icon" aria-hidden="true"></span>
								</a>
								<a class="carousel-control-next bg-transparent w-aut" href="#recipeCarousel"
									role="button" data-bs-slide="next">
									<span class="carousel-control-next-icon next-icon" aria-hidden="true"></span>
								</a>
							</div>
						</div>
						<!-- <div id="carouselExample" class="carousel slide">
							<div class="row carousel-inner">
								<c:forEach var="sanPham" items="${page.content}" varStatus="status">
									<div class="carousel-item carousel-product ${status.first ? 'active' : ''}">
										<div class="col-md-4 p-2">
											<div class="card rounded-0">
												<div class="card-image position-relative">
													<c:if test="${not empty sanPham.anhSanPhams}">
														<img src="${sanPham.anhSanPhams[0].url}" height="350"
															class="card-img-top" alt="...">
														<div
															class="add-to-cart-btn d-flex justify-content-center p-2 border position-absolute start-50 translate-middle">
															<a href=""
																class="text-decoration-none text-dark fw-medium me-3 w-100">Add
																to cart</a>
															<a href=""><i class="bi bi-suit-heart"></i></a>
															<a href=""><i class="bi bi-toggles"></i></a>
															<a href="/chi-tiet-san-pham/${sanPham.maSanPham}"><i
																	class="bi bi-search"></i></a>
														</div>
													</c:if>
												</div>
												<div class="card-body">
													<div class="title-head d-flex m-0">
														<p class="card-text mb-2 w-100" style="font-size: 12px;">
															<c:forEach items="${sanPham.danhMucs}" var="danhMuc"
																varStatus="loop">
																${danhMuc} ${!loop.last ? ', ' : ''}
															</c:forEach>
														</p>
														<div class="rating w-100 text-end text-warning">
															<i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i>
															<i class="bi bi-star-fill"></i>
															<i class="bi bi-star"></i>
														</div>
													</div>
													<p class="card-title mb-2 fw-bold">${sanPham.tenSanPham}</p>
													<h5 class="fw-bold product-price">${sanPham.giaBan}</h5>
												</div>

											</div>
										</div>
									</div>
								</c:forEach>

								<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
									data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
									data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div> -->
					</div>
				</div>
		</section>

		<section class="container pb-4 border-top">
			<h4 class="py-3 fw-bold">Sản Phẩm Nổi Bật</h4>
			<div class="product-list-items">
				<div class="row">
					<c:forEach var="sanPham" items="${listSanPhamNoiBat}" varStatus="status">
						<c:if test="${status.count <= 4}">


							<div class="col-md-3">
								<div class="card rounded-0">
									<div class="card-image position-relative">
										<c:if test="${not empty sanPham.anhSanPhams}">
											<img src="${sanPham.anhSanPhams[0].url}" width="200" height="350"
												class="card-img-top" alt="...">
											<div
												class="add-to-cart-btn d-flex justify-content-center p-2 border position-absolute start-50 translate-middle">
												<a href=""
													class="text-decoration-none text-dark fw-medium me-3 w-100">Add
													to cart</a>
												<a href=""><i class="bi bi-suit-heart"></i></a>
												<a href=""><i class="bi bi-toggles"></i></a>
												<a href="/chi-tiet-san-pham/${sanPham.maSanPham}"><i
														class="bi bi-search"></i></a>
											</div>
										</c:if>
									</div>
									<div class="card-body">
										<div class="title-head d-flex m-0">
											<p class="card-text mb-2 w-100">${sanPham.phanLoai}</p>
											<div class="rating w-100 text-end text-warning">
												<i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
												<i class="bi bi-star"></i>
											</div>
										</div>
										<p class="card-title mb-2 fw-bold">${sanPham.tenSanPham}</p>
										<h5 class="fw-bold product-price">${sanPham.giaBan}</h5>
									</div>

								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>

		<div class="container-fluid pb-4">
			<div class="home-banner mt-4">
				<div class="row">
					<div class="col-md-6">
						<div class="card position-relative">
							<img src="/images/home-banner2-1.jpg" alt="" class="img-fluid">
							<div class="card-title card-product-title position-absolute pt-5 ps-5">
								<h3>Cyber Monday</h3>
								<h1 class="fw-medium mb-5 w-50">Khuyến mãi lớn, giảm giá 50%</h1>
								<a href="" class="text-decoration-none">Xem bộ sưu tập</a>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card position-relative">
							<img src="/images/home-banner2-2.jpg" alt="" class="img-fluid">
							<div class="card-title card-product-title position-absolute pt-5 ps-5">
								<h3>Sản phẩm mới</h3>
								<h1 class="fw-medium mb-5">Điểm nhấn trang trí</h1>
								<a href="" class="text-decoration-none">Xem bộ sưu tập</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<section class="container pb-4 border-top">
			<h4 class="py-3 fw-bold">Mặt Hàng Mới Nhất</h4>
			<div class="product-list-items">
				<div class="row">
					<c:forEach var="sanPham" items="${listSanPhamMoi}" varStatus="status">
						<c:if test="${status.count <= 4}">


							<div class="col-md-3">
								<div class="card rounded-0">
									<div class="card-image position-relative">
										<c:if test="${not empty sanPham.anhSanPhams}">
											<img src="${sanPham.anhSanPhams[0].url}" width="200" height="350"
												class="card-img-top" alt="...">
											<div
												class="add-to-cart-btn d-flex justify-content-center p-2 border position-absolute start-50 translate-middle">
												<a href=""
													class="text-decoration-none text-dark fw-medium me-3 w-100">Add
													to cart</a>
												<a href=""><i class="bi bi-suit-heart"></i></a>
												<a href=""><i class="bi bi-toggles"></i></a>
												<a href="/chi-tiet-san-pham/${sanPham.maSanPham}"><i
														class="bi bi-search"></i></a>
											</div>
										</c:if>
									</div>
									<div class="card-body">
										<div class="title-head d-flex m-0">
											<p class="card-text mb-2 w-100">${sanPham.phanLoai}</p>
											<div class="rating w-100 text-end text-warning">
												<i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
												<i class="bi bi-star-fill"></i>
												<i class="bi bi-star"></i>
											</div>
										</div>
										<p class="card-title mb-2 fw-bold">${sanPham.tenSanPham}</p>
										<h5 class="fw-bold product-price">${sanPham.giaBan}</h5>
									</div>

								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</section>

		<section class="container my-5 pb-5 border-top border-bottom">
			<h4 class="py-3 fw-bold">Blogs Mới Nhất</h4>
			<div class="product-list-items">
				<div class="row">
					<div class="col-md-4">
						<div class="card rounded-0">
							<img src="/images/blog01.jpg" class="card-img-top" alt="...">
							<div class="card-body card-product-body p-0 pt-2">
								<p class="card-title mb-2 fw-bold fs-5">Bài đăng hình ảnh</p>
								<p class="card-text mb-4">Người đăng: <span class="text-danger">Thanh Tính</span>
									26/5/2024
								</p>
								<a href="" class="fw-bold text-decoration-none">XEM THÊM</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card rounded-0">
							<img src="/images/blog02.jpg" class="card-img-top" alt="...">
							<div class="card-body card-product-body p-0 pt-2">
								<p class="card-title mb-2 fw-bold fs-5">Bài đăng với thư viện</p>
								<p class="card-text mb-4">Người đăng: <span class="text-danger">Mỹ Linh</span> 26/5/2024
								</p>
								<a href="" class="fw-bold text-decoration-none">XEM THÊM</a>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card rounded-0">
							<img src="/images/blog03.jpg" class="card-img-top" alt="...">
							<div class="card-body card-product-body p-0 pt-2">
								<p class="card-title mb-2 fw-bold fs-5">Bài viết có âm thanh</p>
								<p class="card-text mb-4">Người đăng: <span class="text-danger">Công Huấn</span>
									26/5/2024
								</p>
								<a href="" class="fw-bold text-decoration-none">XEM THÊM</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>