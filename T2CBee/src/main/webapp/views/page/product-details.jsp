<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0"/>
<div class="wrapper-product-detail" style="padding-top: 195px">

    <jsp:include page="../component/banner.jsp"></jsp:include>
    <section class="product-detail">
        <div class="container">
            <div class="detail-wrapper p-5">
                <div class="row">
                    <div class="col-6">
                        <div class="img-main">
                            <img src="${main_imgs[0].url}" alt="" id="mainImage">

                        </div>
                        <div class="slider-wrapper">
                            <div id="demo" class="carousel slide" data-bs-ride="carousel">
                                <!-- The slideshow/carousel -->
                                <div class="carousel-inner">
                                    <c:set var="counter" value="0"/>
                                    <c:forEach var="img" items="${imgs}" varStatus="status">
                                        <c:if test="${status.index % 4 == 0}">
                                            <div class="carousel-item <c:if
                                                test='${status.index == 0}'>active</c:if>">
                                            <div class="row">
                                        </c:if>

                                        <div class="col-3 ">
                                            <img class="image-item" src="${img.url}" alt="img${status.index}"
                                                 onclick="changeMainImage('${img.url}')"/>
                                        </div>

                                        <c:if test="${(status.index + 1) % 4 == 0 || status.last}">
                                            </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>

                                </div>

                                <!-- Left and right controls/icons -->
                                <button class="carousel-control-prev" type="button" data-bs-target="#demo"
                                        data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon bg-secondary rounded-circle"></span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#demo"
                                        data-bs-slide="next">
                                    <span class="carousel-control-next-icon bg-secondary rounded-circle "></span>
                                </button>
                            </div>
                        </div>


                    </div>
                    <div class="col-6">
                        <div class="prod-info">
                            <div class="prod-tittle fw-bold mb-3 text-uppercase">${sp.tenSanPham} <c:if
                                    test="${!sp.hienThi}"><span class="alert-danger fs-3">(Hết hàng)</span></c:if></div>

                        </div>
                        <div class="prod-star mb-3">
                            <c:if test="${soSao != 0}">
                                <c:forEach var="i" begin="1" end="5">
                                    <i class="bi bi-star-fill <c:if test='${i <= soSao}'>checked</c:if>"></i>
                                </c:forEach>
                            </c:if>
                            <c:choose>
                                <c:when test="${soDanhGia != 0}">
                                    <span class="people-comment">(${soDanhGia} người đánh giá)</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="people-comment">Chưa có đánh giá</span>
                                </c:otherwise>
                            </c:choose>

                        </div>
                        <fmt:setLocale value="vi_VN"/>
                        <fmt:setBundle basename="java.text.resources"/>
                        <div class="prod-price  mb-3">
                            <fmt:formatNumber value="${min_max_giaBan[0]}" type="currency"/>
                            <c:if test="${min_max_giaBan[1] != null}">- <fmt:formatNumber
                                    value="${min_max_giaBan[1]}" type="currency"/>
                            </c:if>

                        </div>
                        <div class="prod-describe mb-4">${sp.moTa}</div>
                        <div class="select-type-product mb-4 ">

                            <label for="type-select" class="fw-bold mb-3 ">Phân loại:</label> <select
                                id="type-select" class="form-select rounded-0 w-50 "
                                <c:if test="${!sp.hienThi}">disabled</c:if>
                                aria-label="Default select example">
                            <c:set var="selectedProductType" value="${param.productType}"/>
                            <option value="0"
                            ${selectedProductType == null || selectedProductType == "0" ? "selected" : ""}>Chọn
                                phân loại
                            </option>
                            <c:forEach var="chiTietLoai" items="${chiTietLoai}">
                                <option value="${chiTietLoai}"
                                    ${selectedProductType == chiTietLoai ? "selected" : ""}>${chiTietLoai}</option>
                            </c:forEach>
                        </select>
                        </div>
                        <c:if test="${sp.hienThi}">
                            <div id="hide" class="hide">
                                <p class="clear-selected">Làm mới</p>
                                <div class="prod-type-price ">
								<span class="price-after me-1 type-price fs-5">
								<fmt:formatNumber value="${sp.giaBan }" type="currency"/>
								</span>
                                </div>
                                <p class="inventory-quantity">Kho: ${sp.soLuong }</p>
                            </div>
                        </c:if>
                        <div class="group-submit mb-3 ">
                            <input type="number" value="1" min="1" max="${sp.soLuong}"
                                   class="input-quantity p-3 me-3 text-center">
                            <c:if test="${sp.hienThi}">
                                <button class="button-cart">
                                    <i class="bi bi-basket3"></i>Thêm vào giỏ
                                </button>
                            </c:if>
                        </div>
                        <div class="group-like-compare">



