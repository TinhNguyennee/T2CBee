<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>T2C-Bee - Khách Hàng</title>
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
                        <h1 class="h3 mb-0 text-gray-800">Khách Hàng</h1>
                    </div>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Danh Sách Khách Hàng</h6>
                        </div>
                        <div class="card-body">
                            <button class="btn btn-primary mb-3">Lưu</button>
                            <button class="btn btn-danger mb-3">Xóa</button>
                            <div class="row">
                                <div class="col-6">
                                    <label class="form-label">Mã Khách Hàng</label>
                                    <input class="form-control">
                                    <label class="form-label">Họ và tên</label>
                                    <input class="form-control">
                                    <label class="form-label">Mật khẩu</label>
                                    <input class="form-control">
                                    <label class="form-label">Email</label>
                                    <input class="form-control">
                                    <label class="form-label">Số điện thoại</label>
                                    <input class="form-control">
                                    <label class="form-label">Giới tính</label>
                                    <input class="form-control">
                                    <label class="form-label">Địa chỉ</label>
                                    <input class="form-control">
                                    <label class="form-label">Ngày sinh</label>
                                    <input class="form-control">
                                    <label class="form-label">Ngày đăng ký</label>
                                    <input class="form-control" disabled>
                                </div>
                                <div class="col-6">
                                    <form class="d-flex">
                                        <input class="form-control mr-2" placeholder="Tìm kiếm..." style="width: 300px;">
                                        <button class="btn btn-primary"><i class="fas fa-search fa-sm" aria-hidden="true"></i></button>
                                    </form>
                                    <div class="table-responsive mt-4">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>Mã</th>
                                                    <th>Họ và tên</th>
                                                    <th>Email</th>
                                                    <th>SĐT</th>
                                                    <th>Ngày ĐK</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Khách Hàng A</td>
                                                    <td>A@sample.com</td>
                                                    <td>0987654321</td>
                                                    <td>19/05/2024</td>
                                                    <td class="d-flex">
                                                        <a class="btn btn-primary mr-1">Sửa</a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Khách Hàng A</td>
                                                    <td>A@sample.com</td>
                                                    <td>0987654321</td>
                                                    <td>19/05/2024</td>
                                                    <td class="d-flex">
                                                        <a class="btn btn-primary mr-1">Sửa</a>
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