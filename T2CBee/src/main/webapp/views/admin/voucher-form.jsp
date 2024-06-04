<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>T2CBee - Mã Giảm Giá</title>
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
                        <h1 class="h3 mb-0 text-gray-800">Mã Giảm Giá</h1>
                    </div>

                    <!--Thêm Mã Giảm Giá -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Thêm Mã Giảm Giá</h6>
                        </div>
                        <div class="card-body">
                            <form:form action="${pageContext.request.contextPath}/admin/ma-giam-gia" method="POST" modelAttribute="maGiamGia">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Tên Mã (ID)*</th>
                                            <th width="100px">Giảm giá (%)*</th>
                                            <th>Sản phẩm áp dụng*</th>
                                            <th width="100px">Số lượng*</th>
                                            <th>Bắt đầu*</th>
                                            <th>Kết thúc*</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><form:input cssClass="form-control" path="maGiamGia" readonly="${isUpdatePage}"/></td>
                                            <td><form:input cssClass="form-control" path="discount"/></td>
                                            <td>
                                                <div class="input-group">
                                                    <form:select class="custom-select" path="chiTietMaGiamGias" multiple="multiple" size="3">
                                                        <form:options items="${listSP}" itemLabel="tenSanPham" itemValue="maSanPham"></form:options>
                                                    </form:select>
                                                    <div class="input-group-append">
                                                        <a class="btn btn-danger font-weight-bold" href="${pageContext.request.contextPath}/admin/ma-giam-gia/delete?ctgg=all&mggid=${maGiamGia.maGiamGia}">Reset</a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td><form:input cssClass="form-control" path="soLuong"/></td>
                                            <fmt:formatDate value="${maGiamGia.ngayBatDau}" var="ngayBatDauFormated" pattern="yyyy-MM-dd" />
                                            <fmt:formatDate value="${maGiamGia.ngayKetThuc}" var="ngayKetThucFormated" pattern="yyyy-MM-dd" />
                                            <td><form:input cssClass="form-control" path="ngayBatDau" type="date" value="${ngayBatDauFormated}"/></td>
                                            <td><form:input cssClass="form-control" path="ngayKetThuc" type="date" value="${ngayKetThucFormated}"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button class="btn btn-primary mb-3" type="submit">Lưu</button>
                                <a class="btn btn-secondary ml-2 mb-3" href="${pageContext.request.contextPath}/admin/ma-giam-gia">Làm mới</a>
                            </form:form>
                        </div>
                    </div>

                    <!-- Danh Sách Mã Giảm Giá -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Danh Sách Mã Giảm Giá</h6>
                        </div>
                        <div class="card-body">
                            <form class="d-flex mb-3">
                                <input class="form-control mr-2" placeholder="Tìm kiếm..." style="width: 300px;">
                                <button class="btn btn-primary"><i class="fas fa-search fa-sm" aria-hidden="true"></i></button>
                            </form>
                            <c:if test="${systemError != null}">
                                <div class="alert alert-danger alert-dismissible">
                                    <strong>Lỗi!</strong> ${systemError}
                                </div>
                            </c:if>
                            <table class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th width="2rem">Giảm (%)</th>
                                        <th>Sản phẩm áp dụng</th>
                                        <th>Số lượng</th>
                                        <th>Bắt đầu</th>
                                        <th>Kết thúc</th>
                                        <th>Tạo bởi</th>
                                        <th>Ngày tạo</th>
                                        <th>Cập nhật</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listMGG.content}" var="item">
                                        <tr>
                                            <td>${item.maGiamGia}</td>
                                            <td>${item.discount}</td>
                                            <td>
                                                <c:forEach items="${item.chiTietMaGiamGias}" var="itemCTGG" varStatus="loop">
                                                    <p>${loop.index + 1}. ${itemCTGG.sanPham.tenSanPham} - ${itemCTGG.sanPham.phanLoai}</p>
                                                </c:forEach>
                                            </td>
                                            <td>${item.soLuong}</td>
                                            <td>${item.ngayBatDau}</td>
                                            <td>${item.ngayKetThuc}</td>
                                            <td>${item.nguoiThem.id}</td>
                                            <td>${item.ngayTao}</td>
                                            <td>${item.ngayCapNhat}</td>
                                            <td class="">
                                                <a class="btn btn-primary mr-1" href="${pageContext.request.contextPath}/admin/ma-giam-gia/${item.maGiamGia}">Sửa</a>
                                                <a class="btn btn-danger ml-2" href="${pageContext.request.contextPath}/admin/ma-giam-gia/delete?id=${item.maGiamGia}">Xóa</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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