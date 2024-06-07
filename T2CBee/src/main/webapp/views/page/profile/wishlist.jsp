<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid text-center" style="padding-top: 195px">

    <span class="text-body-secondary fs14px">Tài Khoản Của Tôi</span>
    <h4>Danh Sách Yêu Thích</h4>

    <hr class="mt-5">


</div>


<div class="container-fluid px-4 ">


<%--    <div class="row">--%>

<%--        <div class="dropdown d-flex justify-content-end">--%>
<%--            <button class="btn btn-secondary btn-sm dropdown-toggle rounded-0 bg-white text-black" type="button"--%>
<%--                    data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                Sắp xếp--%>
<%--            </button>--%>
<%--            <ul class="dropdown-menu rounded-0">--%>
<%--                <li><a class="dropdown-item list-hover" href="#">Mới thêm vào</a></li>--%>
<%--                <li><a class="dropdown-item list-hover" href="#">Giá cao đến thấp</a></li>--%>
<%--                <li><a class="dropdown-item list-hover" href="#">Giá thấp đến cao</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>

<%--    </div>--%>


    <div class="row">

        <div class="col-3">


            <jsp:include page="../../component/list-info.jsp"></jsp:include>


        </div>


        <div class="col-9">


            <div class="row d-flex">


                <%--                Sản phẩm--%>

                    <c:forEach var="sanPhamYeuThich" items="${sanPhamYeuThichList}">
                        <div class="col-md-4">
                            <div class="card rounded-0 w-100">
                                <div class="card-image position-relative">
                                    <c:if test="${not empty sanPhamYeuThich.sanPham.anhSanPhams}">
                                        <img src="${sanPhamYeuThich.sanPham.anhSanPhams[0].url}" width="200" height="350" class="card-img-top" alt="${sanPhamYeuThich.sanPham.tenSanPham}">
                                        <div class="add-to-cart-btn d-flex justify-content-center p-2 border position-absolute start-50 translate-middle">
                                            <a href="" class="text-decoration-none text-dark fw-medium me-3 w-100">Add to cart</a>
                                            <a href=""><i class="bi bi-suit-heart"></i></a>
                                            <a href=""><i class="bi bi-toggles"></i></a>
                                            <a href="/chi-tiet-san-pham/${sanPhamYeuThich.sanPham.maSanPham}"><i class="bi bi-search"></i></a>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <div class="title-head d-flex m-0">
                                        <p class="card-text mb-2 w-100" style="font-size: 12px;">
                                            <c:forEach items="${sanPhamYeuThich.sanPham.danhMucs}" var="danhMuc" varStatus="loop">
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
                                    <p class="card-title mb-2 fw-bold">${sanPhamYeuThich.sanPham.tenSanPham}</p>
                                    <h5 class="fw-bold product-price">${sanPhamYeuThich.sanPham.giaBan}</h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>




                <%--                !Sản phẩm--%>


                    <!-- Phân trang -->
                    <nav aria-label="Page navigation" class="d-flex justify-content-center">
                        <ul class="pagination">
                            <c:if test="${currentPage > 0}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage - 1}&size=${3}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:forEach var="i" begin="0" end="${totalPages - 1}">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="?page=${i}&size=${3}">${i + 1}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${currentPage < totalPages - 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage + 1}&size=${3}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>


            </div>

        </div>

    </div>

</div>