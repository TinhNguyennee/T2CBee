<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div style="padding-top: 195px; padding-bottom: 50px;">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <fmt:setLocale value="vi_VN" />
    <fmt:setBundle basename="java.text.resources" />
</div>
<jsp:include page="../component/banner.jsp"></jsp:include>
<div class="body-checkout" style="padding-top: 55px">
    <form action="/dat-hang" method="post">
        <div class="container container-checkout border-0">
            <p>${error}</p>
            <div class="row row-re d-flex">
                <div class="col-lg-8 col-md-12 col-sm-12">
                    <div class="row">
                        <div class="col-lg-6 col-md-12 col-sm-12">
                            <h3>Thông tin nhận hàng</h3>
                            <c:set var="user" value="${sessionScope.user}" />
                            <div class="mb-3">
                                <input type="tel" class="form-control" value="${user.soDienThoai}" name="soDienThoai"
                                       placeholder="Số điện thoại" required>
                            </div>

                            <div class="mb-3">
                                <input type="text" class="form-control" value="${user.hoVaTen}" name="hoVaTen"
                                       placeholder="Họ và tên" required>
                            </div>
                            <div class="mb-3">
                                <input type="email" class="form-control" value="${user.email}" name="email"
                                       placeholder="Email(tùy chọn)">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" value="${user.diaChi}" name="diaChi"
                                       placeholder="Địa chỉ" required>
                            </div>

