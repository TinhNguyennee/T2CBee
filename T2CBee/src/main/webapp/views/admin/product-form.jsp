<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>T2CBee - Chi Tiết Sản Phẩm</title>
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
                            <form:form action="${pageContext.request.contextPath}/admin/san-pham" method="POST" modelAttribute="sanPham" enctype="multipart/form-data" >
                                <a class="btn btn-secondary mb-3" href="${pageContext.request.contextPath}/admin/san-pham">Quay về</a>
                                <button class="btn btn-primary mb-3" type="submit">Lưu</button>
                                <c:if test="${formError != null}">
                                    <div class="alert alert-danger alert-dismissible">
                                        <strong>${formError}</strong>
                                    </div>
                                </c:if>
                                <div class="row">
                                    <div class="col-6">
                                        <label class="form-label d-none">ID</label>
                                        <form:input cssClass="form-control d-none" path="maSanPham" readonly="true"/>
                                        <label class="form-label">Nhóm*</label>
                                        <form:input cssClass="form-control" path="groupId"/>
                                        <label class="form-label">Số lượng*</label>
                                        <form:input cssClass="form-control" path="soLuong" type="number" min="0" required="required"/>
                                        <label class="form-label">Phân loại* (vd: hồng, hồng + tặng kèm ghế,...)</label>
                                        <form:input cssClass="form-control" path="phanLoai" required="required"/>
                                        <label class="form-label">Trọng lượng (KG)*</label>
                                        <form:input cssClass="form-control" path="trongLuong" type="number" required="required"/>
                                        <label class="form-label">Danh Mục* <span class="text-success">${danhMucMessage}</span></label>
                                        <div class="input-group">
                                            <form:select path="danhMucs" class="custom-select" multiple="multiple" size="3" >
                                                <form:options items="${listDM}" itemLabel="tenDanhMuc" itemValue="maDanhMuc" ></form:options>
                                            </form:select>
                                            <div class="input-group-append">
                                                <a class="btn btn-primary font-weight-bold pt-4" href="${pageContext.request.contextPath}/admin/danh-muc" >&#43;</a>
                                                <a class="btn btn-danger font-weight-bold pt-4" href="${pageContext.request.contextPath}/admin/san-pham/delete?ctdm=all&spid=${sanPham.maSanPham}" ><i class="fa-solid fa-trash"></i></a>
                                            </div>
                                        </div>
                                        <label class="form-label">Mô tả*</label>
                                        <form:textarea class="form-control" rows="11" path="moTa" required="required"></form:textarea>
                                        <label class="form-label">Lần cuối cập nhật</label>
                                        <form:input cssClass="form-control" path="ngayCapNhat" readonly="true"/>
                                        <label class="form-label">Tạo bởi</label>
                                        <form:input cssClass="form-control" path="nguoiThem" readonly="true"/>
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Tên*</label>
                                        <form:input cssClass="form-control" path="tenSanPham"/>
                                        <label class="form-label">Giá*</label>
                                        <form:input cssClass="form-control" path="giaBan" type="number" required="required"/>
                                        <label class="form-label">Kích thước*</label>
                                        <form:input cssClass="form-control" path="kichThuoc" required="required"/>
                                        <label class="form-label">Hiển thị*</label>
                                        <div class="input-group">
                                            <form:select class="custom-select" path="hienThi" required="required">
                                                <form:option value="true">Hiển thị sản phẩm</form:option>
                                                <form:option value="false">Ẩn sản phẩm</form:option>
                                            </form:select>
                                        </div>
                                        <label class="form-label">Thương hiệu*</label>
                                        <div class="input-group">
                                            <form:select class="custom-select" path="thuongHieu" required="required">
                                                <form:options items="${listTH}" itemLabel="tenThuongHieu" itemValue="maThuongHieu"></form:options>
                                            </form:select>
                                            <div class="input-group-append">
                                                <a class="btn btn-primary font-weight-bold" href="${pageContext.request.contextPath}/admin/thuong-hieu">&#43;</a>
                                            </div>
                                        </div>
                                        <label class="form-label">Phiếu nhập*</label>
                                        <div class="input-group">
                                            <form:select class="custom-select" path="phieuNhap" required="required">
                                                <form:options items="${listPN}" itemLabel="maPhieuNhap" itemValue="maPhieuNhap"></form:options>
                                            </form:select>
                                            <div class="input-group-append">
                                                <button class="btn btn-primary font-weight-bold" href="${pageContext.request.contextPath}/admin/phieu-nhap">&#43;</button>
                                            </div>
                                        </div>
                                        <label class="form-label">Upload hình ảnh</label>
                                        <br>
                                        <a class="text-danger" href="${pageContext.request.contextPath}/admin/san-pham/delete?anh=all&spid=${sanPham.maSanPham}" >Bấm vào đây đê xóa toàn bộ ảnh!</a>
                                        <br>
                                        <span class="text-success">${anhSanPhamMess}</span>
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile01"
                                                aria-describedby="inputGroupFileAddon01" name="fileAnhs" multiple>
                                            <label class="custom-file-label" for="inputGroupFile01">Chọn ảnh tải lên</label>
                                        </div>
                                        <%--slider--%>
                                        <div id="carouselExampleControls" class="carousel slide border mt-3"
                                            data-ride="carousel" style="width: 300px; height: 300px;">
                                            <div class="carousel-inner">
                                                <c:forEach items="${sanPham.anhSanPhams}" var="imgItem" varStatus="loop">
                                                    <div class="carousel-item ${loop.first ? 'active' : ''} ">
                                                        <img class="d-block" src="${imgItem.url}" style="width: 300px; height: 300px;">
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button"
                                                data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#carouselExampleControls" role="button"
                                                data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div>
                                        <%--slider end--%>
                                        <label class="form-label">Ngày tạo</label>
                                        <form:input cssClass="form-control" path="ngayTao" readonly="true"/>
                                    </div>
                                </div>
                            </form:form>
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

    <!-- Danh Muc Modal -->
