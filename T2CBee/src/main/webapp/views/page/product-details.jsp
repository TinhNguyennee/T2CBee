<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="wrapper-product-detail" style="padding-top: 195px">
    <jsp:include page="../component/banner.jsp"></jsp:include>
    <section class="product-detail">
        <div class="container">
            <div class="detail-wrapper p-5">
                <div class="row">
                    <div class="col-6">
                        <div class="img-main">
                            <img src="${testImg}"
                                alt="">
                        </div>
                        <div class="slide">
                            <div class="img-slider ">
                                <img src="http://ginza.mallthemes.com/wp-content/uploads/2019/01/home3-banner1-2.jpg"
                                    alt="">
                                <img src="http://ginza.mallthemes.com/wp-content/uploads/2019/01/home3-banner1-2.jpg"
                                    alt="">
                                <img src="http://ginza.mallthemes.com/wp-content/uploads/2019/01/home3-banner1-2.jpg"
                                    alt="">
                                <img src="http://ginza.mallthemes.com/wp-content/uploads/2019/01/home3-banner1-2.jpg"
                                    alt="">
                                <img src="http://ginza.mallthemes.com/wp-content/uploads/2019/01/home3-banner1-2.jpg"
                                     alt="">
                            </div>
                            <div class="slide-next">
                                <i class="bi bi-chevron-right"></i>
                            </div>
                            <div class="slide-previous">
                                <i class="bi bi-chevron-left"></i>
                            </div>
                        </div>

                    </div>
                    <div class="col-6">
                        <div class="prod-info">
                            <div class="prod-tittle fw-bold mb-3">Aliquam lobortis pellentesque nisi lectus</div>
                        </div>
                        <div class="prod-star mb-3">
                            <i class="bi bi-star-fill checked"></i>
                            <i class="bi bi-star-fill checked"></i>
                            <i class="bi bi-star-fill checked"></i>
                            <i class="bi bi-star-fill checked"></i>
                            <i class="bi bi-star-fill"></i>
                            <span class="people-comment">(1 customer review)</span>
                        </div>
                        <div class="prod-price  mb-3">
                            $75.00 - $105.00
                        </div>
                        <div class="prod-describe mb-4">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquam expedita, delectus dolorum
                            ex esse reiciendis eum? Magnam, maxime, numquam repudiandae id necessitatibus, neque totam
                            vitae suscipit dolorem nesciunt ipsam ea iste ullam! Minima officia, ratione nihil tenetur
                            minus accusantium tempora!
                        </div>
                        <div class="select-type-product mb-4 ">
                            <label for="type" class="fw-bold mb-3">Phân loại:</label>
                            <select class="form-select rounded-0 w-50" aria-label="Default select example">
                                <option selected>Chọn phân loại </option>
                                <option value="1">Hồng</option>
                                <option value="2">Cam</option>
                                <option value="3">Xanh</option>
                            </select>
                        </div>
                        <div class="hide">
                            <p class="clear-selected">Làm mới</p>
                            <div class="prod-type-price">
                                <span class="price-after me-1">$75.00</span>
                                <span class="price-before text-decoration-line-through text-secondary">$85.00</span>
                            </div>
                            <p class="inventory-quantity">Kho: 190 </p>
                        </div>
                        <div class="group-submit mb-3 ">
                            <input type="number" value="1" min="1"  class="input-quantity p-3 me-3 text-center">
                            <button class="button-cart"><i class="bi bi-basket3"></i>Thêm vào giỏ</button>
                        </div>
                        <div class="group-like-compare">
                            <span class="prod-favorite">
                                <i class="bi bi-heart"></i> Thêm vào yêu thích
                            </span>
                            <span class="prod-compare">
                                <i class="bi bi-arrow-left-right"></i> So sánh
                            </span>
                        </div>
                        <div class="prod-other">
                            <hr>
                            <p class="sku_wrapper">SKU: <a class="sku">N/A</a></p>
                            <p class="posted_in">
                                Categories:
                                <a href="#">Sports</a>,
                                <a href="#">Storage</a>,
                                <a href="#">Toys</a>
                            </p>
                            <p class="tagged_as">Tags: <a href=#">clothes</a>,
                                <a href="#">fashion</a>
                            </p>
                            <hr>
                        </div>
                        <div class="sharing-prod">
                            <p>SHARE THIS PRODUCT <span class="ms-2"><i class="bi bi-facebook"></i></span>
                                <span> <i class="bi bi-twitter"></i></span>
                                <span><i class="bi bi-messenger"></i></span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="container mt-3 ">
                    <!-- Nav tabs -->
                    <ul class="nav cp-nav-product d-flex justify-content-center" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active " data-bs-toggle="tab" href="#description">Description
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#additional"> Additional information</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#reviews">Reviews (1)</a>
                        </li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div id="description" class="container tab-pane active"><br>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est
                                tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis
                                justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id
                                nulla. Donec a neque libero.

                                Pellentesque aliquet, sem eget laoreet ultrices, ipsum metus feugiat sem, quis fermentum
                                turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce
                                aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue
                                nisi non neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor,
                                lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi.
                            </p>
                        </div>
                        <div id="additional" class="container tab-pane fade"><br>
                            <table class="table table-bordered">
                                <tr>
                                    <td>color</td>
                                    <td>Black, White</td>
                                </tr>
                            </table>
                        </div>
                        <div id="reviews" class="container tab-pane fade"><br>
                            <hr>
                            <section class="reviews-list ">
                                <div class="review-detail  row mb-3 ">
                                    <div class="col-1 review-avatar">
                                        <img src="http://ginza.mallthemes.com/wp-content/uploads/2019/01/home3-banner1-2.jpg"
                                            class="rounded-circle" width="50" height="50" alt="User Avatar">
                                    </div>
                                    <div class="col-11 review-info">
                                        <p class="mb-0"><b>John Doe</b><span class="commented-date"> (January 14,
                                                2019)</span></p>
                                        <div class="prod-star mb-3">
                                            <i class="bi bi-star-fill checked"></i>
                                            <i class="bi bi-star-fill checked"></i>
                                            <i class="bi bi-star-fill checked"></i>
                                            <i class="bi bi-star-fill checked"></i>
                                            <i class="bi bi-star-fill"></i>
                                        </div>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed mauris ac
                                            augue ultrices semper. Integer ac lectus at orci dapibus pulvinar. Donec
                                            quis ligula vitae dui feugiat mollis. Morbi sit amet augue velit.
                                        </p>
                                        <div class="d-flex justify-content-between mt-2">
                                            <span class="text-muted">2 months ago</span>
                                            <span class="text-muted"><i class="bi bi-hand-thumbs-up"></i> 2</span>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                </div>
            </div>
        </div>
   
    </section>
</div>