<%--                               lưu sản phẩm yêu thích                             --%>

                            <a href="javascript:void(0);" onclick="addToFavorites(${sp.maSanPham}, this);">
							<span class="prod-favorite">
                                <c:if test="${!fillHeart}">
                                <i class="bi bi-heart"></i>
                                </c:if>

                                <c:if test="${fillHeart}">
                                <i class="bi bi-heart-fill text-danger"></i>
                                </c:if>

								Thêm vào yêu thích
							</span>
                            </a>

<%--                               !lưu sản phẩm yêu thích                             --%>


                            <span class="prod-compare"> <i
                                class="bi bi-arrow-left-right"></i> So sánh
							</span>
                        </div>

                        <div class="prod-other">

                            <hr>
                            Danh mục:

                            <c:forEach var="nameDanhMuc" items="${lstDanhMuc}"
                                       varStatus="status">
                                <a href="#">${nameDanhMuc}</a>
                                <c:if test="${!status.last}">, </c:if>
                            </c:forEach>

                            <hr>

                        </div>

                        <div class="sharing-prod">
                            <p>
                                Chia sẻ: <span class="ms-2"><i class="bi bi-facebook"></i></span>
                                <span> <i class="bi bi-twitter"></i></span> <span><i
                                    class="bi bi-messenger"></i></span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="container mt-3 ">
                    <!-- Nav tabs -->
                    <ul class="nav cp-nav-product d-flex justify-content-center"
                        role="tablist">
                        <li class="nav-item"><a class="nav-link active "
                                                data-bs-toggle="tab" href="#description">Mô Tả </a></li>
                        <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
                                                href="#additional">Thông Số</a></li>
                        <li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
                                                href="#reviews">Đánh Giá (${soDanhGia})</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div id="description" class="container tab-pane active">
                            <br>
                            <p>${sp.moTa}</p>
                        </div>
                        <div id="additional" class="container tab-pane fade">
                            <br>
                            <table class="table table-bordered">
                                <tr>
                                    <td>Thương hiệu</td>
                                    <td>${sp.thuongHieu.tenThuongHieu}</td>
                                </tr>
                                <tr>
                                    <td>Trọng lượng</td>
                                    <td>${sp.trongLuong} kg</td>
                                </tr>
                                <tr>
                                    <td>Kích thước</td>
                                    <td>${sp.trongLuong} cm</td>
                                </tr>
                                <tr>
                                    <td>Phân Loại</td>
                                    <td>${sp.phanLoai}</td>
                                </tr>
                            </table>
                        </div>
                        <div id="reviews" class="container tab-pane fade">
                            <br>
                            <hr>
                            <section class="reviews-list ">
                                <c:if test="${cmts != null }">
                                    <c:forEach var="cmt" items="${cmts}">
                                        <div class="review-detail  row mb-3 ">
                                            <div class="col-1 review-avatar">
                                                <img
                                                        src="https://th.bing.com/th/id/R.c3631c652abe1185b1874da24af0b7c7?rik=XBP%2fc%2fsPy7r3HQ&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fpng-user-icon-circled-user-icon-2240.png&ehk=z4ciEVsNoCZtWiFvQQ0k4C3KTQ6wt%2biSysxPKZHGrCc%3d&risl=&pid=ImgRaw&r=0"
                                                        class="rounded-circle" width="50" height="50"
                                                        alt="User Avatar">
                                            </div>
                                            <div class="col-11 review-info">
                                                <p class="mb-0">
                                                    <b>${cmt.nguoiBinhLuan.hoVaTen}</b><span class="commented-date">
														(${cmt.ngayBinhLuan})</span>
                                                </p>
                                                <div class="prod-star mb-3">
                                                    <c:forEach var="i" begin="1" end="5">
                                                        <i class="bi bi-star-fill <c:if test='${i <= cmt.danhGia}'>checked</c:if>"></i>
                                                    </c:forEach>
                                                </div>
                                                <p>${cmt.binhLuan}</p>
                                                <div class="d-flex justify-content-between mt-2">
                                                    <span></span>
                                                    <span class="text-muted"><a href="#">Báo cáo</a> </span>
                                                </div>
                                            </div>
                                        </div>

                                    </c:forEach>
                                </c:if>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </section>
