<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<!-- Content -->

			<div class="wrapper-product-detail position-relative" style="padding-top: 195px">

				<jsp:include page="../component/banner.jsp"></jsp:include>



				<section class="container product-categories p-5 bg-white position-relative" style="top: -50px;">
					<div
						class="categories-sort border-top border-bottom py-2 d-flex justify-content-between align-items-center">
						<div class="categories-icon d-flex align-items-center">
							<i class="bi bi-grid-3x3-gap me-3"></i> <i class="bi bi-list-task"></i>
							<div class="categories-title ms-5">Hiển thị 1
								- 9 trên ${page.totalElements} kết quả </div>
						</div>

						<div class="categories-sort d-flex align-items-center">
							<p class="fw-medium w-100 mb-0">Sắp xếp theo :</p>
							<div class="dropdown">
								<button
									class="btn btn-secondary dropdown-toggle rounded-0 bg-transparent text-dark border-0"
									type="button" data-bs-toggle="dropdown" aria-expanded="false">
									MẶC ĐỊNH PHÂN LOẠI</button>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<li><a class="dropdown-item" href="/danh-sach-san-pham/${danhMuc}?sort=default">Mặc
											định</a></li>
									<li><a class="dropdown-item" href="/danh-sach-san-pham/${danhMuc}?sort=az">A - Z</a>
									</li>
									<li><a class="dropdown-item" href="/danh-sach-san-pham/${danhMuc}?sort=za">Z - A</a>
									</li>
									<li><a class="dropdown-item" href="/danh-sach-san-pham/${danhMuc}?sort=priceAsc">Giá
											tăng dần</a></li>
									<li><a class="dropdown-item"
											href="/danh-sach-san-pham/${danhMuc}?sort=priceDesc">Giá
											giảm dần</a></li>
									<li><a class="dropdown-item" href="/danh-sach-san-pham/${danhMuc}?sort=newest">Hàng
											mới
											nhất</a></li>
									<li><a class="dropdown-item" href="/danh-sach-san-pham/${danhMuc}?sort=oldest">Hàng
											cũ
											nhất</a></li>
								</ul>
							</div>
						</div>

					</div>
					<div class="list-product pt-4">
						<div class="row">
							<div class="col-md-3">
								<div class="list border-bottom pb-5">
									<h4>DANH MỤC SẢN PHẨM</h4>
									<a href="/danh-sach-san-pham/Tất Cả" class="list-group pb-2 pt-3">+ Tất Cả
										(${allCounts})</a>
									<c:forEach var="danhMuc" items="${listDanhMuc}">
										<a href="/danh-sach-san-pham/${danhMuc.tenDanhMuc}"
											class="list-group pb-2 pt-3">+ ${danhMuc.tenDanhMuc}
											(${danhMucCounts[danhMuc.tenDanhMuc]})</a>
									</c:forEach>
								</div>
								<div class="filter border-bottom pb-5">
									<h4 class="pt-5">LỌC THEO GIÁ</h4>
									<div class="range_container">
										<form action="/danh-sach-san-pham/${danhMuc}" method="post">
											<div class="sliders_control">
												<input name="min" value="${minPrice}" id="fromSlider" type="range"
													min="0" max="10000000" />
												<input name="max" value="${maxPrice}" id="toSlider" type="range"
													min="0" max="10000000" />
											</div>
											<button class="p-2 my-4 w-100">LỌC</button>
											<div class="form_control">
												<div class="form_control_container">
													<div class="form_control_container__time">Thấp nhất</div>
													<input class="form_control_container__time__input w-100"
														type="number" name="min" value="${minPrice}" id="fromInput"
														min="0" max="10000000" />
												</div>
												<div class="form_control_container">
													<div class="form_control_container__time">Cao nhất</div>
													<input class="form_control_container__time__input w-100"
														type="number" name="max" value="${maxPrice}" id="toInput"
														min="0" max="10000000" />
												</div>
											</div>
										</form>
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
										<c:if test="${page.isEmpty()}">
											<h5 class="mt-5 py-5 text-center text-danger">Không có sản phẩm</h5>
										</c:if>
										<c:forEach var="sanPham" items="${page.content}" varStatus="status">
											<div class="col-md-4">
												<div class="card rounded-0 w-100">
													<div class="card-image position-relative">
														<c:if test="${not empty sanPham.anhSanPhams}">
															<img src="${sanPham.anhSanPhams[0].url}" width="200"
																height="350" class="card-img-top" alt="...">
															<c:choose>
																<c:when test="${sanPham.hienThi}">
																	<div
																		class="add-to-cart-btn d-flex justify-content-center p-2 border position-absolute start-50 translate-middle">
																		<a href="/gio-hang/them/${sanPham.maSanPham}"
																			class="text-decoration-none text-dark fw-medium me-3 w-100">Add
																			to cart</a>
																		<a href=""><i class="bi bi-suit-heart"></i></a>
																		<a href=""><i class="bi bi-toggles"></i></a>
																		<a
																			href="/chi-tiet-san-pham/${sanPham.maSanPham}"><i
																				class="bi bi-search"></i></a>
																	</div>
																</c:when>
																<c:otherwise>
																	<span
																		style="width: 70px; height: 70px; font-size: 12px; background-color: darkgray;"
																		class="fw-bold d-flex align-items-center justify-content-center rounded-circle position-absolute start-50 top-50 translate-middle text-white">SOLD
																		OUT</span>
																	<div
																		class="add-to-cart-btn d-flex justify-content-center p-2 border position-absolute start-50 translate-middle">

																		<a href=""><i class="bi bi-suit-heart"></i></a>
																		<a href=""><i class="bi bi-toggles"></i></a>
																		<a
																			href="/chi-tiet-san-pham/${sanPham.maSanPham}"><i
																				class="bi bi-search"></i></a>
																	</div>
																</c:otherwise>
															</c:choose>

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
														<h5 class="fw-bold product-price">
															<fmt:formatNumber value="${sanPham.giaBan}"
																type="currency" />
														</h5>
													</div>

												</div>
											</div>
										</c:forEach>

									</div>
								</div>
								<div
									class="container d-flex justify-content-center align-items-center border-bottom border-top pt-3 mt-5">
									<nav
										aria-label="Page navigation example d-flex justify-content-center align-items-center">
										<ul
											class="pagination d-flex pagination-custom justify-content-center align-items-center">
											<c:if test="${page.totalPages > 1}">
												<c:forEach var="i" begin="0" end="${page.totalPages - 1}">
													<li
														class="page-item ${page.number == i ? 'pagination-active' : ''}">
														<a class="page-link border-0"
															href="/danh-sach-san-pham/${danhMuc}?p=${i}&sort=${sort}">${i
															+
															1}</a>
													</li>
												</c:forEach>
											</c:if>
											<li
												class="page-item ${page.number + 1 == page.totalPages ? 'disabled' : ''}">
												<a class="page-link border-0"
													href="/danh-sach-san-pham/${danhMuc}?p=${page.number + 1}&sort=${sort}">Tiếp
													theo</a>
											</li>
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