<%--    <div class="modal fade" id="danhmucModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"--%>
<%--        aria-hidden="true">--%>
<%--        <div class="modal-dialog" role="document">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <h5 class="modal-title" id="exampleModalLabel">Thêm danh mục</h5>--%>
<%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                        <span aria-hidden="true">&times;</span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <form>--%>
<%--                    <div class="modal-body">                       --%>
<%--                        <input class="form-control" placeholder="Mã danh mục...">--%>
<%--                        <br>--%>
<%--                        <input class="form-control" placeholder="Tên danh mục...">--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer">--%>
<%--                        <a href="${pageContext.request.contextPath}/admin/danh-muc">Chuyển tới trang danh mục...</a>--%>
<%--                        <button type="button" class="btn btn-primary" onclick="alert('m')">Thêm</button>--%>
<%--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>--%>
<%--                        --%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <!-- Thuong Hieu Modal -->
<%--    <div class="modal fade" id="thuonghieuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"--%>
<%--        aria-hidden="true">--%>
<%--        <div class="modal-dialog" role="document">--%>
<%--            <div class="modal-content">--%>
<%--                <div class="modal-header">--%>
<%--                    <h5 class="modal-title" id="exampleModalLabel">Thêm Thương Hiệu</h5>--%>
<%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                        <span aria-hidden="true">&times;</span>--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--                <form>--%>
<%--                    <div class="modal-body">                       --%>
<%--                        <input class="form-control" placeholder="Mã thương hiệu...">--%>
<%--                        <br>--%>
<%--                        <input class="form-control" placeholder="Tên thương hiệu...">--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer">--%>
<%--                        <a href="${pageContext.request.contextPath}/admin/thuong-hieu">Chuyển tới trang thương hiệu...</a>--%>
<%--                        <button type="button" class="btn btn-primary" onclick="alert('Them thuong hieu')">Thêm</button>--%>
<%--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>

</html>