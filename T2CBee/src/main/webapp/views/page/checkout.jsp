<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <div class="body-checkout" style="padding-top: 195px; padding-bottom: 50px;">
        <div class="container container-checkout border-0">
            <div class="row row-re d-flex">
                <div class="col-lg-8 col-md-12 col-sm-12">
                    <h1 class="text-center p-3">Thanh Toán</h1>
                    <div class="row">
                        <div class="col-lg-6 col-md-12 col-sm-12">
                            <h3>Thông tin nhận hàng</h3>
                            <div class="mb-3">
                                <input type="tel" class="form-control" id="phone" placeholder="Số điện thoại">
                            </div>

                            <div class="mb-3">
                                <input type="text" class="form-control" id="name" placeholder="Họ và tên">
                            </div>
                            <div class="mb-3">
                                <input type="email" class="form-control" id="email" placeholder="Email(tùy chọn)">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" id="address" placeholder="Địa chỉ">
                            </div>

                            <div class="mb-3">
                                <textarea class="form-control" id="note" placeholder="Ghi chú" rows="3"></textarea>
                            </div>
                        </div>


                        <div class="col-lg-6 col-md-12 col-sm-12 pe-4  ">
                            <h3>Vận chuyển</h3>
                            <div class="form-radio mb-3">
                                <input class="form-check-input" type="radio" name="vanchuyenrdo"
                                    id="vanchuyenrdo">
                                <label class="form-check-label ms-2 " for="vanchuyenrdo">
                                    <span class="text-start"> Giao hàng tận nơi</span> <span class="text-start"> (Miễn
                                        phí)</span>
                                </label>
                            </div>

                            <h3>Thanh toán</h3>
                            <div class="form-radio d-flex text-wrap ">
                                <input class="form-check-input" type="radio" name="thanhtoanrdo"
                                    id="thanhtoanrdo">
                                <label class="form-check-label ms-2 " for="thanhtoanrdo">
                                    <span>Thanh toán khi giao hàng (COD) [Được kiểm tra hàng tại chỗ, không được thử
                                        hàng]</span>
                                </label>
                            </div>


                        </div>

                    </div>

                </div>
                <div class="col-lg-4 col-md-12 col-sm-12">
                    <h3 class="mt-3">Đơn hàng <span>(1 sản phẩm)</span></h3>
                    <hr>

                    <table class="product-table " id="product-table" data-tg-refresh="refreshDiscount">
                        <caption class="visually-hidden">Chi tiết đơn hàng</caption>
                        <thead class="product-table__header">
                            <tr>
                                <th>
                                    <span class="visually-hidden">Ảnh sản phẩm</span>
                                </th>
                                <th>
                                    <span class="visually-hidden">Mô tả</span>
                                </th>
                                <th>
                                    <span class="visually-hidden">Sổ lượng</span>
                                </th>
                                <th>
                                    <span class="visually-hidden">Đơn giá</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr class="checkout-product">
                                <td class="product__image">
                                    <div class="product-thumbnail">
                                        <div class="product-thumbnail__wrapper p-1">
                                            <img src="http://ginza.mallthemes.com/wp-content/uploads/2019/01/home3-banner1-2.jpg"" alt="">
                                    </div>
                                  
                                </div>
                            </td>
                            <th class=" product__description d-flex flex-column ">
                                        <div class=" product__description__name">
                                            <b>Product 1</b>
                                        </div>

                                        <div class="product__description__property">
                                            Hồng
                                        </div>

                                        <div class="product__description__property">
                                            <span class="discount-tag">
                                                <span class="discount-icon"><i class="bi bi-tag"></i></span>
                                                <span class="discount-tag--name">Giảm 10% (-185.000₫)</span>
                                            </span>
                                        </div>

                                        </th>
                                <td class="product__quantity"> 1</td>
                                <td class="product__price">
                                    1.665.000₫
                                </td>
                            </tr>
                            <tr class="checkout-product">
                                <td class="product__image">
                                    <div class="product-thumbnail">
                                        <div class="product-thumbnail__wrapper p-1">
                                            <img src="http://ginza.mallthemes.com/wp-content/uploads/2019/01/home3-banner1-2.jpg"" alt="">
                                    </div>
                                  
                                </div>
                            </td>
                            <th class=" product__description d-flex flex-column ">
                                        <div class=" product__description__name">
                                            <b>Product 1</b>
                                        </div>

                                        <div class="product__description__property">
                                            Hồng
                                        </div>

                                        <div class="product__description__property">
                                            <span class="discount-tag">
                                                <span class="discount-icon"><i class="bi bi-tag"></i></span>
                                                <span class="discount-tag--name">Giảm 10% (-185.000₫)</span>
                                            </span>
                                        </div>

                                        </th>
                                <td class="product__quantity"> 1</td>
                                <td class="product__price">
                                    1.665.000₫
                                </td>
                            </tr>
                            <tr class="checkout-product">
                                <td class="product__image">
                                    <div class="product-thumbnail">
                                        <div class="product-thumbnail__wrapper p-1">
                                            <img src="http://ginza.mallthemes.com/wp-content/uploads/2019/01/home3-banner1-2.jpg"" alt="">
                                    </div>
                                  
                                </div>
                            </td>
                            <th class=" product__description d-flex flex-column ">
                                        <div class=" product__description__name">
                                            <b>Product 1</b>
                                        </div>

                                        <div class="product__description__property">
                                            Hồng
                                        </div>

                                        <div class="product__description__property">
                                            <span class="discount-tag">
                                                <span class="discount-icon"><i class="bi bi-tag"></i></span>
                                                <span class="discount-tag--name">Giảm 10% (-185.000₫)</span>
                                            </span>
                                        </div>

                                        </th>
                                <td class="product__quantity"> 1</td>
                                <td class="product__price">
                                    1.665.000₫
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    <hr>

                    <form class="input-voucher d-flex" action="#">
                        <input type="text" placeholder="Nhập mã giảm giá" name="upon">
                        <button class="btn-red btn-apply">Áp dụng</button>
                    </form>
                    <hr>
                    <div class="total-checkout p-2">
                        <table class="table-total-checkout fs-6 ">
                            <tr>
                                <td>Tạm tính</td>
                                <td>16.500.000đ</td>
                            </tr>
                            <tr>
                                <td>Phí vận chuyển</td>
                                <td>Miễn phí</td>
                            </tr>
                        </table>
                        <hr>

                        <div class="d-flex justify-content-between">
                            <p class="label-total fs-5">Tổng tiền:</p>
                            <p class="total-product-price">16.500.000đ</p>
                        </div>
                    </div>
                    <div class="group-button text-center">
                        <button href="#" class="btn-red btn-order">Đặt hàng</button>
                    </div>
                </div>

            </div>


        </div>
    </div>