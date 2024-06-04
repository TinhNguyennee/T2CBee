<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>T2CBee - Trang Chủ</title>
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
                        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                Đơn Hàng Chờ Xử Lý</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${countDHCXL}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Đơn Hàng Đang Giao</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${countDHDXL}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                                Đơn Hàng Hoàn Thành
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${countDHHT}</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Đơn Hàng Hủy
                                            </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${countDHH}</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Bình luận Sản Phẩm -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Bình luận Sản Phẩm <sup><span
                                                class="badge badge-danger badge-counter">${listBL.content.size()}</span></sup></h6>
                                </div>
                                <div class="card-body">
                                    <p class="text-danger">${listBL.totalPages <= 0 ? 'Không có kết quả' : ''}</p>
                                    <div class="d-flex">
                                        <form class="d-flex mb-3" action="${pageContext.request.contextPath}/admin/binh-luan/tim-kiem" method="GET">
                                            <input class="form-control mr-2" placeholder="Tìm kiếm..." name="keyword" style="width: 300px;">
                                            <select class="custom-select mr-2" id="orderStatusSelect">
                                                <option value="lasted" ${param.tt == 'lasted' ? 'selected' : ''}>Mới nhất</option>
                                                <option value="oldest" ${param.tt == 'oldest' ? 'selected' : ''}>Cũ nhất</option>
                                                <option value="5" ${param.tt == '5' ? 'selected' : ''}>5 sao</option>
                                                <option value="4" ${param.tt == '4' ? 'selected' : ''}>4 sao</option>
                                                <option value="3" ${param.tt == '3' ? 'selected' : ''}>3 sao</option>
                                                <option value="2" ${param.tt == '2' ? 'selected' : ''}>2 sao</option>
                                                <option value="1" ${param.tt == '1' ? 'selected' : ''}>1 sao</option>
                                                <option value="reported" ${param.tt == 'reported' ? 'selected' : ''}>Khách hàng báo cáo</option>
                                            </select>
                                            <button class="btn btn-primary"><i class="fas fa-search fa-sm" aria-hidden="true"></i></button>
                                        </form>
                                    </div>
                                    <c:if test="${systemError != null}">
                                        <div class="alert alert-danger alert-dismissible">
                                            <strong>Lỗi!</strong> ${systemError}
                                        </div>
                                    </c:if>
                                    <hr>
                                    <%--  Table bình luận--%>
                                    <div class="row">
                                        <c:forEach items="${listBL.content}" var="item">
                                            <div class="mx-4 mb-4 w-100 comment-item">
                                                <div class="row">
                                                    <div class="col-10">
                                                        <div class="">
                                                            <span class="font-weight-bold">${item.nguoiBinhLuan.hoVaTen}</span>

                                                            <span>${item.ngayBinhLuan}</span>
                                                        </div>
                                                        <div class="d-flex mt-1 mb-1">
                                                            <c:forEach begin="1" end="5" var="star">
                                                                <c:choose>
                                                                    <c:when test="${star <= item.danhGia}">
                                                                        <span class="fa fa-star fs-11px orange"></span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="fa fa-star fs-11px"></span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </div>

                                                        <span class="fw-normal">
                                                        ${item.binhLuan}
                                                    </span>
                                                        <br>

                                                        <span class="font-weight-bold">Sản phẩm bình luận:</span>
                                                        <br>
                                                        <img src="${item.sanPham.anhSanPhams[0].url}" alt="${item.sanPham.anhSanPhams[0].url}"
                                                             width="120" height="90" class="img rounded">
                                                    </div>
                                                    <div class="col-2">
                                                        <a class="btn btn-danger w-100 h-100 font-weight-bold" href="${pageContext.request.contextPath}/admin/binh-luan/delete?id=${item.id}">Xóa</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <div class="mx-auto">
                                            <ul class="pagination">
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/trang-chu?p=${listBL.first ? 0 : listBL.number - 1}"><i class="fa-solid fa-chevron-left"></i></a></li>
                                                <c:forEach begin="0" end="${listBL.totalPages <= 0 ? 0 : listBL.totalPages - 1}" var="pageItemNumber">
                                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/trang-chu?p=${pageItemNumber}">${pageItemNumber + 1}</a></li>
                                                </c:forEach>
                                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/trang-chu?p=${listBL.last ? listBL.totalPages - 1 : listBL.number + 1}"><i class="fa-solid fa-chevron-right"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Project Card Example
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">Server Migration <span
                                            class="float-right">20%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Sales Tracking <span
                                            class="float-right">40%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Customer Database <span
                                            class="float-right">60%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar" role="progressbar" style="width: 60%"
                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Payout Details <span
                                            class="float-right">80%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Account Setup <span
                                            class="float-right">Complete!</span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div> -->

                            <!-- Color System -->
                            <!-- <div class="row">
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-primary text-white shadow">
                                        <div class="card-body">
                                            Primary
                                            <div class="text-white-50 small">#4e73df</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-success text-white shadow">
                                        <div class="card-body">
                                            Success
                                            <div class="text-white-50 small">#1cc88a</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-info text-white shadow">
                                        <div class="card-body">
                                            Info
                                            <div class="text-white-50 small">#36b9cc</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-warning text-white shadow">
                                        <div class="card-body">
                                            Warning
                                            <div class="text-white-50 small">#f6c23e</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-danger text-white shadow">
                                        <div class="card-body">
                                            Danger
                                            <div class="text-white-50 small">#e74a3b</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-secondary text-white shadow">
                                        <div class="card-body">
                                            Secondary
                                            <div class="text-white-50 small">#858796</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-light text-black shadow">
                                        <div class="card-body">
                                            Light
                                            <div class="text-black-50 small">#f8f9fc</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-dark text-white shadow">
                                        <div class="card-body">
                                            Dark
                                            <div class="text-white-50 small">#5a5c69</div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->

                        </div>
                        <div class="col-lg-6 mb-4">
                            <!-- Approach -->
                            <!-- <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                                </div>
                                <div class="card-body">
                                    <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
                                        CSS bloat and poor page performance. Custom CSS classes are used to create
                                        custom components and custom utility classes.</p>
                                    <p class="mb-0">Before working with this theme, you should become familiar with the
                                        Bootstrap framework, especially the utility classes.</p>
                                </div>
                            </div> -->

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
    <script>
        document.getElementById('orderStatusSelect').addEventListener('change', function() {
            var selectedValue = this.value;
            var url = '${pageContext.request.contextPath}/admin/trang-chu/binh-luan?tt=' + selectedValue;
            window.location.href = url;
        });
    </script>
</body>

</html>