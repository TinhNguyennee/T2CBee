<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid text-center" style="padding-top: 195px">

    <span class="text-body-secondary fs14px">Tài Khoản Của Tôi</span>
    <h4>Đơn Hàng Của Tôi</h4>

    <hr class="mt-5">




</div>


<div class="container-fluid px-4 ">


    <div class="row">

        <div class="dropdown d-flex justify-content-end">
            <button class="btn btn-secondary btn-sm dropdown-toggle rounded-0 bg-white text-black" type="button"
                data-bs-toggle="dropdown" aria-expanded="false">
                Sắp xếp
            </button>
            <ul class="dropdown-menu rounded-0">
                <li><a class="dropdown-item list-hover" href="#">Mới thêm vào</a></li>
                <li><a class="dropdown-item list-hover" href="#">Giá cao đến thấp</a></li>
                <li><a class="dropdown-item list-hover" href="#">Giá thấp đến cao</a></li>
            </ul>
        </div>

    </div>



    <div class="row">

        <div class="col-3">


            <jsp:include page="../../component/list-info.jsp"></jsp:include>



        </div>



        <div class="col-9">


            <div class="row d-flex">

                <jsp:include page="../../component/cp-product.jsp"></jsp:include>


            </div>

        </div>

    </div>

</div>