<%--                            <div class="mb-3">--%>
<%--                                <textarea class="form-control" id="note" placeholder="Ghi chú" rows="3"></textarea>--%>
<%--                            </div>--%>
                        </div>


                        <div class="col-lg-6 col-md-12 col-sm-12 pe-4 ">
                            <h3>Vận chuyển</h3>
                            <div class="form-radio mb-3">
                                <input class="form-check-input" type="radio" checked name="vanchuyenrdo"
                                       id="vanchuyenrdo" style="display: inline-block !important;">
                                <label class="form-check-label ms-2 " for="vanchuyenrdo">
                                    <span class="text-start"> Giao hàng tận nơi</span> <span class="text-start">
                                            (Miễn
                                            phí)</span>
                                </label>
                            </div>

                            <h3>Thanh toán</h3>
                            <div class="form-radio d-flex text-wrap ">
                                <input class="form-check-input" type="radio" name="thanhtoanrdo" checked
                                       id="thanhtoanrdo" style="display: block !important;">
                                <label class="form-check-label ms-2 " for="thanhtoanrdo">
                                        <span>Thanh toán khi giao hàng (COD) [Được kiểm tra hàng tại chỗ, không được thử
                                            hàng]</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12 col-sm-12">

                        <h3 class="">Đơn hàng <span>(${fn:length(sessionScope.cartItem)} sản phẩm)</span></h3>
                        <hr>
                        <table class="product-table " id="product-table" data-tg-refresh="refreshDiscount">
                            <caption class="visually-hidden">Chi tiết đơn hàng</caption>
                            <thead class="product-table__header">
                            <tr>
                                <th>
                                    <span class="visually-hidden">Ảnh sản phẩm</span>
                                </th>
                                <th>
                                    <span class="visually-hidden">Mô tả</span>
                                </th>
                                <th>
                                    <span class="visually-hidden">Sổ lượng</span>
                                </th>
                                <th>
                                    <span class="visually-hidden">Đơn giá</span>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${sessionScope.cartItem }" >
                                <%-- Tính tổng giá cho từng sản phẩm --%>
                            <c:set var="subtotal" value="${item.sanPham.giaBan * item.soLuong}" />
                                <%-- Tỉnh tổng giá cho đơn hàng chưa có voucher--%>
                            <c:set var="totalPrice" value="${totalPrice + subtotal}" />
                            <tr class="checkout-product">
                                <td class="product__image">
                                    <div class="product-thumbnail">
                                        <div class="product-thumbnail__wrapper p-1">
                                            <img src="${item.sanPham.anhSanPhams[0].url}" alt="">
                                        </div>

                                    </div>
                                </td>
                                <th class=" product__description d-flex flex-column ">
                                    <div class=" product__description__name">
                                        <b>${item.sanPham.tenSanPham}</b>
                                    </div>

                                    <div class="product__description__property">
                                            ${item.sanPham.phanLoai}
                                    </div>

                                    <div class="product__description__property">
                                                        <span class="discount-tag">
                                                            <c:if test="${not empty discount}">
                                                                <c:forEach var="entry" items="${discount.entrySet()}">
                                                                    <%-- Hiện ra voucher nếu là sản phẩm nằm trong danh
                                                                        sách có mã giảm --%>
                                                                    <c:if
                                                                            test="${entry.key.maSanPham == item.sanPham.maSanPham}">
                                                                        <%-- Tính giá trị giảm cho từng sản phẩm có
                                                                            mã giảm--%>
                                                                        <c:set var="Discount"
                                                                               value="${entry.value.discount*item.sanPham.giaBan*item.soLuong}">
                                                                        </c:set>
                                                                        <%-- Tính tổng giá trị giảm cho các sản
                                                                            phẩm có phiếu giảm --%>
                                                                        <c:set var="totalDiscount"
                                                                               value="${totalDiscount + Discount}">
                                                                        </c:set>
                                                                        <span class="discount-icon"><i
                                                                                class="bi bi-tag"></i></span>
                                                                        <span class="discount-tag--name text-danger">
                                                                  <%--      % giảm    --%><fmt:formatNumber value="${entry.value.discount}" type="number"  pattern="##0%" />
                                                                  <%--      Giá giảm    --%>(Giảm <fmt:formatNumber value="${Discount}" type="currency" />)
                                                                                    </span>
                                                                    </c:if>

                                                                </c:forEach>
                                                            </c:if>

                                                        </span>
                                    </div>
                                </th>
                                <td class="product__quantity"> ${item.soLuong}</td>
                                <td class="product__price">
                                    <fmt:formatNumber value="${subtotal}" type="currency" />
                                </td>
                            </tr>

                            </c:forEach>
                            </tbody>
                        </table>

                    <hr>
                    <p class="container text-danger">${mess}</p>
                    <div class="container  mb-2 d-flex">
                        <form class="input-voucher" method="post">
                            <input type="text" class="form-control mb-2  w-75" placeholder="Nhập mã giảm giá"
                                   value="${fn:toUpperCase(param.productVoucher)}" name="productVoucher">
                            <button type="submit" class="btn btn-red mb-2" formaction="/thanh-toan">Áp dụng</button>
                        </form>
                    </div>

                    <hr>
                    <div class="total-checkout p-2">
                        <table class="table-total-checkout fs-6 ">
                            <tr>
                                <td>Tạm tính</td>
                                <td>
                                    <fmt:formatNumber value="${totalPrice}" type="currency" />
                                </td>
                            </tr>
                            <tr>
                                <td>Phí vận chuyển</td>
                                <td>Miễn phí</td>
                            </tr>

                            <c:if test="${not empty discount}">
                                <%-- <c:forEach var="entry" items="${discount.entrySet()}">--%>
                                <%-- <tr>--%>
                                <%-- <td>Áp dụng: ${entry.value.maGiamGia}</td>--%>
                                <%-- <td>${entry.value.discount *100}%</td>--%>
                                <%-- </tr>--%>

                                <%-- </c:forEach>--%>
                                <tr >
                                    <td>Giảm: </td>
                                    <td class="text-danger" >-
                                        <fmt:formatNumber value="${totalDiscount}"
                                                          type="currency" />
                                    </td>
                                </tr>
                            </c:if>
                        </table>
                        <hr>

                        <div class="d-flex justify-content-between">
                            <p class="label-total fs-5">Tổng tiền:</p>
                            <p class="total-product-price">
                                <fmt:formatNumber value="${totalPrice - totalDiscount}" type="currency" />
                            </p>
                        </div>
                    </div>
                    <div class="group-button text-center">
                        <button  class="btn-red btn-order" formaction="/dat-hang/${sessionScope.cartItem.get(0).gioHang.id}">Đặt hàng</button>
                    </div>
                </div>

            </div>

        </div>
    </form>
</div>