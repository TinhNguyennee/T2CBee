<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-text mx-3" style="font-size: 25px;">T2C<sub class="text-danger">Bee</sub>
                </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Home</span></a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Chung
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/san-pham">
                    <i class="fa-solid fa-box"></i>
                    <span>Sản Phẩm</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/hoa-don">
                    <i class="fa-solid fa-file-invoice-dollar"></i>
                    <span>Hóa Đơn</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/phieu-nhap">
                    <i class="fa-solid fa-boxes-stacked"></i>
                    <span>Phiếu Nhập Hàng</span>
                </a>
            </li>

            <!-- Nav Item - Voucher -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/ma-giam-gia">
                    <i class="fa-solid fa-ticket"></i>
                    <span>Mã Giảm Giá</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Thuộc Tính
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="${pageContext.request.contextPath}/admin/nha-cung-cap">
                    <i class="fa-solid fa-warehouse"></i>
                    <span>Nhà Cung Cấp</span>
                </a>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/danh-muc">
                    <i class="fa-solid fa-list"></i>
                    <span>Danh Mục</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/thuong-hieu">
                    <i class="fa-brands fa-apple"></i>
                    <span>Thương Hiệu</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">
            <div class="sidebar-heading">
                Quản Trị
            </div>
            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/nhan-vien">
                    <i class="fa-solid fa-user-tie"></i>
                    <span>Nhân Viên</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/khach-hang">
                    <i class="fa-solid fa-user"></i>
                    <span>Khách Hàng</span>
                </a>
            </li>

            <hr class="sidebar-divider">
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fa-solid fa-gear"></i>
                    <span>Cài Đặt</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span>Đăng Xuất</span>
                </a>
            </li>
        </ul>