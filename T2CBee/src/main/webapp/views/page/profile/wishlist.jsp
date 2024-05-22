<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container-fluid text-center" style="padding-top: 195px">

    <span class="text-body-secondary fs14px">MY ACCOUNT</span>
    <h4>Wish List</h4>

    <hr class="mt-5">




</div>


<div class="container-fluid px-4 ">


    <div class="row">

        <div class="dropdown d-flex justify-content-end">
            <button class="btn btn-secondary btn-sm dropdown-toggle rounded-0 bg-white text-black" type="button"
                data-bs-toggle="dropdown" aria-expanded="false">
                Sort By
            </button>
            <ul class="dropdown-menu rounded-0">
                <li><a class="dropdown-item list-hover" href="#">Recently Add</a></li>
                <li><a class="dropdown-item list-hover" href="#">Price High to Low</a></li>
                <li><a class="dropdown-item list-hover" href="#">Price Low to High</a></li>
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