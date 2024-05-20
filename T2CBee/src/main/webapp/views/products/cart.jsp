<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>T2CBee</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="../css/productdetail.css">
        <link rel="stylesheet" href="../css/styles.css">
        <link rel="stylesheet" href="../css/cart.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&family=Quicksand:wght@300..700&display=swap"
            rel="stylesheet">
    </head>

    <body>
        <div class="container-fluid position-relative p-0">








            <jsp:include page="../component/header.jsp"></jsp:include>







        </div>





        <!-- End Header -->

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
                                                    <button data-mdb-button-init data-mdb-ripple-init
                                                        class="btn btn-link px-2"
                                                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                        <i class="bi bi-dash-lg"></i>
                                                    </button>

                                                    <input id="form1" min="0" name="quantity" value="2" type="number"
                                                        class="form-control form-control-sm" style="width: 50px;" />

                                                    <button data-mdb-button-init data-mdb-ripple-init
                                                        class="btn btn-link px-2"
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
                                                    <button data-mdb-button-init data-mdb-ripple-init
                                                        class="btn btn-link px-2"
                                                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                        <i class="bi bi-dash-lg"></i>
                                                    </button>

                                                    <input id="form1" min="0" name="quantity" value="2" type="number"
                                                        class="form-control form-control-sm" style="width: 50px;" />

                                                    <button data-mdb-button-init data-mdb-ripple-init
                                                        class="btn btn-link px-2"
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
                        <button class="bg-transparent py-3 px-4 mx-3">Tiếp tục mua hàng</button>
                        <button class="bg-transparent py-3 px-4 total-btn-active">Tiến hành thanh toán</button>
                    </div>
                </div>
            </section>

        </div>

        <!-- Content -->


        <!-- Footer -->


        <jsp:include page="../component/footer.jsp"></jsp:include>


        <!-- Footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
        <script src="../js/filter-list.js"></script>
    </body>

    </html>