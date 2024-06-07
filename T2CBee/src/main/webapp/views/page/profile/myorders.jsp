<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container-fluid text-center" style="padding-top: 195px">

    <span class="text-body-secondary fs14px">Tài Khoản Của Tôi</span>
    <h4>Đơn Hàng Của Tôi</h4>

    <hr class="mt-5">


</div>


<div class="container-fluid px-4 ">


    <div class="row">

        <div class="col-3">


            <jsp:include page="../../component/list-info.jsp"></jsp:include>


        </div>


        <div class="col-9">


            <div class="row mb-5">

                <div class="d-flex justify-content-start">
                    <div class="col-1"></div>
                    <a href="?status=all"
                       class="btn col-2 btn-custom rounded-0 border-top-0 border-start-0 border-end-0">Tất cả</a>
                    <a href="?status=CHO_XU_LY"
                       class="btn col-2 btn-custom rounded-0 border-top-0 border-start-0 border-end-0">Chờ thanh
                        toán</a>
                    <a href="?status=DANG_GIAO_HANG"
                       class="btn col-2 btn-custom rounded-0 border-top-0 border-start-0 border-end-0">Chờ giao hàng</a>
                    <a href="?status=HOAN_THANH"
                       class="btn col-2 btn-custom rounded-0 border-top-0 border-start-0 border-end-0">Hoàn thành</a>
                    <a href="?status=HUY"
                       class="btn col-2 btn-custom rounded-0 border-top-0 border-start-0 border-end-0">Hủy</a>
                    <div class="col-1"></div>
                </div>


            </div>


            <div class="row">

                <c:forEach var="gioHang" items="${gioHangList}">
                    <div class="row border mb-3">
                        <div class="row card-text text-danger fs15px my-2">
                            ${gioHang.trangThai}
                        </div>
                        <hr>

                        <c:forEach var="chiTiet" items="${chiTietGioHangMap[gioHang]}">
                            <div class="row d-flex justify-content-center align-items-center mb-2">
                                <div class="col-2">
                                    <c:if test="${not empty chiTiet.sanPham.anhSanPhams}">
                                    <img src="${chiTiet.sanPham.anhSanPhams[0].url}" class="card-img-top w-75" alt="${chiTiet.sanPham.tenSanPham}">
                                    </c:if>
                                </div>
                                <div class="col-9">
                                    <h5 class="fs17px">${chiTiet.sanPham.tenSanPham}</h5>
                                    <p class="card-text">x${chiTiet.soLuong}</p>
                                </div>
                                <div class="col-1">
                                    <c:if test="${chiTiet.sanPham.giaBan*chiTiet.soLuong != chiTiet.sanPham.giaBan*chiTiet.soLuong*(1-chiTiet.maGiamGia.discount)}">
                                <del class="text-muted">₫${chiTiet.sanPham.giaBan*chiTiet.soLuong}</del>
                                    </c:if>

                                    <h4 class="card-text text-danger fs17px">₫<fmt:formatNumber type="number" value="${chiTiet.sanPham.giaBan * chiTiet.soLuong * (1 - chiTiet.maGiamGia.discount)}" /></h4>


                                </div>
                            </div>
                            <hr>
                        </c:forEach>

                        <div class="row d-flex justify-content-end align-items-center mb-2">
                            <p class="fs15px m-0" style="width: 125px">Thành tiền:</p>
                            <p class="card-text text-danger fs18px m-0 mx-5" style="width: 50px;font-size: 24px">
                                ₫${gioHangTongTienMap[gioHang]}
                            </p>
                        </div>
                    </div>
                </c:forEach>


            </div>

        </div>

    </div>

</div>