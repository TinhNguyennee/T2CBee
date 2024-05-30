<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>T2CBee - Sản Phẩm</title>
    <%@include file="../component/css-embed.jsp" %>
</head>

<body id="page-top">
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
                        <h1 class="h3 mb-0 text-gray-800">Sản Phẩm</h1>
                    </div>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Danh Sách Sản Phẩm</h6>
                        </div>
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/san-pham/them-moi">Thêm Sản Phẩm</a>
                                <form class="d-flex" action="${pageContext.request.contextPath}/admin/san-pham/tim-kiem" method="GET">
                                    <input class="form-control mr-2" placeholder="Tìm kiếm..." name="keyword" style="width: 300px;">
                                    <button class="btn btn-primary"><i class="fas fa-search fa-sm" aria-hidden="true"></i></button>
                                </form>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Tên</th>
                                            <th>Nhóm</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Phân loại</th>
                                            <th>Danh mục</th>
                                            <th>Thương hiệu</th>
                                            <th>Nhà cung cấp</th>
                                            <th>Hiển thị</th>
                                            <th>Tạo bởi</th>
                                            <th>Ngày tạo</th>
                                            <th>Cập nhật</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <p class="text-danger">${listSP.totalPages <= 0 ? 'Không có kết quả' : ''}</p>
                                        <c:forEach items="${listSP.content}" var="item">
                                            <tr>
                                                <td>${item.maSanPham}</td>
                                                <td>${item.tenSanPham}</td>
                                                <td>${item.groupId}</td>
                                                <td>${item.giaBan}</td>
                                                <td>${item.soLuong}</td>
                                                <td>${item.phanLoai}</td>
                                                <td>
                                                    <c:forEach items="${item.danhMucs}" var="dmItem" varStatus="loop">
                                                        ${dmItem.danhMuc.tenDanhMuc}${loop.last ? "" : " - "}
                                                    </c:forEach>
                                                </td>
                                                <td>${item.thuongHieu.tenThuongHieu}</td>
                                                <td>${item.phieuNhap.nhaCungCap.tenNhaCungCap}</td>
                                                <td>${item.hienThi ? 'Hiện' : 'Ẩn'}</td>
                                                <td>${item.nguoiThem.id}</td>
                                                <td>${item.ngayTao}</td>
                                                <td>${item.ngayCapNhat}</td>
                                                <td class="">
                                                    <a class="btn btn-primary mr-1" href="${pageContext.request.contextPath}/admin/san-pham/${item.maSanPham}">Sửa</a>
                                                    <a class="btn btn-danger" href="${pageContext.request.contextPath}/admin/san-pham/delete?id=${item.maSanPham}" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/san-pham?p=${listSP.first ? 0 : listSP.number - 1}"><i class="fa-solid fa-chevron-left"></i></a></li>
                                <c:forEach begin="0" end="${listSP.totalPages <= 0 ? 0 : listSP.totalPages - 1}" var="pageItemNumber">
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/san-pham?p=${pageItemNumber}">${pageItemNumber + 1}</a></li>
                                </c:forEach>
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/san-pham?p=${listSP.last ? listSP.totalPages - 1 : listSP.number + 1}"><i class="fa-solid fa-chevron-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

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

</body>

</html>