</div>
<script src="../js/slider.js"></script>

<script>
    document.addEventListener("DOMContentLoaded",
        function () {
            const selectElement = document
                .getElementById("type-select");
            const hideDiv = document.getElementById("hide");
            const clearSelectedElement = document
                .querySelector(".clear-selected");

            // Biến cờ để kiểm tra sự kiện change có phải là do người dùng tương tác hay không
            let isUserAction = true;

            // Hàm xử lý sự kiện khi select box thay đổi
            function handleSelectChange() {
                if (isUserAction) { // Kiểm tra xem sự kiện change có phải là do người dùng tương tác hay không
                    toggleHideDiv(); // Ẩn hiện div theo giá trị của select
                    const selectedOption = selectElement.options[selectElement.selectedIndex];
                    const selectedPhanLoai = selectedOption.value;
                    if (selectedPhanLoai !== "0") {
                        hideDiv.style.display = "block";
                        const url = '?productType='
                            + selectedPhanLoai;
                        window.location.href = url; // Chuyển hướng trang với tham số productType
                    }
                } else {
                    isUserAction = true; // Đặt lại biến cờ
                }
            }

            toggleHideDiv()
            // Bắt sự kiện khi select box thay đổi
            selectElement.addEventListener("change",
                handleSelectChange);

            // Bắt sự kiện trước khi trang được chuyển hướng
            window.addEventListener('beforeunload', function () {
                isUserAction = false; // Đặt biến cờ thành false trước khi chuyển hướng trang
            });

            clearSelectedElement.addEventListener("click", function () {
                selectElement.value = "0";
                toggleHideDiv();

            });

            // Hàm ẩn hiện div dựa trên giá trị của select box
            function toggleHideDiv() {
                if (selectElement.value === "0") {
                    hideDiv.style.display = "none"; // Ẩn div nếu select chọn giá trị 0
                } else {
                    console.log('Block');
                    hideDiv.style.display = "block"; // Hiện div nếu select chọn giá trị khác 0
                }
            }
        });

    function changeMainImage(url) {
        document.getElementById('mainImage').src = url;
    }
</script>


<script>
    function addToFavorites(productId, element) {
        const url = `../luu-san-pham-yeu-thich?productId=`+productId;

        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        })
            .then(response => response.text()) // hoặc response.json() nếu server trả về JSON
            .then(data => {
                const heartIcon = element.querySelector('.bi-heart, .bi-heart-fill');

                if (heartIcon.classList.contains('bi-heart')) {
                    heartIcon.classList.remove('bi-heart');
                    heartIcon.classList.add('bi-heart-fill', 'text-danger');
                } else {
                    heartIcon.classList.remove('bi-heart-fill', 'text-danger');
                    heartIcon.classList.add('bi-heart');
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
</script>




