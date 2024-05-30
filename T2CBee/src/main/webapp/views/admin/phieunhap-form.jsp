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

    <title>T2C-Bee - Phiếu Nhập</title>
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
                        <h1 class="h3 mb-0 text-gray-800">Phiếu Nhập</h1>
                    </div>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Danh Sách Phiếu Nhập</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6">
                                    <form:form action="${pageContext.request.contextPath}/admin/phieu-nhap" method="POST" modelAttribute="phieuNhapHang">
                                        <button class="btn btn-primary mb-3" type="submit">Lưu</button>
                                        <a class="btn btn-secondary mb-3" href="${pageContext.request.contextPath}/admin/phieu-nhap">Mới</a>
                                        <a class="btn btn-danger mb-3 ml-2" href="${pageContext.request.contextPath}/admin/phieu-nhap/delete?id=${phieuNhapHang.maPhieuNhap}" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                                        <br>
                                        <label class="form-label">Mã phiếu nhập</label>
                                        <form:input cssClass="form-control" path="maPhieuNhap" readonly="${isUpdatePage}"/>
                                        <label class="form-label">Nhà cung cấp</label>
                                        <div class="input-group">
                                            <form:select class="custom-select" path="nhaCungCap">
                                                <form:options items="${listNCC}"></form:options>
                                            </form:select>
                                            <div class="input-group-append">
                                                <a class="btn btn-primary font-weight-bold" href="${pageContext.request.contextPath}/admin/nha-cung-cap">&#43;</a>
                                            </div>
                                        </div>
                                        <label class="form-label">Trạng thái</label>
                                        <form:select class="custom-select" path="trangThai">
                                            <form:option value="DANG_HOAN_THANH">Đang hoàn thành</form:option>
                                            <form:option value="HOAN_THANH">Hoàn thành</form:option>
                                        </form:select>
                                        <label class="form-label">Tạo bởi</label>
                                        <form:input cssClass="form-control" path="nguoiNhap.id" readonly="true"/>
                                        <label class="form-label">Ngày thêm</label>
                                        <form:input cssClass="form-control" path="ngayNhap" readonly="true"/>
                                        <label class="form-label">Lần cuối cập nhật</label>
                                        <form:input cssClass="form-control" path="ngayCapNhat" readonly="true"/>
                                    </form:form>
                                </div>
                                <div class="col-6">
                                    <form class="d-flex mt-4 mb-3" action="${pageContext.request.contextPath}/admin/phieu-nhap/tim-kiem" method="GET">
                                        <input class="form-control mr-2" placeholder="Tìm kiếm..." name="keyword" style="width: 300px;">
                                        <button class="btn btn-primary"><i class="fas fa-search fa-sm" aria-hidden="true"></i></button>
                                    </form>
                                    <div class="table-responsive mt-4">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã</th>
                                                    <th>Nhà cung cấp</th>
                                                    <th>Trạng thái</th>
                                                    <th>Tạo bởi</th>
                                                    <th>Ngày tạo</th>
                                                    <th>Cập nhật</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <p class="text-danger">${listPN.totalPages <= 0 ? 'Không có kết quả' : ''}</p>
                                                <c:forEach items="${listPN.content}" var="item">
                                                    <tr>
                                                        <td>${item.maPhieuNhap}</td>
                                                        <td>${item.nhaCungCap.tenNhaCungCap}</td>
                                                        <td>${item.trangThai}</td>
                                                        <td>${item.nguoiNhap.id}</td>
                                                        <td>${item.ngayNhap}</td>
                                                        <td>${item.ngayCapNhat}</td>
                                                        <td class="">
                                                            <a class="btn btn-primary mr-1" href="${pageContext.request.contextPath}/admin/phieu-nhap/${item.maPhieuNhap}">Sửa</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/phieu-nhap?p=${listPN.first ? 0 : listPN.number - 1}"><i class="fa-solid fa-chevron-left"></i></a></li>
                                        <c:forEach begin="0" end="${listPN.totalPages <= 0 ? 0 : listPN.totalPages - 1}" var="pageItemNumber">
                                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/phieu-nhap?p=${pageItemNumber}">${pageItemNumber + 1}</a></li>
                                        </c:forEach>
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/phieu-nhap?p=${listPN.last ? listPN.totalPages - 1 : listPN.number + 1}"><i class="fa-solid fa-chevron-right"></i></a></li>
                                    </ul>
                                </div>
                            </div>
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>

</html>