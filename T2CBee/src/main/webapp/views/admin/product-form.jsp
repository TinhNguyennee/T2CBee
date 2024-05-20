<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>T2C-Bee - Chi Tiết Sản Phẩm</title>
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
                            <button class="btn btn-primary mb-3">Lưu</button>
                            <div class="row">
                                <div class="col-6">
                                    <label class="form-label">ID</label>
                                    <input class="form-control">
                                    <label class="form-label">Nhóm</label>
                                    <input class="form-control">
                                    <label class="form-label">Số lượng</label>
                                    <input class="form-control">
                                    <label class="form-label">Danh Mục</label>
                                    <div class="input-group">
                                        <select class="custom-select">
                                            <option value="1">Nội thất</option>
                                            <option value="2">Trang trí</option>
                                            <option value="3">Sân vườn</option>
                                        </select>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary font-weight-bold" href="#" data-toggle="modal" data-target="#danhmucModal">&#43;</button>
                                        </div>
                                    </div>
                                    <label class="form-label">Phân loại</label>
                                    <input class="form-control">
                                    <label class="form-label">Trọng lượng</label>
                                    <input class="form-control">
                                    <label class="form-label">Tạo bởi</label>
                                    <input class="form-control" disabled>
                                    <label class="form-label">Lần cuối cập nhật</label>
                                    <input class="form-control" disabled>
                                    <label class="form-label">Mô tả</label>
                                    <textarea class="form-control" rows="11" id="comment"></textarea>
                                </div>
                                <div class="col-6">
                                    <label class="form-label">Tên</label>
                                    <input class="form-control">
                                    <label class="form-label">Giá</label>
                                    <input class="form-control">
                                    <label class="form-label">Hiển thị</label>
                                    <input class="form-control">
                                    <label class="form-label">Thương hiệu</label>
                                    <div class="input-group">
                                        <select class="custom-select">
                                            <option value="1">T@ble</option>
                                            <option value="2">abc</option>
                                            <option value="3">abc</option>
                                        </select>
                                        <div class="input-group-append">
                                            <a class="btn btn-primary font-weight-bold" href="#" data-toggle="modal" data-target="#thuonghieuModal">&#43;</a>
                                        </div>
                                    </div>
                                    <label class="form-label">Kích thước</label>
                                    <input class="form-control">
                                    <label class="form-label">Phiếu nhập</label>
                                    <input class="form-control" disabled>
                                    <label class="form-label">Ngày tạo</label>
                                    <input class="form-control" disabled>
                                    <label class="form-label">Upload hình ảnh</label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="inputGroupFile01"
                                            aria-describedby="inputGroupFileAddon01">
                                        <label class="custom-file-label" for="inputGroupFile01">Chọn ảnh tải lên</label>
                                    </div>

                                    <div id="carouselExampleControls" class="carousel slide border mt-3"
                                        data-ride="carousel" style="width: 300px; height: 300px;">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img class="d-block" src="/img/eww.png" alt="First slide"
                                                    style="width: 300px; height: 300px;">
                                            </div>
                                            <div class="carousel-item">
                                                <img class="d-block w-100" src="/img/1151258.160.jpg" alt="Second slide"
                                                    style="width: 300px; height: 300px;">
                                            </div>
                                            <div class="carousel-item">
                                                <img class="d-block w-100" src="/img/1151258.160.jpg" alt="Third slide"
                                                    style="width: 300px; height: 300px;">
                                            </div>
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

    <!-- Danh Muc Modal -->
    <div class="modal fade" id="danhmucModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm danh mục</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form>
                    <div class="modal-body">                       
                        <input class="form-control" placeholder="Mã danh mục...">
                        <br>
                        <input class="form-control" placeholder="Tên danh mục...">
                    </div>
                    <div class="modal-footer">
                        <a href="${pageContext.request.contextPath}/admin/danh-muc">Chuyển tới trang danh mục...</a>
                        <button type="button" class="btn btn-primary" onclick="alert('m')">Thêm</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                        
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Thuong Hieu Modal -->
    <div class="modal fade" id="thuonghieuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm Thương Hiệu</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form>
                    <div class="modal-body">                       
                        <input class="form-control" placeholder="Mã thương hiệu...">
                        <br>
                        <input class="form-control" placeholder="Tên thương hiệu...">
                    </div>
                    <div class="modal-footer">
                        <a href="${pageContext.request.contextPath}/admin/thuong-hieu">Chuyển tới trang thương hiệu...</a>
                        <button type="button" class="btn btn-primary" onclick="alert('Them thuong hieu')">Thêm</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    </div>
                </form>
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