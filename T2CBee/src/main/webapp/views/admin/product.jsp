<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/chi-tiet-san-pham">Thêm Sản Phẩm</a>
                                <form class="d-flex ">
                                    <input class="form-control mr-2" placeholder="Tìm kiếm..." style="width: 300px;">
                                    <button class="btn btn-primary"><i class="fas fa-search fa-sm" aria-hidden="true"></i></button>
                                </form>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                            <th>Cập nhật</th>
                                            <th>Ngày tạo</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Bàn học</td>
                                            <td>T1</td>
                                            <td>100.000đ</td>
                                            <td>24</td>
                                            <td>Màu hồng</td>
                                            <td>Nội thất</td>
                                            <td>T@ble</td>
                                            <td>Kim đồng</td>
                                            <td>Hiện</td>
                                            <td>NV01</td>
                                            <td>2011/04/25</td>
                                            <td>2011/04/25</td>
                                            <td class="d-flex">
                                                <a class="btn btn-primary mr-1">Sửa</a>
                                                <a class="btn btn-danger">Xóa</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Bàn học</td>
                                            <td>T1</td>
                                            <td>100.000đ</td>
                                            <td>24</td>
                                            <td>Màu đỏ</td>
                                            <td>Nội thất</td>
                                            <td>T@ble</td>
                                            <td>Kim đồng</td>
                                            <td>Ẩn</td>
                                            <td>NV01</td>
                                            <td>2011/04/25</td>
                                            <td>2011/04/25</td>
                                            <td class="d-flex">
                                                <a class="btn btn-primary mr-1">Sửa</a>
                                                <a class="btn btn-danger">Xóa</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Bàn học</td>
                                            <td>T1</td>
                                            <td>800.000đ</td>
                                            <td>24</td>
                                            <td>Màu đỏ + tặng ghế</td>
                                            <td>Nội thất</td>
                                            <td>T@ble</td>
                                            <td>Kim đồng</td>
                                            <td>Ẩn</td>
                                            <td>NV01</td>
                                            <td>2011/04/25</td>
                                            <td>2011/04/25</td>
                                            <td class="d-flex">
                                                <a class="btn btn-primary mr-1">Sửa</a>
                                                <a class="btn btn-danger">Xóa</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Bàn học</td>
                                            <td>T1</td>
                                            <td>800.000đ</td>
                                            <td>24</td>
                                            <td>Màu đỏ + tặng ghế</td>
                                            <td>Nội thất</td>
                                            <td>T@ble</td>
                                            <td>Kim đồng</td>
                                            <td>Ẩn</td>
                                            <td>NV01</td>
                                            <td>2011/04/25</td>
                                            <td>2011/04/25</td>
                                            <td class="d-flex">
                                                <a class="btn btn-primary mr-1">Sửa</a>
                                                <a class="btn btn-danger">Xóa</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Bàn học</td>
                                            <td>T1</td>
                                            <td>800.000đ</td>
                                            <td>24</td>
                                            <td>Màu đỏ + tặng ghế</td>
                                            <td>Nội thất</td>
                                            <td>T@ble</td>
                                            <td>Kim đồng</td>
                                            <td>Ẩn</td>
                                            <td>NV01</td>
                                            <td>2011/04/25</td>
                                            <td>2011/04/25</td>
                                            <td class="d-flex">
                                                <a class="btn btn-primary mr-1">Sửa</a>
                                                <a class="btn btn-danger">Xóa</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
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