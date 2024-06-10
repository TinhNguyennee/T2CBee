<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Content -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="vi_VN"/>
<fmt:setBundle basename="java.text.resources"/>
<div class="container-fluid wrapper-product-detail position-relative" style="padding-top: 195px">



    <jsp:include page="../component/banner.jsp"></jsp:include>
    <section class="container p-5 bg-white position-relative" style="top: -50px;">
        <div class="h-100 py-5">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col" class="h5">Sản phẩm</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>

<c:forEach var="item" items="${ sessionScope.cartItem }">
                                <tr>
                                    <th scope="row">
                                        <div class="d-flex align-items-center">
                                            <img src="${item.sanPham.anhSanPhams[0].url} " class="img-fluid rounded-3"
                                                style="width: 120px;" alt="Book">
                                            <div class="flex-column ms-4">
                                                <p class="mb-2">${item.sanPham.tenSanPham}</p>
                                                <p class="mb-0">${item.sanPham.phanLoai}</p>
                                            </div>
                                        </div>
                                    </th>
                                    <form action="<c:url value='/gio-hang/cap-nhat/${ item.sanPham.maSanPham}' />" method="post">
                                    <td class="align-middle">
                                        <div class="d-flex flex-row">

                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                    onblur="this.form.submit()"   onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <i class="bi bi-dash-lg"></i>
                                            </button>

                                            <input id="form1" min="1" name="soLuong" value="${item.soLuong}" max="${item.sanPham.soLuong}" type="number"
                                                class="form-control form-control-sm" style="width: 50px;" onblur="this.form.submit()"/>

                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                    onblur="this.form.submit()"   onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <i class="bi bi-plus"></i>
                                            </button>

                                        </div>
                                    </td>
                                    </form>
                                    <td class="align-middle">
                                        <p class="mb-0" style="font-weight: 500;"><fmt:formatNumber value="${ item.sanPham.giaBan * item.soLuong}" type="currency"/></p>
                                    </td>
                                    <td class="align-middle">
                                        <a href="/gio-hang/xoa/${item.sanPham.maSanPham}" style="color: #cecece;"><i class="bi bi-trash"></i></a>
                                    </td>
                                </tr>
                                <c:set var="subtotal" value="${item.sanPham.giaBan * item.soLuong}" />
                                <c:set var="totalPrice" value="${totalPrice + subtotal}" />

</c:forEach>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        <div class="total text-end">
            <h3 class="fw-bold">Tổng tiền <span class="fs-3 fw-bold"><fmt:formatNumber value="${totalPrice}" type="currency"/></span></h3>
            <div class="total-btn pt-3">
                <a href="/trang-chu" class="bg-transparent py-3 px-4 mx-3">Tiếp tục mua hàng</a>
                <a href="/thanh-toan" class="bg-transparent py-3 px-4 total-btn-active">Tiến hành thanh toán</a>
            </div>
        </div>
    </section>

</div>

<!-- Content -->