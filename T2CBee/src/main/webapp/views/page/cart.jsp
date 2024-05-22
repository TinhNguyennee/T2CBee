<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Content -->

<div class="container-fluid wrapper-product-detail position-relative" style="padding-top: 195px">



    <jsp:include page="../component/banner.jsp"></jsp:include>



    <section class="container p-5 bg-white position-relative" style="top: -50px;">
        <div class="h-100 py-5">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col" class="h5">Sản phẩm</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">
                                        <div class="d-flex align-items-center">
                                            <img src="../images/product06.jpg" class="img-fluid rounded-3"
                                                style="width: 120px;" alt="Book">
                                            <div class="flex-column ms-4">
                                                <p class="mb-2">Thinking, Fast and Slow</p>
                                                <p class="mb-0">Daniel Kahneman</p>
                                            </div>
                                        </div>
                                    </th>
                                    <td class="align-middle">
                                        <div class="d-flex flex-row">
                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <i class="bi bi-dash-lg"></i>
                                            </button>

                                            <input id="form1" min="0" name="quantity" value="2" type="number"
                                                class="form-control form-control-sm" style="width: 50px;" />

                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <i class="bi bi-plus"></i>
                                            </button>
                                        </div>
                                    </td>
                                    <td class="align-middle">
                                        <p class="mb-0" style="font-weight: 500;">$9.99</p>
                                    </td>
                                    <td class="align-middle">
                                        <a href="#!" style="color: #cecece;"><i class="bi bi-trash"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row" class="border-bottom-0">
                                        <div class="d-flex align-items-center">
                                            <img src="../images/product01.jpg" class="img-fluid rounded-3"
                                                style="width: 120px;" alt="Book">
                                            <div class="flex-column ms-4">
                                                <p class="mb-2">Thinking, Fast and Slow</p>
                                            </div>
                                        </div>
                                    </th>
                                    <td class="align-middle border-bottom-0">
                                        <div class="d-flex flex-row">
                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <i class="bi bi-dash-lg"></i>
                                            </button>

                                            <input id="form1" min="0" name="quantity" value="2" type="number"
                                                class="form-control form-control-sm" style="width: 50px;" />

                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-link px-2"
                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <i class="bi bi-plus"></i>
                                            </button>
                                        </div>
                                    </td>
                                    <td class="align-middle border-bottom-0">
                                        <p class="mb-0" style="font-weight: 500;">$9.99</p>
                                    </td>
                                    <td class="align-middle border-bottom-0">
                                        <a href="#!" style="color: #cecece;"><i class="bi bi-trash"></i></a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="total text-end">
            <h3 class="fw-bold">Tổng tiền <span class="fs-3 fw-bold">$80000</span></h3>
            <div class="total-btn pt-3">
                <a href="/list-product" class="bg-transparent py-3 px-4 mx-3">Tiếp tục mua hàng</a>
                <a href="/checkout" class="bg-transparent py-3 px-4 total-btn-active">Tiến hành thanh toán</a>
            </div>
        </div>
    </section>

</div>

<!-- Content -->