<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <div class="container-fluid p-0 position-fixed start-50 translate-middle-x z-2">
        <header id="header1">
            <nav class="navbar navbar-expand-sm navbar-light bg-white">
                <div class="container p-0">
                    <div class="header-logo fs-1 fw-bold text-dark">
                        <a href="/trang-chu" class="text-decoration-none text-dark">T2C<span
                                class="text-bold fs-3">BEE</span></a>
                    </div>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse " id="navbarSupportedContent">
                        <ul class="navbar-nav fw-bold text-black ps-lg-0 ms-auto" style="padding-left: 0.15rem">
                            <li class="nav-item">
                                <a class="nav-link" href="/trang-chu">TRANG CHỦ</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pb-4" href="#" id="navbarDropdownMenuLink"
                                    role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    SẢN PHẨM
                                </a>
                                <ul class="dropdown-menu mega-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <li class="dropdown-item fw-bold mb-2">DANH MỤC</li>
                                            <li><a class="dropdown-item" href="/danh-sach-san-pham">Danh Sách Sản
                                                    Phẩm</a></li>
                                            <li><a class="dropdown-item" href="#">Nội Thất</a></li>
                                            <li><a class="dropdown-item" href="#">Trang Trí</a></li>
                                            <li><a class="dropdown-item" href="#">Sân Vườn</a></li>
                                            <li><a class="dropdown-item" href="#">Phụ Kiện</a></li>
                                            <li><a class="dropdown-item" href="#">Chiếu Sáng</a></li>
                                            <li><a class="dropdown-item" href="#">Ngoài Trời</a></li>
                                        </div>
                                        <div class="col-md-6">
                                            <li class="dropdown-item fw-bold mb-2">HẠNG MỤC</li>
                                            <li><a class="dropdown-item" href="/list-product">Top Bán Chạy</a></li>
                                            <li><a class="dropdown-item" href="/profile/information">Đang Giảm Giá</a>
                                            </li>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/ve-chung-toi">GIỚI THIỆU</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/ve-chung-toi">VỀ CHÚNG TÔI</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/ve-chung-toi">LIÊN HỆ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
    </div>
    <div class="container position-fixed start-50 translate-middle-x z-2">
        <header id="header2">
            <div class="header-top d-flex justify-content-between align-items-center text-secondary"
                style="height: 100px;">
                <div class="header-contact">
                    <i class="bi bi-facebook pe-3"></i>
                    <i class="bi bi-twitter pe-3"></i>
                    <i class="bi bi-instagram pe-3"></i>
                    <i class="bi bi-linkedin pe-3"></i>
                    <i class="bi bi-rss-fill pe-3"></i>
                </div>
                <div class="header-logo fs-1 fw-bold text-dark">
                    <a href="/trang-chu" class="text-decoration-none text-dark">T2C<span
                            class="text-bold fs-3">BEE</span></a>
                </div>
                <div class="header-person">
                    <div class="position-relative">
                        <i class="bi bi-search pe-3 dropdown-toggle" role="button" id="dropdownMenuButton1"
                            data-bs-toggle="dropdown" aria-expanded="false"></i>
                        <div class=" dropdown-menu position-absolute top-50 end-0" style="width: 250px;"
                            aria-labelledby="dropdownMenuButton1">
                            <input type="text" class="form-control border-0 shadow-none" placeholder="Search...">
                        </div>
                        <i class="bi bi-bag pe-3 position-relative pb-3">
                            <div class="cart-page position-absolute top-100 end-0 p-3 bg-white z-2">
                                <table class="table">
                                    <tr>
                                        <td></td>
                                        <td class="fw-bold fs-6">Sản Phẩm</td>
                                        <td class="fw-bold fs-6">Số Lượng</td>
                                    </tr>
                                    <tr>
                                        <td class="align-middle"><input type="checkbox"
                                                style="width: 20px; height: 20px;"></td>
                                        <td class="cart-info d-flex align-items-center align-middle">
                                            <img src="../../images/product01.jpg" alt="" width="80"
                                                class="m-0 img-fluid">
                                            <div>
                                                <p>Bình hoa trắng cao cấp</p>
                                                <small class="text-danger">1000000Đ</small>
                                                <br>
                                                <a href="" class="fw-bold"">Xóa</a>
                                                </div>
                                            </td>
                                            <!-- <td class=" text-end"><input type="number" ng-model="p.quantity">
                                        </td> -->
                                        <td class="align-middle"><input type="number" max="10" value="1"></td>
                                    </tr>
                                    <tr>
                                        <td class="align-middle"><input type="checkbox"
                                                style="width: 20px; height: 20px;"></td>
                                        <td class="cart-info d-flex align-items-center align-middle">
                                            <img src="../../images/product01.jpg" alt="" width="80"
                                                class="m-0 img-fluid">
                                            <div>
                                                <p>Bình hoa trắng cao cấp</p>
                                                <small class="text-danger">1000000Đ</small>
                                                <br>
                                                <a href="" class="fw-bold"">Xóa</a>
                                                </div>
                                            </td>
                                            <!-- <td class=" text-end"><input type="number" ng-model="p.quantity">
                                        </td> -->
                                        <td class="align-middle"><input type="number" max="10" value="1"></td>
                                    </tr>

                                </table>
                                <div class="total d-flex justify-content-between align-items-center">
                                    <div class="total-price p-2">
                                        <p class="fw-bold m-0">Tổng Tiền: <span class="text-danger">1000000Đ</span>
                                        </p>
                                    </div>
                                    <div class="go-to-cart p-2">
                                        <a href="/gio-hang" class="fw-bold text-decoration-none">TỚI GIỎ HÀNG</a>
                                        <i class="bi bi-arrow-right"></i>
                                    </div>
                                </div>
                            </div>
                        </i>
                        <a href="/thong-tin" class="text-secondary"> <i class="bi bi-person-circle pe-3"></i></a>
                    </div>

                </div>
            </div>
            <nav class="navbar navbar-expand-lg navbar-light" style="padding: 0;">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-center position-relative"
                        id="navbarNavDropdown">
                        <ul class="navbar-nav fw-bold text-black ps-lg-0" style="padding-left: 0.15rem"">
                        <li class=" nav-item">
                            <a class="nav-link" href="/trang-chu">TRANG CHỦ</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle pb-4" href="#" id="navbarDropdownMenuLink"
                                    role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    SẢN PHẨM
                                </a>
                                <ul class="dropdown-menu mega-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <li class="dropdown-item fw-bold mb-2">DANH MỤC</li>
                                            <li><a class="dropdown-item" href="/danh-sach-san-pham">Danh Sách Sản
                                                    Phẩm</a></li>
                                            <li><a class="dropdown-item" href="#">Nội Thất</a></li>
                                            <li><a class="dropdown-item" href="#">Trang Trí</a></li>
                                            <li><a class="dropdown-item" href="#">Sân Vườn</a></li>
                                            <li><a class="dropdown-item" href="#">Phụ Kiện</a></li>
                                            <li><a class="dropdown-item" href="#">Chiếu Sáng</a></li>
                                            <li><a class="dropdown-item" href="#">Ngoài Trời</a></li>
                                        </div>
                                        <div class="col-md-6">
                                            <li class="dropdown-item fw-bold mb-2">HẠNG MỤC</li>
                                            <li><a class="dropdown-item" href="/list-product">Top Bán Chạy</a></li>
                                            <li><a class="dropdown-item" href="/profile/information">Đang Giảm Giá</a>
                                            </li>
                                        </div>
                                    </div>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/ve-chung-toi">GIỚI THIỆU</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/ve-chung-toi">VỀ CHÚNG TÔI</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/ve-chung-toi">LIÊN HỆ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
    </div>


    <script src="../js/header-js.js"></script>