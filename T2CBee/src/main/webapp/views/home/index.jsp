<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>T2CBee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&family=Quicksand:wght@300..700&display=swap"
        rel="stylesheet">
</head>

<body>
    <div class="container-fluid position-relative p-0">
    
    
    
 
    
<jsp:include page="../component/header.jsp"></jsp:include>
    
    

    
    
    
    
    
    <div class="container">
        <div class="home-title position-absolute top-50 translate-middle-y z-1">
            <h4>NEW ARRIVALS</h4>
            <h1 class="fw-bold mt-4 mb-5">Forma Milkyway Ivory Chair</h1>
            <a href="" class="fw-bold text-decoration-none">SHOP NOW</a>
        </div>
    </div>
    <div id="carouselExampleIndicators" class="carousel slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../images/home-slider1.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../images/home-slider2.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="../images/home-slider3.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
    </div>
    </div>
    <section class="container-fluid pb-4">
        <div class="home-banner mt-4">
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-product position-relative">
                        <img src="../images/home-banner1-1.jpg" alt="" class="img-fluid">
                        <div class="card-title card-product-title position-absolute pt-5 ps-5">
                            <h5>Cyber Monday</h5>
                            <h3 class="fw-medium">Big Sale 50% Off</h3>
                            <a href="" class="text-decoration-none">View Collection</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card position-relative">
                        <img src="../images/home-banner1-2.jpg" alt="" class="img-fluid">
                        <div class="card-title card-product-title position-absolute pt-5 ps-5">
                            <h5>New Arrivals</h5>
                            <h3 class="fw-medium">Decor Accents</h3>
                            <a href="" class="text-decoration-none">View Collection</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card position-relative">
                        <img src="../images/home-banner1-3.jpg" alt="" class="img-fluid">
                        <div class="card-title card-product-title position-absolute pt-5 ps-5">
                            <h5>Black Fridays</h5>
                            <h3 class="fw-medium">Sale Up To 70% Off</h3>
                            <a href="" class="text-decoration-none">View Collection</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container mt-5 border-top pb-4">
        <div class="row pt-3 pb-4">
            <div class="col-md-3">
                <div class="product-list-title text-center">
                    <h4>OUR BEST</h4>
                    <h1 class="text-secondary fw-bold">PRODUCTS</h1>
                    <div class="list-group rounded-0">
                        <a href="#" class="list-group-item lst list-group-item-action item-active" aria-current="true">
                            The current link item
                        </a>
                        <a href="#" class="list-group-item lst list-group-item-action">A second link item</a>
                        <a href="#" class="list-group-item lst list-group-item-action">A third link item</a>
                        <a href="#" class="list-group-item lst list-group-item-action">A fourth link item</a>
                        <a href="#" class="list-group-item lst list-group-item-action">A fourth link item</a>
                        <a href="#" class="list-group-item lst list-group-item-action">A fourth link item</a>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="product-list-items">
                    <div class="row">
 




					<jsp:include page="../component/cp-product.jsp"></jsp:include>






                        <div class="col-md-4">
                            <div class="card rounded-0">
                                <img src="../images/product06.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <div class="title-head d-flex m-0">
                                        <p class="card-text mb-2">Accessories, Lighting, Outdor</p>
                                        <div class="rating w-100 text-end text-warning">
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star"></i>
                                        </div>
                                    </div>
                                    <p class="card-title mb-2 fw-bold">Eodem modo vel mattis ante facilisis nec
                                        porttitor efficitur</p>
                                    <h5 class="fw-bold product-price">$86.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card rounded-0">
                                <img src="../images/product11.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <div class="title-head d-flex m-0">
                                        <p class="card-text mb-2">Dercor, Furniture</p>
                                        <div class="rating w-100 text-end text-warning">
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star-fill"></i>
                                            <i class="bi bi-star"></i>
                                        </div>
                                    </div>
                                    <p class="card-title mb-2 fw-bold">Laudantium enim fringilla dignissim ipsum primis
                                    </p>
                                    <h5 class="fw-bold product-price">$86.00</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container pb-4 border-top">
        <h4 class="py-3 fw-bold">Featured Products</h4>
        <div class="product-list-items">
            <div class="row">
                <div class="col-md-3">
                    <div class="card rounded-0">
                        <img src="../images/product01.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="title-head d-flex m-0">
                                <p class="card-text mb-2">Accessories, Lighting, Outdor</p>
                                <div class="rating w-100 text-end text-warning">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </div>
                            <p class="card-title mb-2 fw-bold">Mirum est notare tellus eu nibh iaculis pretium</p>
                            <h5 class="fw-bold product-price">$77.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card rounded-0">
                        <img src="../images/product06.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="title-head d-flex m-0">
                                <p class="card-text mb-2">Accessories, Lighting, Outdor</p>
                                <div class="rating w-100 text-end text-warning">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </div>
                            <p class="card-title mb-2 fw-bold">Eodem modo vel mattis ante facilisis nec porttitor
                                efficitur</p>
                            <h5 class="fw-bold product-price">$86.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card rounded-0">
                        <img src="../images/product11.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="title-head d-flex m-0">
                                <p class="card-text mb-2">Dercor, Furniture</p>
                                <div class="rating w-100 text-end text-warning">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </div>
                            <p class="card-title mb-2 fw-bold">Laudantium enim fringilla dignissim ipsum primis</p>
                            <h5 class="fw-bold product-price">$86.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card rounded-0">
                        <img src="../images/product04.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="title-head d-flex m-0">
                                <p class="card-text mb-2">Dercor, Furniture</p>
                                <div class="rating w-100 text-end text-warning">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                            </div>
                            <p class="card-title mb-2 fw-bold">Pellentesque ultricies suscipit est in sapien hendrerit
                            </p>
                            <h5 class="fw-bold product-price">$85.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container-fluid pb-4">
        <div class="home-banner mt-4">
            <div class="row">
                <div class="col-md-6">
                    <div class="card position-relative">
                        <img src="../images/home-banner2-1.jpg" alt="" class="img-fluid">
                        <div class="card-title card-product-title position-absolute pt-5 ps-5">
                            <h3>Cyber Monday</h3>
                            <h1 class="fw-medium mb-5">Big Sale 50% Off</h1>
                            <a href="" class="text-decoration-none">View Collection</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card position-relative">
                        <img src="../images/home-banner2-2.jpg" alt="" class="img-fluid">
                        <div class="card-title card-product-title position-absolute pt-5 ps-5">
                            <h3>New Arrivals</h3>
                            <h1 class="fw-medium mb-5">Decor Accents</h1>
                            <a href="" class="text-decoration-none">View Collection</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="container my-5 pb-4 border-top">
        <h4 class="py-3 fw-bold">Latest Arrivals</h4>
        <div class="product-list-items">
            <div class="row">
                <div class="col-md-3">
                    <div class="card rounded-0">
                        <img src="../images/product01.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="title-head d-flex m-0">
                                <p class="card-text mb-2">Accessories, Lighting, Outdor</p>
                                <div class="rating w-100 text-end text-warning">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </div>
                            <p class="card-title mb-2 fw-bold">Mirum est notare tellus eu nibh iaculis pretium</p>
                            <h5 class="fw-bold product-price">$77.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card rounded-0">
                        <img src="../images/product06.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="title-head d-flex m-0">
                                <p class="card-text mb-2">Accessories, Lighting, Outdor</p>
                                <div class="rating w-100 text-end text-warning">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </div>
                            <p class="card-title mb-2 fw-bold">Eodem modo vel mattis ante facilisis nec porttitor
                                efficitur</p>
                            <h5 class="fw-bold product-price">$86.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card rounded-0">
                        <img src="../images/product11.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="title-head d-flex m-0">
                                <p class="card-text mb-2">Dercor, Furniture</p>
                                <div class="rating w-100 text-end text-warning">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                            </div>
                            <p class="card-title mb-2 fw-bold">Laudantium enim fringilla dignissim ipsum primis</p>
                            <h5 class="fw-bold product-price">$86.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card rounded-0">
                        <img src="../images/product04.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="title-head d-flex m-0">
                                <p class="card-text mb-2">Dercor, Furniture</p>
                                <div class="rating w-100 text-end text-warning">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                            </div>
                            <p class="card-title mb-2 fw-bold">Pellentesque ultricies suscipit est in sapien hendrerit
                            </p>
                            <h5 class="fw-bold product-price">$85.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container my-5 pb-5 border-top border-bottom">
        <h4 class="py-3 fw-bold">Latest Blogs</h4>
        <div class="product-list-items">
            <div class="row">
                <div class="col-md-4">
                    <div class="card rounded-0">
                        <img src="../images/blog01.jpg" class="card-img-top" alt="...">
                        <div class="card-body card-product-body">
                            <p class="card-title mb-2 fw-bold fs-5">Laudantium enim fringilla dignissim ipsum primis</p>
                            <p class="card-text mb-4">Dercor, Furniture</p>
                            <a href="" class="fw-bold text-decoration-none">READ MORE</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card rounded-0">
                        <img src="../images/blog02.jpg" class="card-img-top" alt="...">
                        <div class="card-body card-product-body">
                            <p class="card-title mb-2 fw-bold fs-5">Laudantium enim fringilla dignissim ipsum primis</p>
                            <p class="card-text mb-4">Dercor, Furniture</p>
                            <a href="" class="fw-bold text-decoration-none">READ MORE</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card rounded-0">
                        <img src="../images/blog03.jpg" class="card-img-top" alt="...">
                        <div class="card-body card-product-body">
                            <p class="card-title mb-2 fw-bold fs-5">Laudantium enim fringilla dignissim ipsum primis</p>
                            <p class="card-text mb-4">Dercor, Furniture</p>
                            <a href="" class="fw-bold text-decoration-none">READ MORE</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->





<jsp:include page="../component/footer.jsp"></jsp:include>




    <!-- Footer -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

</body>

</html>