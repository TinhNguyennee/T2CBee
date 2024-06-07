<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>T2CBee - Hóa Đơn</title>
    <%@include file="../component/css-embed.jsp" %>
</head>

<body id="page-top">
    <fmt:setLocale value="vi_VN"/>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <jsp:include page="../component/sidebar.jsp"></jsp:include>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <jsp:include page="../component/topbar.jsp"></jsp:include>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Hóa Đơn</h1>
                    </div>

                    <!-- DataTales Example -->
                    <div class="row">
                        <div class="col-6">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Danh Sách Hóa Đơn</h6>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex justify-content-end mb-3">
                                        <select id="orderStatusSelect" class="custom-select mr-5">
                                            <option value="TAT_CA">Tất Cả</option>
                                            <option value="CHO_XU_LY" ${param.tt == 'CHO_XU_LY' ? 'selected' : ''}>Chờ Xử Lý</option>
                                            <option value="HOAN_THANH" ${param.tt == 'HOAN_THANH' ? 'selected' : ''}>Hoàn Thành</option>
                                            <option value="DANG_GIAO_HANG" ${param.tt == 'DANG_GIAO_HANG' ? 'selected' : ''}>Đang Giao Hàng</option>
                                            <option value="HUY" ${param.tt == 'HUY' ? 'selected' : ''}>Hủy</option>
                                        </select>
                                        <form class="d-flex" action="${pageContext.request.contextPath}/admin/hoa-don/tim-kiem" method="GET">
                                            <input class="form-control mr-2" placeholder="Tìm kiếm..." name="keyword" style="width: 300px;">
                                            <button class="btn btn-primary"><i class="fas fa-search fa-sm" aria-hidden="true"></i></button>
                                        </form>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-bordered" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID Giỏ Hàng</th>
                                                    <th>Khách Hàng</th>
                                                    <th>Trạng Thái</th>
                                                    <th>Ngày tạo</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <p class="text-danger">${listGH.totalPages <= 0 ? 'Không có kết quả' : ''}</p>
                                                <c:forEach items="${listGH.content}" var="item">
                                                    <tr>
                                                        <td>${item.id}</td>
                                                        <td>${item.khachHang.maKhachHang}</td>
                                                        <td>${item.trangThai}</td>
                                                        <td>${item.ngayTao}</td>
                                                        <td class="d-flex">
                                                            <a class="btn btn-secondary mr-1" href="${pageContext.request.contextPath}/admin/hoa-don?id=${item.id}">Xem</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="d-flex">
                                        <div class="mx-auto">
                                            <ul class="pagination">
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/hoa-don?p=${listGH.first ? 0 : listGH.number - 1}"><i class="fa-solid fa-chevron-left"></i></a></li>
                                                <c:forEach begin="0" end="${listGH.totalPages <= 0 ? 0 : listGH.totalPages - 1}" var="pageItemNumber">
                                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/hoa-don?p=${pageItemNumber}">${pageItemNumber + 1}</a></li>
                                                </c:forEach>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/hoa-don?p=${listGH.last ? listGH.totalPages - 1 : listGH.number + 1}"><i class="fa-solid fa-chevron-right"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Sản phẩm trong hóa đơn <b>${param.id}</b></h6>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã SP</th>
                                                    <th>Tên Sản Phẩm</th>
                                                    <th>Giảm</th>
                                                    <th>Đơn Giá</th>
                                                    <th>SL</th>
                                                    <th>Thành Tiền</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="totalAmount" value="0" />
                                                <c:set var="totalDiscount" value="0" />
                                                <p class="text-danger">${listCTGH.totalPages <= 0 ? 'Giỏ hàng rỗng!' : ''}</p>
                                                <c:forEach items="${listCTGH.content}" var="item">
                                                    <tr>
                                                        <td>${item.sanPham.maSanPham}</td>
                                                        <td>${item.sanPham.tenSanPham}+ ${item.sanPham.phanLoai}</td>
                                                        <td>${item.maGiamGia.discount}</td>
                                                        <c:set var="totalDiscount" value="${totalDiscount + (item.sanPham.giaBan * (item.maGiamGia.discount != null ? item.maGiamGia.discount : 0))}" />
                                                        <td><fmt:formatNumber value="${item.sanPham.giaBan - (item.sanPham.giaBan * (item.maGiamGia.discount != null ? item.maGiamGia.discount : 0)) }" type="currency" currencySymbol="đ"/></td>
                                                        <td>${item.soLuong}</td>
                                                        <td>${item.soLuong * item.sanPham.giaBan - (item.sanPham.giaBan * (item.maGiamGia.discount != null ? item.maGiamGia.discount : 0))}</td>
                                                        <c:set var="totalAmount" value="${totalAmount + (item.soLuong * (item.sanPham.giaBan - (item.sanPham.giaBan * (item.maGiamGia.discount != null ? item.maGiamGia.discount : 0)) ))}" />
                                                        <td class="d-flex">
                                                            <div class="mx-auto">
                                                                <a class="btn btn-primary" style="font-size: 12px;" target="_blank" href="${pageContext.request.contextPath}/chi-tiet-san-pham/${item.sanPham.maSanPham}"><i class="fa-solid fa-eye"></i></a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class=" text-right ">
                                            <h5 class="font-weight-bold text-dark">Phí vận chuyển: <span>0 đ</span></h5>
                                            <h5 class="font-weight-bold text-dark">Giảm giá: <span>-<fmt:formatNumber value="${totalDiscount}" type="currency" currencySymbol="đ"/></span></h5>
                                            <h5 class="text-danger font-weight-bold">Tổng tiền: <span class="text-dark"><fmt:formatNumber value="${totalAmount}" type="currency" currencySymbol="đ"/></span></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid --

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"  aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.jsp">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('orderStatusSelect').addEventListener('change', function() {
            var selectedValue = this.value;
            var url = '${pageContext.request.contextPath}/admin/hoa-don?tt=' + selectedValue;
            window.location.href = url;
        });
    </script>
</body>

</html>